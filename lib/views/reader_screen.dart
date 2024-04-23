import 'package:flutter/material.dart';
import 'package:pokemon/cubits/pokemon_cubit.dart';
import 'package:pokemon/exports.dart';
import 'package:pokemon/helpers/dio.dart';
import 'package:pokemon/helpers/endpoint_model.dart';
import 'package:pokemon/helpers/methods_constant.dart';
import 'package:pokemon/helpers/response_model.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/widgets/alert_widget.dart';
import 'package:pokemon/widgets/button_widget.dart';
import 'package:pokemon/widgets/loading_indicator_widget.dart';
import 'package:pokemon/widgets/scaffold_widget.dart';

class PokemonScreen extends StatefulWidget {
  final String name;
  const PokemonScreen({super.key, required this.name});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  late Future<ApiModelsResponse> _apiData;
  late FToast fToast;
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    WidgetsBinding.instance.addPostFrameCallback((_) => fToast.init(context));
    _apiData = apiGet();
  }

  Future<ApiModelsResponse> apiGet() {
    log("GET: ${widget.name}");
    return ApiRequests().send(endpoint: ApiEndpointModel(get: "https://pokeapi.co/api/v2/pokemon-species/${widget.name}"), method: ApiMethods.get).then((value) {
      return value;
    }).then((value) {
      if (value.data.isNotEmpty) {
        inspect(value.data);
        PokemonModel pokemon = PokemonModel.fromJson(value.data);
        BlocProvider.of<PokemonCubit>(context).update(pokemon);
      }
      fToast.showToast(
        type: FToastType.all,
        serverStatus: value.serverStatus,
        responseStatus: value.responseStatus,
        message: value.message,
        position: FToastPosition.snackbarTop,
      );

      return value;
    });
  }

  Widget _body() {
    return const Text('ae');
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
            _apiData = apiGet();
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
