import 'package:flutter/material.dart';
import '/exports.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  final bool center;
  const TitleWidget({
    super.key,
    required this.text,
    this.center = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      textAlign: center ? TextAlign.center : TextAlign.left,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: ConstantsColors.primary,
      ),
    );
  }
}
