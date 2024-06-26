import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import '/exports.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool altButton;

  const ButtonWidget({
    super.key,
    this.altButton = false,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          decoration: BoxDecoration(
            color: altButton ? ConstantsColors.primary.withOpacity(0.05) : ConstantsColors.primary,
            borderRadius: BorderRadius.circular(8.0),
            border: altButton ? Border.all(color: ConstantsColors.primary) : null,
          ),
          child: Center(
            // child: Text(text.toUpperCase(), style: Theme.of(context).textTheme.bodyMedium),
            child: Text(text.toUpperCase()),
          ),
        ),
      ),
    );
  }
}
