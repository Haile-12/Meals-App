import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Ensure this is imported for textTheme consistency

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = GoogleFonts.latoTextTheme(Theme.of(context).textTheme);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About MealApp',
          style: textTheme.headlineSmall!.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor:
            colorScheme.surfaceContainer, // A slightly elevated surface color
        foregroundColor: colorScheme.onSurface, // Color for icons and text
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Name and Version
            Card(
              color:
                  colorScheme
                      .surfaceContainerHigh, // Slightly darker card for contrast
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.restaurant_menu,
                          size: 36,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'MealApp',
                          style: textTheme.headlineMedium!.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Version: 1.0.0',
                      style: textTheme.titleMedium!.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'A delightful culinary companion for exploring and discovering recipes.',
                      style: textTheme.bodyLarge!.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Functionality Section
            _buildInfoCard(
              context,
              icon: Icons.lightbulb_outline,
              title: 'Core Functionality',
              content:
                  'MealApp allows you to browse a wide variety of meals categorized by cuisine and type. You can explore detailed recipes, including ingredients and step-by-step instructions, to help you prepare delicious dishes at home.',
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),

            // How to Use Section
            _buildInfoCard(
              context,
              icon: Icons.touch_app_outlined,
              title: 'How to Use',
              content:
                  'Navigate through different food categories using the intuitive interface. Tap on any meal to view its full recipe, including preparation time, complexity, and dietary information. Enjoy cooking!',
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),

            // Licenses Section
            _buildInfoCard(
              context,
              icon: Icons.gavel_outlined,
              title: 'Licenses & Legal',
              content:
                  'This application is developed under a proprietary license. All third-party libraries and assets used adhere to their respective open-source licenses (e.g., Flutter framework, Google Fonts).',
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),

            // Related Info Section
            _buildInfoCard(
              context,
              icon: Icons.info_outline,
              title: 'Related Information',
              content:
                  'Built with Flutter for a beautiful cross-platform experience. Meal data is sourced from a d/t collection of popular recipes for demonstration purposes. Images are sourced from google  and Commons and other public domain repositories.',
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),
            const SizedBox(height: 24),
            // Copyright Section
            _buildInfoCard(
              context,
              icon: Icons.copyright_outlined,
              title: 'Copyright',
              content: '© 2025 MealApp. All rights reserved.',
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),

            // A little extra space at the bottom
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Helper method to build consistent info cards
  Widget _buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String content,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
  }) {
    return Card(
      color:
          colorScheme
              .surfaceContainerLow, // A lighter card surface for contrast
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 28, color: colorScheme.secondary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: textTheme.titleLarge!.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: textTheme.bodyMedium!.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
