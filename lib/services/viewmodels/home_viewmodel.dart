import '/exports.dart';

class PokemonHomeViewModel {
  late final PokemonHomeCubit _pokemonHomeCubit;

  PokemonHomeViewModel({required PokemonHomeCubit pokemonHomeCubit}) : _pokemonHomeCubit = pokemonHomeCubit;

  String getNext() => _pokemonHomeCubit.state.next;
  String getPrevious() => _pokemonHomeCubit.state.previous;
  String getCount() => _pokemonHomeCubit.state.count.toString();
  List<dynamic> getResults() => _pokemonHomeCubit.state.results;
}
