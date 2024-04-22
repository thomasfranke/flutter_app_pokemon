import 'package:pokemon/models/pokemon_model.dart';

import '/exports.dart';

class PokemonCubit extends Cubit<PokemonModel> {
  PokemonCubit() : super(PokemonModel(name: ""));
  void update(PokemonModel newList) => emit(newList);
}
