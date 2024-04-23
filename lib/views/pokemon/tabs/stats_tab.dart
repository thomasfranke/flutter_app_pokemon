import 'package:flutter/material.dart';
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
            TextWidget(
              text: "Base Happiness: ${widget.viewModel.getBaseHappiness()}",
            ),
            TextWidget(
              text: "Capture Rate: ${widget.viewModel.getCaptureRate()}",
            ),
            TextWidget(
              text: "Color: ${widget.viewModel.getColor()}",
            ),
            TextWidget(
              text: "Growth Rate: ${widget.viewModel.getGrowthRate()}",
            ),
            TextWidget(
              text: "Habitat: ${widget.viewModel.getHabitat()}",
            ),
            TextWidget(
              text: "Hatch Counter: ${widget.viewModel.getHatchCounter()}",
            ),
            const TitleWidget(
              text: "Egg Groups",
            ),
            ...widget.viewModel.getEggGroups().map((e) {
              return TextWidget(
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
