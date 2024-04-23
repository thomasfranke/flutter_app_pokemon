import '/exports.dart';

class PokemonHomeApiGet {
  late final PokemonHomeCubit _pokemonHomeCubit;
  // late final FToast _fToast;

  PokemonHomeApiGet({required PokemonHomeCubit pokemonHomeCubit}) : _pokemonHomeCubit = pokemonHomeCubit;

  Future<ApiModelsResponse> get({url = "https://pokeapi.co/api/v2/pokemon/"}) async {
    try {
      final value = await ApiRequests().send(
        endpoint: ApiEndpointModel(get: url),
        method: ApiMethods.get,
      );

      if (value.responseStatus) {
        PokemonHomeModel modelPokemonHome = PokemonHomeModel.fromJson(value.data);
        _pokemonHomeCubit.update(modelPokemonHome);
      }
      return value;
    } catch (e) {
      log('Error fetching data: $e');
      return ApiModelsResponse(serverStatus: false, responseStatus: false, message: 'Error fetching data: $e', statusCode: 500, data: {});
    }
  }
}
