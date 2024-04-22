// import 'package:pokemon/cubits/home_cubit.dart';
// import 'package:pokemon/models/pokemon_list_model.dart';

// import '/exports.dart';

// class ServiceApiGet {
//   late final HomeCubit _homeCubit;
//   late final FToast _fToast;

//   ServiceApiGet({required HomeCubit serviceCubit, required FToast fToast})
//       : _homeCubit = serviceCubit,
//         _fToast = fToast;

//   FToast get fToast => _fToast;

//   Future<ApiModelsResponse> get({required int serviceId}) async {
//     try {
//       final value = await ApiRequests().send(
//         endpoint: "",
//         method: ApiMethods.get,
//         query: serviceId.toString(),
//         config: Config.config,
//       );

//       _fToast.showToast(
//         type: FToastType.warning,
//         serverStatus: value.serverStatus,
//         responseStatus: value.responseStatus,
//         message: value.message,
//         position: FToastPosition.snackbarTop,
//       );

//       if (value.responseStatus) {
//         final modelService = PokemonList.fromJson(value.data['service']);
//         _homeCubit.update(modelService);
//       }
//       return value;
//     } catch (e) {
//       log('Error fetching data: $e');
//       return ApiModelsResponse(serverStatus: false, responseStatus: false, message: 'Error fetching data: $e', statusCode: 500, data: {});
//     }
//   }
// }
