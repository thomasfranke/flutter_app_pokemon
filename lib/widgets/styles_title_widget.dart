import 'package:flutter/material.dart';

class WidgetsTitle extends StatelessWidget {
  final String text;
  final bool center;
  final bool appBar;
  const WidgetsTitle({
    super.key,
    required this.text,
    this.center = false,
    this.appBar = false,
  });

  @override
  Widget build(BuildContext context) {
    if (center) {
      return Center(
        child: Text(
          text.toUpperCase(),
          // style: appBar ? Config.styles.titleAppBar : Config.styles.title,
          textAlign: TextAlign.center,
        ),
      );
    }
    return Text(
      text.toUpperCase(),
      // style: appBar ? Config.styles.titleAppBar : Config.styles.title,
      textAlign: TextAlign.center,
    );
  }
}
