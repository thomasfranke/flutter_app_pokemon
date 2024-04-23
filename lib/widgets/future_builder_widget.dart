import 'package:flutter/material.dart';
import '/exports.dart';

class WidgetsFutureBuilder extends StatelessWidget {
  final dynamic future;
  final Widget loadingIndicator;
  final Widget alertBox;
  final Widget Function(String message) alert;
  final Widget button;
  final Widget Function(BuildContext, AsyncSnapshot) builder;

  const WidgetsFutureBuilder({
    required this.alert,
    required this.button,
    super.key,
    this.loadingIndicator = const LoadingIndicatorWidget(),
    this.alertBox = const AlertWidget(message: ""),
    required this.future,
    required this.builder,
  });

  @override
  FutureBuilder build(BuildContext context) {
    log('* WidgetsFutureBuilder');
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        // Go:
        if (snapshot.hasData) {
          if (snapshot.data.serverStatus == true) {
            log('* WidgetsFutureBuilder | Data | SUCCESS');
            return builder(context, snapshot);
          } else {
            log('* WidgetsFutureBuilder | Data | STATUS: FAIL');
            return buildErrorWidget(context, snapshot.data.message);
          }
        }
        // Error:
        if (snapshot.hasError) {
          log('* WidgetsFutureBuilder | Error');
          return buildErrorWidget(context, "Something wrong happened! Please try again.");
        }
        log('* WidgetsFutureBuilder: Loading...');
        return loadingIndicator;
      },
    );
  }

  Widget buildErrorWidget(BuildContext context, String errorMessage) {
    log('* WidgetsFutureBuilder | Error: $errorMessage');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 25),
          alert(errorMessage),
          const SizedBox(height: 25),
          button,
        ],
      ),
    );
  }
}
