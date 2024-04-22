import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CircleAvatarWithLoadingIndicator extends StatelessWidget {
  final String imageUrl;

  const CircleAvatarWithLoadingIndicator({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey[300],
      child: ClipOval(
        child: CachedNetworkImage(
          placeholder: (context, url) => const Stack(
            children: [
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red)),
              Image(image: AssetImage('assets/pokeball.png')),
            ],
          ),
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          width: 80,
          height: 80,
          fadeInDuration: const Duration(milliseconds: 200),
          fadeOutDuration: const Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
