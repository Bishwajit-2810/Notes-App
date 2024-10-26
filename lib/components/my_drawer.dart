import 'package:flutter/material.dart';
import 'package:notes_app/components/my_drawer_tile.dart';
import 'package:notes_app/provider/light.dart';
import 'package:provider/provider.dart';

import '../provider/theme_controller.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeController>(context);
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.note_alt,
                  size: 75,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/note_page");
                },
                child: const MyDrawerTile(
                  title: "Notes",
                  icon: Icons.border_color_outlined,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/theme_page");
                },
                child: MyDrawerTile(
                  title: "Theme",
                  icon: (provider.getTheme() == lightTheme)
                      ? Icons.light_mode
                      : Icons.dark_mode_outlined,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/exit_page");
              },
              child: const MyDrawerTile(
                icon: Icons.login_outlined,
                title: "Exit",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
