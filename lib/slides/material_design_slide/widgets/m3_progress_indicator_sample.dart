import 'package:flutter/material.dart';
import 'package:material_vs_hig/tokens/colors/material_colors.dart';
import 'package:material_vs_hig/tokens/spacing/material_spacing.dart';

class M3ProgressIndicatorSample extends StatelessWidget {
  const M3ProgressIndicatorSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Circular Progress Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Indeterminate
            const CircularProgressIndicator(
              color: MaterialColors.primary,
              strokeCap: StrokeCap.round,
            ),
            const SizedBox(width: MaterialSpacing.s24),
            // Determinate
            CircularProgressIndicator(
              value: 0.7,
              color: MaterialColors.primary,
              backgroundColor: MaterialColors.primary.withOpacity(0.12),
              strokeCap: StrokeCap.round,
            ),
          ],
        ),
        const SizedBox(height: MaterialSpacing.s24),
        // Linear Progress Indicator
        Column(
          children: [
            // Indeterminate
            const LinearProgressIndicator(
              color: MaterialColors.primary,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            const SizedBox(height: MaterialSpacing.s16),
            // Determinate
            LinearProgressIndicator(
              value: 0.7,
              color: MaterialColors.primary,
              backgroundColor: MaterialColors.primary.withOpacity(0.12),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
          ],
        ),
      ],
    );
  }
}

