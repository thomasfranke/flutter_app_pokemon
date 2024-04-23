import '/exports.dart';

class PokemonModel {
  int baseHappiness;
  List<PokemonFlavorTextEntriesModel> flavorTextEntries;
  List<PokemonEggGroupsModel> eggGroups;
  int captureRate;
  String color;
  String growthRate;
  String habitat;
  int hatchCounter;

  PokemonModel({
    required this.baseHappiness,
    required this.flavorTextEntries,
    required this.eggGroups,
    required this.captureRate,
    required this.color,
    required this.growthRate,
    required this.habitat,
    required this.hatchCounter,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    var flavorTextEntriesList = json['flavor_text_entries'] as List;
    var eggGroupsList = json['egg_groups'] as List;
    return PokemonModel(
      baseHappiness: json["base_happiness"],
      flavorTextEntries: flavorTextEntriesList.map((c) => PokemonFlavorTextEntriesModel.fromJson(c)).toList(),
      eggGroups: eggGroupsList.map((c) => PokemonEggGroupsModel.fromJson(c)).toList(),
      captureRate: json["capture_rate"],
      color: json["color"]["name"].toString(),
      growthRate: json["growth_rate"]["name"].toString(),
      habitat: json["habitat"]["name"].toString(),
      hatchCounter: json["hatch_counter"] ?? 0,
    );
  }
}
