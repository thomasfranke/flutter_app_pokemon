import '/exports.dart';

class PokemonListCubit extends Cubit<List<dynamic>> {
  PokemonListCubit() : super([]);

  void update(List<dynamic> newList) {
    final List<dynamic> currentList = state;
    emit([...currentList, ...newList]);
  }
}
