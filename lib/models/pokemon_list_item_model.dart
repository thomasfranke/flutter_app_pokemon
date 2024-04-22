class PokemonListItem {
  String name;
  String url;

  PokemonListItem({
    required this.name,
    required this.url,
  });

  factory PokemonListItem.fromJson(Map<String, dynamic> json) => PokemonListItem(
        name: json["name"].toString(),
        url: json["url"].toString(),
      );
}
