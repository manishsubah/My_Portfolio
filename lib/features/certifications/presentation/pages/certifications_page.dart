import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/section_title.dart';
import '../../../../core/widgets/neumorphic_card.dart';

@RoutePage()
class CertificationsPage extends StatelessWidget {
  const CertificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Certifications'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
              title: 'Certifications',
              subtitle: 'Professional certifications and courses',
            ),
            const SizedBox(height: 24),

            _buildCertificationCard(
              context,
              'AI Tools & ChatGPT',
              'Be10x',
              Icons.auto_awesome,
              Colors.purple,
            ),
            const SizedBox(height: 16),

            _buildCertificationCard(
              context,
              'Java & Data Structures',
              'Apna College',
              Icons.computer,
              Colors.orange,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildCertificationCard(
    BuildContext context,
    String title,
    String issuer,
    IconData icon,
    Color color,
  ) {
    final theme = Theme.of(context);

    return NeumorphicCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 40),
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
                Text(
                  issuer,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.verified,
            color: color,
            size: 28,
          ),
        ],
      ),
    );
  }
}

