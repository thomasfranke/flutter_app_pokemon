import 'package:flutter/material.dart';
import 'package:pokemon/cubits/pokemon_home_cubit.dart';
import 'package:pokemon/cubits/pokemon_list_cubit.dart';
import 'package:pokemon/helpers/dio.dart';
import 'package:pokemon/helpers/endpoint_model.dart';
import 'package:pokemon/helpers/methods_constant.dart';
import 'package:pokemon/helpers/response_model.dart';
import 'package:pokemon/models/pokemon_list_item_model.dart';
import 'package:pokemon/models/pokemon_list_model.dart';
import 'package:pokemon/views/reader_screen.dart';
import 'package:pokemon/widgets/alert_widget.dart';
import 'package:pokemon/widgets/avatar_widget.dart';
import 'package:pokemon/widgets/button_widget.dart';
import 'package:pokemon/widgets/loading_indicator_widget.dart';
import 'package:pokemon/widgets/scaffold_widget.dart';
import '/exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ApiModelsResponse> _apiData;
  late FToast fToast;
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    WidgetsBinding.instance.addPostFrameCallback((_) => fToast.init(context));
    _apiData = apiGet();
  }

  Future<ApiModelsResponse> apiGet({url = "https://pokeapi.co/api/v2/pokemon/"}) {
    log("GET: $url");
    return ApiRequests().send(endpoint: ApiEndpointModel(get: url), method: ApiMethods.get).then((value) {
      return value;
    }).then((value) {
      if (value.data.isNotEmpty) {
        PokemonList pokemon = PokemonList.fromJson(value.data);
        BlocProvider.of<PokemonHomeCubit>(context).update(pokemon);

        List<dynamic> results = value.data['results'];
        List<dynamic> pokemonList = results.map((c) => PokemonListItem.fromJson(c)).toList();
        BlocProvider.of<PokemonListCubit>(context).update(pokemonList);
      }
      fToast.showToast(
        type: FToastType.all,
        serverStatus: value.serverStatus,
        responseStatus: value.responseStatus,
        message: value.message,
        position: FToastPosition.snackbarTop,
      );

      return value;
    });
  }

  Widget _body() {
    return BlocBuilder<PokemonHomeCubit, PokemonList>(builder: (context, pokemonHome) {
      return BlocBuilder<PokemonListCubit, List<dynamic>>(builder: (context, pokemonList) {
        return ListView.builder(
          itemCount: pokemonList.length + 1,
          itemBuilder: (context, index) {
            if (index < pokemonList.length) {
              final pokemon = pokemonList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  leading: CircleAvatarWithLoadingIndicator(imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png"),
                  title: Text(pokemon.name, style: const TextStyle(color: Colors.amber)),
                  subtitle: Text(pokemon.url, style: const TextStyle(color: Colors.amber)),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PokemonScreen(name: pokemon.name))),
                ),
              );
            } else {
              apiGet(url: pokemonHome.next);
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WidgetsScaffold(
      title: "PokeGuide",
      hasDrawer: true,
      body: WidgetsFutureBuilder(
        future: _apiData,
        alert: (message) => WidgetsAlert(message: message),
        button: WidgetsButton(
          onTap: () => setState(() {
            _apiData = apiGet();
          }),
          text: "Try Again",
        ),
        loadingIndicator: const WidgetsLoadingIndicator(),
        builder: (BuildContext context, snapshot) {
          return _body();
        },
      ),
    );
  }
}
