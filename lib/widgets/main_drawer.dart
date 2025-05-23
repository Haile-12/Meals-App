import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.primaryContainer,
                  // ignore: deprecated_member_use
                  colorScheme.primaryContainer.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.fastfood, size: 48, color: colorScheme.primary),
                const SizedBox(width: 18),
                Text(
                  'Cooking Up!',
                  style: textTheme.titleLarge!.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: colorScheme.onSurface,
            ),
            title: Text(
              'Meals',
              style: textTheme.titleSmall!.copyWith(
                color: colorScheme.onSurface,
                fontSize: 24,
              ),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.videocam, // Video camera icon
              size: 26,
              color: colorScheme.onSurface,
            ),
            title: Text(
              'Videos',
              style: textTheme.titleSmall!.copyWith(
                color: colorScheme.onSurface,
                fontSize: 24,
              ),
            ),
            onTap: () {
              onSelectScreen('videos'); // Call _setScreen with 'videos'
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: colorScheme.onSurface,
            ),
            title: Text(
              'Filters',
              style: textTheme.titleSmall!.copyWith(
                color: colorScheme.onSurface,
                fontSize: 24,
              ),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline,
              size: 26,
              color: colorScheme.onSurface,
            ),
            title: Text(
              'About App',
              style: textTheme.titleSmall!.copyWith(
                color: colorScheme.onSurface,
                fontSize: 24,
              ),
            ),
            onTap: () {
              onSelectScreen('info');
            },
          ),

          // New: Developer Menu item
          ListTile(
            leading: Icon(
              Icons.developer_mode, // Developer icon
              size: 26,
              color: colorScheme.onSurface,
            ),
            title: Text(
              'Developer Info',
              style: textTheme.titleSmall!.copyWith(
                color: colorScheme.onSurface,
                fontSize: 24,
              ),
            ),
            onTap: () {
              onSelectScreen('developer'); // Call _setScreen with 'developer'
            },
          ),
        ],
      ),
    );
  }
}
