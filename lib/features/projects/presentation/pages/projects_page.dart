import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/widgets/section_title.dart';
import '../../../../core/widgets/neumorphic_card.dart';

@RoutePage()
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
              title: 'Projects',
              subtitle: 'Major projects I\'ve worked on',
            ),
            const SizedBox(height: 24),

            // Titan TLM
            _buildProjectCard(
              context,
              'Titan TLM',
              'Test Lifecycle Management app used by engineering teams in the automotive industry.',
              'Android + Flutter',
              [
                'XML UI',
                'Retrofit',
                'Room DB',
                'Live API integration',
                'Play Store availability',
              ],
              Icons.engineering,
              Colors.blue,
              null, // Add Play Store URL if available
            ),
            const SizedBox(height: 16),

            // Live Assist
            _buildProjectCard(
              context,
              'Live Assist',
              'App for product scanning, real-time support, and video consultation.',
              'Flutter',
              [
                'Clean Architecture',
                'Bloc',
                'Barcode scanning',
                'Zego video call integration',
                'User app + Expert dashboard',
              ],
              Icons.video_call,
              Colors.green,
              null,
            ),
            const SizedBox(height: 16),

            // WonderHealth IFT
            _buildProjectCard(
              context,
              'WonderHealth IFT',
              'A fasting + health tracking application.',
              'Android',
              [
                'XML UI',
                'Room DB',
                'Food intake management',
                'Canvas-based graphical elements',
              ],
              Icons.health_and_safety,
              Colors.red,
              null,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    String title,
    String description,
    String platform,
    List<String> technologies,
    IconData icon,
    Color color,
    String? playStoreUrl,
  ) {
    final theme = Theme.of(context);

    return NeumorphicCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        platform,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 12),
          Text(
            'Technologies:',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: technologies.map((tech) => Chip(
                  label: Text(tech),
                  backgroundColor: color.withOpacity(0.1),
                  labelStyle: TextStyle(
                    color: color,
                    fontSize: 12,
                  ),
                )).toList(),
          ),
          if (playStoreUrl != null) ...[
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () async {
                final uri = Uri.parse(playStoreUrl);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
              icon: const Icon(Icons.shop),
              label: const Text('View on Play Store'),
            ),
          ],
        ],
      ),
    );
  }
}

