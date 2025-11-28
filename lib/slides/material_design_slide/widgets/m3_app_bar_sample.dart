import 'package:flutter/material.dart';
import 'package:material_vs_hig/tokens/colors/material_colors.dart';
import 'package:material_vs_hig/tokens/spacing/material_spacing.dart';

class M3AppBarSample extends StatelessWidget {
  const M3AppBarSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Center Aligned Top App Bar
        Container(
          decoration: BoxDecoration(
            color: MaterialColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: MaterialColors.outline.withOpacity(0.2)),
          ),
          clipBehavior: Clip.antiAlias,
          child: AppBar(
            title: const Text('Center Aligned'),
            centerTitle: true,
            backgroundColor: MaterialColors.surface,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.account_circle),
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: MaterialSpacing.s16),
        // Small Top App Bar (colored)
        Container(
          decoration: BoxDecoration(
            color: MaterialColors.surfaceVariant,
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          child: AppBar(
            title: const Text('Small'),
            backgroundColor: MaterialColors.surfaceVariant,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.attach_file),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

