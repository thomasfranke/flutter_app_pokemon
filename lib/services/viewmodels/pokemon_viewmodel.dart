import '/exports.dart';

class PokemonViewModel {
  late final PokemonCubit _pokemonCubit;
  PokemonViewModel({required PokemonCubit pokemonCubit}) : _pokemonCubit = pokemonCubit;
  String getBaseHappiness() => _pokemonCubit.state.baseHappiness.toString();
  List<PokemonFlavorTextEntriesModel> getFlavorTextEntries() => _pokemonCubit.state.flavorTextEntries;
  List<PokemonEggGroupsModel> getEggGroups() => _pokemonCubit.state.eggGroups;
  String getCaptureRate() => _pokemonCubit.state.captureRate.toString();
  String getColor() => _pokemonCubit.state.color;
  String getGrowthRate() => _pokemonCubit.state.growthRate;
  String getHabitat() => _pokemonCubit.state.habitat;
  String getHatchCounter() => _pokemonCubit.state.hatchCounter.toString();
}
