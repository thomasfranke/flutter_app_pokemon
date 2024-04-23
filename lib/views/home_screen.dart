import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import '/exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PokemonHomeViewModel _viewModel;
  late final PokemonHomeApiGet _apiGet;
  late Future<ApiModelsResponse> _apiData;

  @override
  void initState() {
    super.initState();
    _viewModel = PokemonHomeViewModel(pokemonHomeCubit: BlocProvider.of<PokemonHomeCubit>(context));
    _apiGet = PokemonHomeApiGet(pokemonHomeCubit: BlocProvider.of<PokemonHomeCubit>(context), fToast: FToast());
    _apiData = _apiGet.get();
  }

  Widget _body() {
    return ListView.builder(
      itemCount: _viewModel.getResults().length + 1,
      itemBuilder: (context, index) {
        log('Size: ${_viewModel.getResults().length}');
        if (index < _viewModel.getResults().length) {
          final PokemonHomeItem pokemon = _viewModel.getResults()[index];
          return _listTile(pokemon: pokemon, index: index);
        } else {
          _apiData = _apiGet.get(url: _viewModel.getNext());
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _listTile({required PokemonHomeItem pokemon, required int index}) {
    return Bounceable(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PokemonScreen(pokemonName: pokemon.name))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: const Color(0xFF281b1b),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const SizedBox(width: 10),
              CircleAvatarWithLoadingIndicator(imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png"),
              const SizedBox(width: 30),
              Text(pokemon.name.toUpperCase()[0] + pokemon.name.substring(1),
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WidgetsScaffold(
      title: "assets/logo.png",
      hasTitleImage: true,
      hasDrawer: true,
      body: WidgetsFutureBuilder(
        future: _apiData,
        alert: (message) => WidgetsAlert(message: message),
        button: WidgetsButton(
          onTap: () => setState(() {
            _apiData = _apiGet.get();
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
