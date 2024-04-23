class PokemonModel {
  int baseHappiness;

  PokemonModel({
    required this.baseHappiness,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      baseHappiness: json["base_happiness"],
    );
  }
}
