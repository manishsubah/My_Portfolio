import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/section_title.dart';
import '../../../../core/widgets/neumorphic_card.dart';
import '../../../../core/widgets/skill_chip.dart';

@RoutePage()
class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Skills'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
              title: 'Skills',
              subtitle: 'Technologies and tools I work with',
            ),
            const SizedBox(height: 24),

            // Languages
            _buildSkillCategory(
              context,
              'Languages',
              Icons.code,
              [
                'Kotlin',
                'Java',
                'Dart',
              ],
              theme.colorScheme.primary,
            ),
            const SizedBox(height: 24),

            // Frameworks & Libraries
            _buildSkillCategory(
              context,
              'Frameworks & Libraries',
              Icons.library_books,
              [
                'Flutter',
                'Jetpack Compose',
                'Retrofit',
                'Room DB',
                'Firebase',
                'Bloc',
                'Provider',
                'Riverpod',
                'Mason',
                'OkHttp',
                'Espresso',
              ],
              theme.colorScheme.secondary,
            ),
            const SizedBox(height: 24),

            // Tools
            _buildSkillCategory(
              context,
              'Tools',
              Icons.build,
              [
                'Android Studio',
                'VS Code',
                'GitHub',
                'Gradle',
                'Firebase Console',
                'Postman',
                'GitHub Actions',
              ],
              Colors.orange,
            ),
            const SizedBox(height: 24),

            // Databases
            _buildSkillCategory(
              context,
              'Databases',
              Icons.storage,
              [
                'Room DB',
                'SQL',
                'Firestore',
                'sqflite',
              ],
              Colors.purple,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String category,
    IconData icon,
    List<String> skills,
    Color color,
  ) {
    final theme = Theme.of(context);

    return NeumorphicCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                category,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: skills
                .map((skill) => SkillChip(
                      skill: skill,
                      color: color,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

