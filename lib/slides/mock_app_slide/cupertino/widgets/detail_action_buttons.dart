import 'package:flutter/cupertino.dart';
import 'package:material_vs_hig/tokens/colors/hig_colors.dart';

class DetailActionButtons extends StatelessWidget {
  const DetailActionButtons({
    required this.onSave,
    required this.onShare,
    super.key,
  });

  final VoidCallback onSave;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CupertinoButton(
              color: HIGColors.primary,
              borderRadius: BorderRadius.circular(12),
              padding: const EdgeInsets.symmetric(vertical: 16),
              onPressed: onSave,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.tray_arrow_down_fill,
                    color: HIGColors.background,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Save',
                    style: TextStyle(
                      color: HIGColors.background,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: CupertinoButton(
              color: HIGColors.secondary,
              borderRadius: BorderRadius.circular(12),
              padding: const EdgeInsets.symmetric(vertical: 16),
              onPressed: onShare,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.share,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Share',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
