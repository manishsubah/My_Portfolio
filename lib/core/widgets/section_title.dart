import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Text(
              title.toUpperCase(),
              style: theme.textTheme.displaySmall?.copyWith(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: theme.colorScheme.primary.withOpacity(0.1),
                height: 1,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Text(
                title,
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(
            subtitle!,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ],
    );
  }
}

