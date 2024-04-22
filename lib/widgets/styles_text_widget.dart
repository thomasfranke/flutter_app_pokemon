import 'package:flutter/material.dart';

class WidgetsText extends StatelessWidget {
  final String text;
  final EdgeInsets padding;
  final TextAlign textAlign;
  const WidgetsText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.center,
    this.padding = const EdgeInsets.all(8.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        textAlign: textAlign,
        // style: Theme.of(context).textTheme.bodyLarge,
        // style: Config.styles.text,
      ),
    );
  }
}
