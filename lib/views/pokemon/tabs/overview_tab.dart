import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/widgets/styles_text_widget.dart';
import '/exports.dart';

class PokemonOverviewTab extends StatefulWidget {
  final PokemonViewModel viewModel;
  final String imageUrl;
  const PokemonOverviewTab({super.key, required this.viewModel, required this.imageUrl});

  @override
  State<PokemonOverviewTab> createState() => _PokemonOverviewTabState();
}

class _PokemonOverviewTabState extends State<PokemonOverviewTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Hero(
            tag: 'pokemon_image_${widget.imageUrl}',
            child: Center(
              child: CircleAvatar(
                radius: 150,
                backgroundColor: Colors.grey[300],
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          TextWidget(text: widget.viewModel.getFlavorTextEntries()[0].flavorText)
        ],
      ),
    );
  }
}
