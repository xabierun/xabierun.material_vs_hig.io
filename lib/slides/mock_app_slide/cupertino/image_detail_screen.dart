import 'package:flutter/cupertino.dart';
import 'package:material_vs_hig/slides/mock_app_slide/cupertino/widgets/glass_app_bar.dart';
import 'package:material_vs_hig/slides/mock_app_slide/cupertino/widgets/detail_action_buttons.dart';
import 'package:material_vs_hig/tokens/colors/hig_colors.dart';

class ImageDetailScreen extends StatelessWidget {
  const ImageDetailScreen({
    required this.imageIndex,
    required this.icon,
    required this.color,
    super.key,
  });

  final int imageIndex;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: HIGColors.background,
      child: Stack(
        children: [
          // グラデーション背景
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  HIGColors.primary.withOpacity(0.3),
                  HIGColors.secondary.withOpacity(0.2),
                  HIGColors.accent.withOpacity(0.25),
                  HIGColors.primary.withOpacity(0.15),
                ],
                stops: const [0.0, 0.3, 0.7, 1.0],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 画像表示エリア
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: HIGColors.backgroundSecondary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: color,
                      size: 120,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // 画像情報
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      Text(
                        'Image #${imageIndex + 1}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: HIGColors.label,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Tap the buttons below to save or share this image',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: HIGColors.labelSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
                // アクションボタン
                DetailActionButtons(
                  onSave: () {
                    _showActionSheet(
                      context,
                      'Save',
                      'Image saved to your device',
                    );
                  },
                  onShare: () {
                    _showActionSheet(
                      context,
                      'Share',
                      'Share options would appear here',
                    );
                  },
                ),
              ],
            ),
          ),
          const GlassAppBar(),
        ],
      ),
    );
  }

  void _showActionSheet(BuildContext context, String title, String message) {
    showCupertinoDialog<void>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK', style: TextStyle(color: HIGColors.label)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
