import 'package:flutter/material.dart';
import '/exports.dart';

enum WidgetsAlertColor { green, yellow, red }

class WidgetsAlert extends StatelessWidget {
  final WidgetsAlertColor color;
  final String message;
  final bool darkTheme;

  const WidgetsAlert({
    super.key,
    this.color = WidgetsAlertColor.green,
    this.darkTheme = false,
    this.message = "",
  });

  @override
  Widget build(BuildContext context) {
    late Color colorBorder;
    late Color colorBack;
    late Color colorText;

    if (color == WidgetsAlertColor.green) {
      colorBorder = (darkTheme) ? Colors.green.shade700 : Colors.green.shade300;
      colorBack = (darkTheme) ? Colors.green.shade700.withAlpha(70) : Colors.green.shade300.withAlpha(70);
      colorText = (darkTheme) ? Colors.white.withAlpha(1000) : Colors.black54;
    } else if (color == WidgetsAlertColor.yellow) {
      colorBorder = (darkTheme) ? Colors.yellow.shade800 : Colors.yellow.shade300;
      colorBack = (darkTheme) ? Colors.yellow.shade600.withAlpha(70) : Colors.yellow.shade300.withAlpha(70);
      colorText = (darkTheme) ? Colors.white.withAlpha(1000) : Colors.black54;
    } else {
      colorBorder = (darkTheme) ? Colors.red.shade900 : Colors.red.shade300;
      colorBack = (darkTheme) ? Colors.red.shade900.withAlpha(70) : Colors.red.shade300.withAlpha(70);
      colorText = (darkTheme) ? Colors.white.withAlpha(1000) : Colors.black54;
    }

    colorBorder = ConstantsColors.primary;
    colorBack = ConstantsColors.primary.withAlpha(70);
    colorText = ConstantsColors.white;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: colorBack,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: colorBorder, width: 2),
            ),
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10, right: 15, left: 15),
                  child: Center(
                    child: Text(
                      message,
                      style: TextStyle(fontSize: 20, color: colorText),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
