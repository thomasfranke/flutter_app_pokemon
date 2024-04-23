import 'package:pokemon/cubits/pokemon_cubit.dart';

class PokemonViewModel {
  late final PokemonCubit _pokemonCubit;

  PokemonViewModel({required PokemonCubit pokemonCubit}) : _pokemonCubit = pokemonCubit;

  String getBaseHappiness() => _pokemonCubit.state.baseHappiness.toString();
}
