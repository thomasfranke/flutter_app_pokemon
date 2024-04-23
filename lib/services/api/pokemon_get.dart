import '/exports.dart';

class PokemonApiGet {
  late final PokemonCubit _pokemonCubit;

  PokemonApiGet({required PokemonCubit pokemonCubit}) : _pokemonCubit = pokemonCubit;

  Future<ApiModelsResponse> get({required String pokemonName}) async {
    try {
      final value = await ApiRequests().send(
        endpoint: ApiEndpointModel(get: "https://pokeapi.co/api/v2/pokemon-species/$pokemonName"),
        method: ApiMethods.get,
      );

      if (value.responseStatus) {
        final modelPokemon = PokemonModel.fromJson(value.data);
        _pokemonCubit.update(modelPokemon);
      }
      return value;
    } catch (e) {
      log('Error fetching data: $e');
      return ApiModelsResponse(serverStatus: false, responseStatus: false, message: 'Error fetching data: $e', statusCode: 500, data: {});
    }
  }
}
