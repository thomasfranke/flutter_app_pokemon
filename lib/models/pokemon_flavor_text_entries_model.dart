class PokemonFlavorTextEntriesModel {
  String flavorText;
  String languageName;
  String versionName;

  PokemonFlavorTextEntriesModel({
    required this.flavorText,
    required this.languageName,
    required this.versionName,
  });

  factory PokemonFlavorTextEntriesModel.fromJson(Map<String, dynamic> json) => PokemonFlavorTextEntriesModel(
        flavorText: json["flavor_text"].toString(),
        languageName: json["language"]["name"].toString(),
        versionName: json["version"]["name"].toString(),
      );
}
