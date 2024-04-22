import 'package:flutter/material.dart';

class WidgetsSubTitle extends StatelessWidget {
  final String text;
  final bool center;
  const WidgetsSubTitle({
    super.key,
    required this.text,
    this.center = false,
  });

  @override
  Widget build(BuildContext context) {
    if (center) {
      return Center(
        child: Text(
          text.toUpperCase(),
          // style: Config.styles.titleSub,
          textAlign: TextAlign.center,
        ),
      );
    }
    return Text(
      text.toUpperCase(),
      // style: Config.styles.titleSub,
      textAlign: TextAlign.center,
    );
  }
}
