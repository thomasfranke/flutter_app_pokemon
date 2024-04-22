import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import '/exports.dart';

class WidgetsHomeDrawer extends StatefulWidget {
  const WidgetsHomeDrawer({super.key});

  @override
  State<WidgetsHomeDrawer> createState() => _WidgetsHomeDrawerState();
}

class _WidgetsHomeDrawerState extends State<WidgetsHomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ConstantsColors.barBottom,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 100),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ConstantsColors.primary.withOpacity(0.15),
              ),
              child: Bounceable(
                onTap: () => (),
                child: const ListTile(leading: Icon(Icons.favorite_border, color: ConstantsColors.primary), title: Text('Rate at the App Store')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
