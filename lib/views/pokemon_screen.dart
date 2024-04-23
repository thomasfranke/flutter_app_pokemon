import 'package:flutter/material.dart';
import '/exports.dart';

class PokemonScreen extends StatefulWidget {
  final String pokemonName;
  const PokemonScreen({super.key, required this.pokemonName});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  late final PokemonViewModel _viewModel;
  late final PokemonApiGet _apiGet;
  late Future<ApiModelsResponse> _apiData;

  @override
  void initState() {
    super.initState();
    _viewModel = PokemonViewModel(pokemonCubit: BlocProvider.of<PokemonCubit>(context));
    _apiGet = PokemonApiGet(pokemonCubit: BlocProvider.of<PokemonCubit>(context), fToast: FToast());
    _apiData = _apiGet.get(pokemonName: widget.pokemonName);
  }

  Widget _body() {
    return Text(_viewModel.getBaseHappiness());
  }

  @override
  Widget build(BuildContext context) {
    return WidgetsScaffold(
      title: "PokeGuide",
      body: WidgetsFutureBuilder(
        future: _apiData,
        alert: (message) => WidgetsAlert(message: message),
        button: WidgetsButton(
          onTap: () => setState(() {
            _apiData = _apiGet.get(pokemonName: widget.pokemonName);
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
