class PokemonList {
  int count;
  String next;
  String previous;

  PokemonList({
    required this.count,
    required this.next,
    required this.previous,
  });

  factory PokemonList.fromJson(Map<String, dynamic> json) => PokemonList(
        count: json["count"],
        next: json["next"].toString(),
        previous: json["previous"].toString(),
      );
}
