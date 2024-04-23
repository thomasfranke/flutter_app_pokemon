import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '/exports.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Center(
        child: SizedBox(
          width: 40,
          child: LoadingIndicator(
            indicatorType: Indicator.ballPulse,
            colors: [ConstantsColors.primary],
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
