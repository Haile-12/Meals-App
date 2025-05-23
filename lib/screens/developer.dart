import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class DeveloperMenuScreen extends StatefulWidget {
  const DeveloperMenuScreen({super.key});

  @override
  State<DeveloperMenuScreen> createState() => _DeveloperMenuScreenState();
}

class _DeveloperMenuScreenState extends State<DeveloperMenuScreen> {
  // Helper function to launch URLs
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      // Fallback to platformDefault for email/phone if external fails, or just show error
      if (url.startsWith('mailto:') || url.startsWith('tel:')) {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } else {
        // ignore: use_build_context_synchronously
        _showMessage(context, 'Could not launch $url');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final Color appBarBaseColor = colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Developer Info',
          style: theme.textTheme.titleLarge!.copyWith(
            color:
                colorScheme
                    .onPrimary, // Text color that contrasts with primary color
            fontWeight: FontWeight.bold,
            fontSize: 20, // Slightly larger title
          ),
        ),
        // Applying a gradient to the AppBar background
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // ignore: deprecated_member_use
                appBarBaseColor.withOpacity(
                  0.55,
                ), // Starting color with opacity
                // ignore: deprecated_member_use
                appBarBaseColor.withOpacity(0.9), // Ending color with opacity
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: colorScheme.onPrimary,
        ), // Icon color that contrasts with primary color
        elevation: 8, // Add some elevation for a subtle shadow
        shape: const RoundedRectangleBorder(
          // Rounded bottom corners for app bar
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      backgroundColor: colorScheme.surface, // Use theme's background color
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Section for Developer Info
          _buildInfoItem(
            context,
            title: 'Developer Name',
            value: 'Haile Tassew Belay',
            icon: Icons.person_outline, // Changed icon for a softer look
            splashColor: colorScheme.primary, // Using primaryColor for splash
          ),
          _buildInfoItem(
            context,
            title: 'Email',
            value: 'hailetassew4545@gmail.com',
            icon: Icons.email_outlined, // Changed icon
            onTap: () {
              _launchURL('mailto:hailetassew4545@gmail.com');
              _showMessage(context, 'Opening email client...');
            },
            splashColor: colorScheme.primary, // Using primaryColor for splash
          ),
          _buildInfoItem(
            context,
            title: 'Phone',
            value: '0945987335',
            icon: Icons.phone_outlined, // Changed icon
            onTap: () {
              _launchURL(
                'tel:+251945987335',
              ); // Use 'tel:' scheme for phone calls
              _showMessage(context, 'Calling phone number...');
            },
            splashColor: colorScheme.primary, // Using primaryColor for splash
          ),
          _buildInfoItem(
            context,
            title: 'GitHub',
            value: 'github.com/Haile-12', // Replace with actual GitHub
            icon: Icons.code,
            onTap: () {
              _launchURL(
                'https://github.com/Haile-12',
              ); // Use 'https://' for web links
              _showMessage(context, 'Opening GitHub...');
            },
            splashColor: colorScheme.primary, // Using primaryColor for splash
          ),
          _buildInfoItem(
            context,
            title: 'LinkedIn',
            value: 'linkedin.com/haile12_12', // Replace with actual LinkedIn
            icon: Icons.link,
            onTap: () {
              _launchURL(
                'https://www.linkedin.com/in/haile12_12',
              ); // Use 'https://' for web links
              _showMessage(context, 'Opening LinkedIn...');
            },
            splashColor: colorScheme.primary, // Using primaryColor for splash
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    VoidCallback? onTap, // Made optional for non-clickable info
    required Color splashColor, // Added splashColor parameter
  }) {
    // Access the current theme's color scheme
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        splashColor: splashColor, // Using the passed splashColor
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), // More rounded corners
            gradient: LinearGradient(
              colors: [
                // ignore: deprecated_member_use
                colorScheme.surface.withOpacity(
                  0.9,
                ), // Darker surface for start
                // ignore: deprecated_member_use
                colorScheme.surfaceContainerHighest.withOpacity(
                  0.9,
                ), // Lighter surface variant for end
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              // Added subtle shadow for depth
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20.0), // Increased padding inside card
          child: Row(
            children: [
              Icon(
                icon,
                color: colorScheme.secondary,
                size: 30,
              ), // Icon color from theme's secondary
              const SizedBox(width: 20), // Increased spacing
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        // ignore: deprecated_member_use
                        color: colorScheme.onSurface.withOpacity(
                          0.7,
                        ), // Text color that contrasts with surface
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6), // Increased spacing
                    Text(
                      value,
                      style: TextStyle(
                        color:
                            colorScheme
                                .onSurface, // Text color that contrasts with surface
                        fontSize: 19, // Slightly larger font size for value
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              if (onTap != null) // Show open_in_new icon if item is clickable
                Icon(
                  Icons.open_in_new, // Changed icon to indicate opening a link
                  // ignore: deprecated_member_use
                  color: colorScheme.onSurface.withOpacity(0.5),
                  size: 20,
                ), // Icon color that contrasts with surface
            ],
          ),
        ),
      ),
    );
  }

  // Simple message display (instead of alert())
  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor:
            Theme.of(
              context,
            ).colorScheme.primary, // Use primary color for snackbar
        behavior:
            SnackBarBehavior.floating, // Make it float for better visibility
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
