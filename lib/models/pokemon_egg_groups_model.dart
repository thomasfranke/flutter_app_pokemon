class PokemonEggGroupsModel {
  String name;

  PokemonEggGroupsModel({
    required this.name,
  });

  factory PokemonEggGroupsModel.fromJson(Map<String, dynamic> json) => PokemonEggGroupsModel(
        name: json["name"].toString(),
      );
}
