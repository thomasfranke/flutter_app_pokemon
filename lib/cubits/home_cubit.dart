import 'package:pokemon/models/pokemon_list_model.dart';

import '/exports.dart';

class HomeCubit extends Cubit<PokemonList> {
  HomeCubit() : super(PokemonList(count: 0, next: "", previous: "", results: []));
  void update(PokemonList newList) => emit(newList);
}

class PokemonListCubit extends Cubit<List<dynamic>> {
  PokemonListCubit() : super([]);
  void update(List<dynamic> newList) => emit(newList);
}
