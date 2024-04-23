import 'package:pokemon/models/pokemon_list_item_model.dart';

class PokemonHomeModel {
  int count;
  String next;
  String previous;
  List<PokemonListItem> results;

  PokemonHomeModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokemonHomeModel.fromJson(Map<String, dynamic> json) {
    var pokemonList = json['results'] as List;
    return PokemonHomeModel(
      results: pokemonList.map((c) => PokemonListItem.fromJson(c)).toList(),
      count: json["count"],
      next: json["next"].toString(),
      previous: json["previous"].toString(),
    );
  }

  PokemonHomeModel copyWith({
    int? count,
    String? next,
    String? previous,
    List<PokemonListItem>? results,
  }) {
    return PokemonHomeModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }
}
