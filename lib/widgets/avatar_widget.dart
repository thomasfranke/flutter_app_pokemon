import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/exports.dart';

class AvatarWidget extends StatelessWidget {
  final String imageUrl;

  const AvatarWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'pokemon_image_$imageUrl',
      child: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.grey[300],
        child: ClipOval(
          child: CachedNetworkImage(
            placeholder: (context, url) => const Stack(
              children: [
                CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ConstantsColors.primary)),
                Image(image: AssetImage('assets/pokeball.png')),
              ],
            ),
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 200),
            fadeOutDuration: const Duration(milliseconds: 200),
          ),
        ),
      ),
    );
  }
}
