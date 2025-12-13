import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/widgets/section_title.dart';
import '../../../../core/widgets/neumorphic_card.dart';
import '../../../../core/routing/app_router.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            NeumorphicCard(
              child: Column(
                children: [
                  // Profile Image Placeholder
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.secondary,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Manish Ranjan',
                    style: theme.textTheme.displaySmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Mobile App Developer — Android & Flutter',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Experienced Mobile App Developer with 2+ years of expertise in building '
                    'enterprise-level Android and Flutter applications. Passionate about clean '
                    'architecture, modern UI/UX design, and creating scalable mobile solutions.',
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Quick Stats
            Row(
              children: [
                Expanded(
                  child: NeumorphicCard(
                    child: Column(
                      children: [
                        Text(
                          '2+',
                          style: theme.textTheme.displaySmall?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Years Experience',
                          style: theme.textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: NeumorphicCard(
                    child: Column(
                      children: [
                        Text(
                          '10+',
                          style: theme.textTheme.displaySmall?.copyWith(
                            color: theme.colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Projects',
                          style: theme.textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Highlights
            SectionTitle(
              title: 'Highlights',
              subtitle: 'Key expertise areas',
            ),
            const SizedBox(height: 16),
            _buildHighlightCard(
              context,
              'Android Development',
              'Building native Android apps with Kotlin, Jetpack Compose, and modern architecture patterns.',
              Icons.android,
              theme.colorScheme.secondary,
            ),
            const SizedBox(height: 12),
            _buildHighlightCard(
              context,
              'Flutter Development',
              'Creating cross-platform apps with Flutter, Clean Architecture, and state management solutions.',
              Icons.flutter_dash,
              theme.colorScheme.primary,
            ),
            const SizedBox(height: 12),
            _buildHighlightCard(
              context,
              'Clean Architecture',
              'Implementing scalable, maintainable code using DDD principles and modular monorepo structures.',
              Icons.architecture,
              theme.colorScheme.tertiary ?? theme.colorScheme.primary,
            ),
            const SizedBox(height: 24),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.router.push(const ProjectsRoute());
                    },
                    icon: const Icon(Icons.work),
                    label: const Text('View Projects'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      context.router.push(const ContactRoute());
                    },
                    icon: const Icon(Icons.email),
                    label: const Text('Contact Me'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlightCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    final theme = Theme.of(context);
    return NeumorphicCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

