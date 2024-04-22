class PokemonModel {
  String name;

  PokemonModel({
    required this.name,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        name: json["name"].toString(),
      );
}
