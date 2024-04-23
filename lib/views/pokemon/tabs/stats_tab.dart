import 'package:flutter/material.dart';
import 'package:pokemon/widgets/styles_text_widget.dart';
import '/exports.dart';

class PokemonStatsTab extends StatefulWidget {
  final PokemonViewModel viewModel;
  const PokemonStatsTab({super.key, required this.viewModel});

  @override
  State<PokemonStatsTab> createState() => _PokemonStatsTabState();
}

class _PokemonStatsTabState extends State<PokemonStatsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            WidgetsText(
              text: "Base Happiness: ${widget.viewModel.getBaseHappiness()}",
            ),
            WidgetsText(
              text: "Capture Rate: ${widget.viewModel.getCaptureRate()}",
            ),
            WidgetsText(
              text: "Color: ${widget.viewModel.getColor()}",
            ),
            WidgetsText(
              text: "Growth Rate: ${widget.viewModel.getGrowthRate()}",
            ),
            WidgetsText(
              text: "Habitat: ${widget.viewModel.getHabitat()}",
            ),
            WidgetsText(
              text: "Hatch Counter: ${widget.viewModel.getHatchCounter()}",
            ),
            const WidgetsTitle(
              text: "Egg Groups",
            ),
            ...widget.viewModel.getEggGroups().map((e) {
              return WidgetsText(
                text: e.name,
                padding: const EdgeInsets.only(top: 8.0),
              );
            }),
          ],
        ),
      ),
    );
  }
}
