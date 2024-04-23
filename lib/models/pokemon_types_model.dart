class PokemonTypeModel {
  int slot;
  String name;
  String url;

  PokemonTypeModel({
    required this.slot,
    required this.name,
    required this.url,
  });

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) => PokemonTypeModel(
        slot: json["slot"],
        name: json["type"]["name"].toString(),
        url: json["type"]["url"].toString(),
      );
}
