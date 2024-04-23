import '/exports.dart';

class PokemonCubit extends Cubit<PokemonModel> {
  PokemonCubit() : super(PokemonModel(baseHappiness: 0));
  void update(PokemonModel newList) => emit(newList);
}
