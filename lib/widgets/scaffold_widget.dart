import 'package:flutter/material.dart';
import '/exports.dart';

class WidgetsScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool hasAppBar;
  final bool hasNavBar;
  final bool hasDrawer;
  final Widget? bottomNavigationBar;
  final Color backgroundColor;
  final FloatingActionButton fab;
  final bool hasFab;
  const WidgetsScaffold({
    super.key,
    this.fab = const FloatingActionButton(onPressed: null, child: Icon(Icons.add)),
    this.hasFab = false,
    required this.body,
    this.title = "",
    this.bottomNavigationBar,
    this.hasNavBar = false,
    this.hasAppBar = true,
    this.hasDrawer = false,
    this.backgroundColor = const Color(0xff1e1f20),
  });

  @override
  Widget build(BuildContext context) {
    final appBar = hasAppBar
        ? AppBar(
            iconTheme: const IconThemeData(color: ConstantsColors.primary),
            backgroundColor: ConstantsColors.background,
            title: WidgetsTitle(text: title, appBar: true),
          )
        : null;

    return Scaffold(
      extendBody: true,
      appBar: appBar,
      drawer: hasDrawer ? const WidgetsHomeDrawer() : null,
      backgroundColor: ConstantsColors.background,
      body: SafeArea(
        top: false,
        bottom: false,
        child: body,
      ),
      floatingActionButton: hasFab ? fab : null,
      bottomNavigationBar: hasNavBar ? bottomNavigationBar : null,
    );
  }
}
