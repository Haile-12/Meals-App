import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart'; // Import your dummy meals data
import 'package:meals/screens/video_player.dart'; // Import the new video player screen

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Filter meals that have a video URL
    final mealsWithVideos =
        dummyMeals
            .where((meal) => meal.videoUrl != null && meal.videoUrl!.isNotEmpty)
            .toList();

    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.videocam_off,
            size: 80,
            // ignore: deprecated_member_use
            color: colorScheme.onSurfaceVariant.withOpacity(0.6),
          ),
          const SizedBox(height: 16),
          Text(
            'No videos available yet!',
            style: textTheme.titleLarge!.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          Text(
            'Check back later for more cooking videos.',
            style: textTheme.bodyMedium!.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    if (mealsWithVideos.isNotEmpty) {
      content = ListView.builder(
        padding: const EdgeInsets.all(12.0), // Slightly increased padding
        itemCount: mealsWithVideos.length,
        itemBuilder: (context, index) {
          final meal = mealsWithVideos[index];
          return Card(
            color: colorScheme.surfaceContainerLow,
            elevation: 4, // Increased elevation for a more prominent card
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // More rounded corners
            ),
            clipBehavior:
                Clip.antiAliasWithSaveLayer, // Ensure content clips to rounded corners
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (ctx) => VideoPlayerScreen(
                          videoUrl: meal.videoUrl!,
                          videoTitle: 'Preparing ${meal.title}',
                        ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ), // Padding inside ListTile
                child: ListTile(
                  leading: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30, // Increased radius for better visibility
                        // ignore: deprecated_member_use
                        backgroundColor: colorScheme.primary.withOpacity(
                          0.1,
                        ), // Subtle background
                        backgroundImage: NetworkImage(
                          meal.imageUrl,
                        ), // Use meal image
                        onBackgroundImageError: (exception, stackTrace) {
                          // Handle image loading errors
                        },
                      ),
                      Icon(
                        Icons.play_circle_fill,
                        // ignore: deprecated_member_use
                        color: colorScheme.primary.withOpacity(
                          0.8,
                        ), // Play icon with primary color
                        size: 36, // Larger play icon
                      ),
                    ],
                  ),
                  title: Text(
                    'Preparing ${meal.title}',
                    style: textTheme.titleMedium!.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2, // Allow title to wrap
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            size: 18,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${meal.duration} min',
                            style: textTheme.bodySmall!.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Icon(
                            Icons.category_outlined,
                            size: 18,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            meal.complexity.name,
                            style: textTheme.bodySmall!.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    // ignore: deprecated_member_use
                    color: colorScheme.onSurfaceVariant.withOpacity(0.7),
                    size: 20, // Adjusted size
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meal Videos',
          style: textTheme.headlineSmall!.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: colorScheme.surfaceContainer,
        foregroundColor: colorScheme.onSurface,
      ),
      body: content,
    );
  }
}
