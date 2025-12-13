import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/section_title.dart';
import '../../../../core/widgets/neumorphic_card.dart';

@RoutePage()
class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
              title: 'Experience',
              subtitle: 'My professional journey',
            ),
            const SizedBox(height: 24),

            // Current Position
            _buildExperienceCard(
              context,
              'Software Engineer',
              '12th Wonder Research India Pvt. Ltd',
              'April 2023 – Present',
              'Remote / Pune',
              [
                'Building enterprise-level Android & Flutter apps',
                'Architected scalable Flutter app using Clean Architecture + Melos',
                'Implemented DDD (presentation/domain/data layers)',
                'Integrated Dio + Retrofit with custom interceptors',
                'Built reusable UI components and design system',
                'Integrated Firebase services',
                'Collaborated with backend teams',
                'Layer-based testing and modular monorepo structure',
              ],
              true,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceCard(
    BuildContext context,
    String position,
    String company,
    String duration,
    String location,
    List<String> responsibilities,
    bool isCurrent,
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
                  color: isCurrent
                      ? theme.colorScheme.primary.withOpacity(0.1)
                      : theme.colorScheme.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.business_center,
                  color: isCurrent
                      ? theme.colorScheme.primary
                      : theme.colorScheme.secondary,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      position,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      company,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                size: 16,
                color: theme.textTheme.bodyMedium?.color,
              ),
              const SizedBox(width: 8),
              Text(
                duration,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.location_on,
                size: 16,
                color: theme.textTheme.bodyMedium?.color,
              ),
              const SizedBox(width: 8),
              Text(
                location,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          Text(
            'Key Responsibilities:',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...responsibilities.map((responsibility) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6, right: 12),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        responsibility,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

