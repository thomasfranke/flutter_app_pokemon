import '/exports.dart';

class PokemonHomeApiGet {
  late final PokemonHomeCubit _pokemonHomeCubit;
  late final FToast _fToast;

  PokemonHomeApiGet({required PokemonHomeCubit pokemonHomeCubit, required FToast fToast})
      : _pokemonHomeCubit = pokemonHomeCubit,
        _fToast = fToast;

  FToast get fToast => _fToast;

  Future<ApiModelsResponse> get({url = "https://pokeapi.co/api/v2/pokemon/"}) async {
    try {
      final value = await ApiRequests().send(
        endpoint: ApiEndpointModel(get: url),
        method: ApiMethods.get,
      );

      _fToast.showToast(
        type: FToastType.all,
        serverStatus: value.serverStatus,
        responseStatus: value.responseStatus,
        message: value.message,
        position: FToastPosition.snackbarTop,
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
