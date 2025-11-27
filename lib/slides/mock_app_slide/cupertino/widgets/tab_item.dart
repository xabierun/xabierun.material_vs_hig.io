import 'package:flutter/cupertino.dart';
import 'package:material_vs_hig/tokens/colors/hig_colors.dart';
import 'package:material_vs_hig/tokens/text_styles/hig_text_styles.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? HIGColors.primary : HIGColors.labelTertiary,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: HIGTextStyles.caption.copyWith(
                color: isSelected ? HIGColors.primary : HIGColors.labelTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

