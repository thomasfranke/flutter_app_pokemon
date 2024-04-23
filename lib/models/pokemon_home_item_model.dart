class PokemonHomeItem {
  String name;
  String url;

  PokemonHomeItem({
    required this.name,
    required this.url,
  });

  factory PokemonHomeItem.fromJson(Map<String, dynamic> json) => PokemonHomeItem(
        name: json["name"].toString(),
        url: json["url"].toString(),
      );
}
