import 'package:flutter/material.dart';
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
    return BlocBuilder<PokemonHomeCubit, PokemonHomeModel>(builder: (context, pokemonHome) {
      return ListView.builder(
        itemCount: pokemonHome.results.length + 1,
        itemBuilder: (context, index) {
          if (index < pokemonHome.results.length) {
            final pokemon = pokemonHome.results[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                leading: CircleAvatarWithLoadingIndicator(imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png"),
                title: Text(pokemon.name, style: const TextStyle(color: Colors.amber)),
                subtitle: Text(pokemon.url, style: const TextStyle(color: Colors.amber)),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PokemonScreen(pokemonName: pokemon.name))),
              ),
            );
          } else {
            _apiData = _apiGet.get();
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
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
