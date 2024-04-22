import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon/cubits/home_cubit.dart';
import 'package:pokemon/helpers/dio.dart';
import 'package:pokemon/helpers/methods_constant.dart';
import 'package:pokemon/helpers/response_model.dart';
import 'package:pokemon/models/pokemon_abilities_model.dart';
import 'package:pokemon/widgets/alert_widget.dart';
import 'package:pokemon/widgets/button_widget.dart';
import 'package:pokemon/widgets/loading_indicator_widget.dart';
import 'package:pokemon/widgets/scaffold_widget.dart';
import '../exports.dart';

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

  Future<ApiModelsResponse> apiGet() {
    return ApiRequests().send(endpoint: Endpoints.home, method: ApiMethods.get).then((value) {
      return value;
    }).then((value) {
      if (value.data.isNotEmpty) {
        List<dynamic> results = value.data['results'];
        List<dynamic> appointments = results.map((c) => PokemonAbilititesList.fromJson(c)).toList();
        inspect(appointments);
        BlocProvider.of<PokemonListCubit>(context).update(appointments);
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

  bool _isLoading = false;

  Widget _body() {
    return WidgetsScaffold(
      title: "PokeGuide",
      hasDrawer: true,
      body: ListView.builder(
        itemBuilder: (context, index) {
          final state = BlocProvider.of<PokemonListCubit>(context).state;
          if (index < state.length) {
            final pokemon = state[index];
            return ListTile(
              title: Text(
                pokemon.name,
                style: const TextStyle(color: Colors.amber),
              ),
              subtitle: Text(
                pokemon.url,
                style: const TextStyle(color: Colors.amber),
              ),
            );
          } else {
            if (_isLoading) {
              // Exibe o indicador de carregamento
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              // Não exibe nada quando não estiver carregando
              return const SizedBox.shrink();
            }
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WidgetsFutureBuilder(
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
    );
  }
}
