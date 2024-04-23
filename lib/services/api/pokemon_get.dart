import 'package:pokemon/cubits/pokemon_cubit.dart';
import 'package:pokemon/helpers/dio.dart';
import 'package:pokemon/helpers/endpoint_model.dart';
import 'package:pokemon/helpers/methods_constant.dart';
import 'package:pokemon/helpers/response_model.dart';
import 'package:pokemon/models/pokemon_model.dart';

import '/exports.dart';

class ServiceApiGet {
  late final PokemonCubit _pokemonCubit;
  late final FToast _fToast;

  ServiceApiGet({required PokemonCubit pokemonCubit, required FToast fToast})
      : _pokemonCubit = pokemonCubit,
        _fToast = fToast;

  FToast get fToast => _fToast;

  Future<ApiModelsResponse> get({required String pokemonName}) async {
    try {
      final value = await ApiRequests().send(
        endpoint: ApiEndpointModel(get: "https://pokeapi.co/api/v2/pokemon-species/$pokemonName"),
        method: ApiMethods.get,
      );

      _fToast.showToast(
        type: FToastType.warning,
        serverStatus: value.serverStatus,
        responseStatus: value.responseStatus,
        message: value.message,
        position: FToastPosition.snackbarTop,
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
