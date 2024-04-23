import 'package:flutter/material.dart';
import '/exports.dart';

class ScaffoldWidget extends StatelessWidget {
  final String title;
  final IconButton action;
  final Widget body;
  final bool hasAppBar;
  final bool hasNavBar;
  final bool hasDrawer;
  final bool hasTitleImage;
  final Widget? bottomNavigationBar;
  final Color backgroundColor;
  const ScaffoldWidget({
    super.key,
    required this.body,
    this.title = "",
    this.bottomNavigationBar,
    this.hasNavBar = false,
    this.hasAppBar = true,
    this.hasDrawer = false,
    this.backgroundColor = const Color(0xff1e1f20),
    this.hasTitleImage = false,
    this.action = const IconButton(icon: Icon(Icons.add), onPressed: null),
  });

  @override
  Widget build(BuildContext context) {
    final appBar = hasAppBar
        ? AppBar(
            iconTheme: const IconThemeData(color: ConstantsColors.primary),
            backgroundColor: ConstantsColors.background,
            title: hasTitleImage ? Center(child: Image.asset(title, fit: BoxFit.fitWidth, height: 50)) : TitleWidget(text: title),
            actions: [action],
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
      bottomNavigationBar: hasNavBar ? bottomNavigationBar : null,
    );
  }
}
