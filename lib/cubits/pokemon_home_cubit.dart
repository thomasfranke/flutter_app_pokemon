import 'package:pokemon/models/pokemon_list_model.dart';

import '/exports.dart';

class PokemonHomeCubit extends Cubit<PokemonList> {
  PokemonHomeCubit() : super(PokemonList(count: 0, next: "", previous: ""));
  void update(PokemonList newList) => emit(newList);
}
