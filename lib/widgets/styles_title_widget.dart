import 'package:flutter/material.dart';

class WidgetsTitle extends StatelessWidget {
  final String text;
  final bool center;
  const WidgetsTitle({
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
        color: Colors.red,
      ),
    );
  }
}
