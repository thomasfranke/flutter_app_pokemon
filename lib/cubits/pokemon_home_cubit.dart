import '/exports.dart';

class PokemonHomeCubit extends Cubit<PokemonHomeModel> {
  PokemonHomeCubit() : super(PokemonHomeModel(count: 0, next: "", previous: "", results: []));

  void update(PokemonHomeModel newList) {
    emit(state.copyWith(
      count: newList.count,
      next: newList.next,
      previous: newList.previous,
      results: [...state.results, ...newList.results],
    ));
  }
}
