import 'package:pokemon/cubits/pokemon_home_cubit.dart';
import 'package:pokemon/helpers/dio.dart';
import 'package:pokemon/helpers/endpoint_model.dart';
import 'package:pokemon/helpers/methods_constant.dart';
import 'package:pokemon/helpers/response_model.dart';
import 'package:pokemon/models/pokemon_home_model.dart';

import '/exports.dart';

class ServiceApiGet {
  late final PokemonHomeCubit _pokemonHomeCubit;
  late final FToast _fToast;

  ServiceApiGet({required PokemonHomeCubit pokemonHomeCubit, required FToast fToast})
      : _pokemonHomeCubit = pokemonHomeCubit,
        _fToast = fToast;

  FToast get fToast => _fToast;

  Future<ApiModelsResponse> get() async {
    try {
      final value = await ApiRequests().send(
        endpoint: ApiEndpointModel(get: ""),
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
