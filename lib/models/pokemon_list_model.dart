class PokemonList {
  int count;
  String next;
  String previous;
  List<PokemonList> results;

  PokemonList({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokemonList.fromJson(Map<String, dynamic> json) => PokemonList(
        count: json["count"],
        next: json["next"].toString(),
        previous: json["previous"].toString(),
        results: List<PokemonList>.from(json["results"].map((x) => PokemonList.fromJson(x))),
      );
}
