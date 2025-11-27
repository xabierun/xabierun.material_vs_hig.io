import 'package:flutter/material.dart';
import 'package:material_vs_hig/tokens/colors/material_colors.dart';

class MaterialDetailScreen extends StatelessWidget {
  const MaterialDetailScreen({
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          style: IconButton.styleFrom(
            backgroundColor: MaterialColors.surface.withOpacity(0.9),
            foregroundColor: MaterialColors.onSurface,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.withOpacity(0.3),
              MaterialColors.primaryLight.withOpacity(0.2),
              MaterialColors.secondaryLight.withOpacity(0.25),
              color.withOpacity(0.15),
            ],
            stops: const [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 画像表示エリア - Hero Animation
              Hero(
                tag: 'image_$imageIndex',
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          color.withOpacity(0.2),
                          color.withOpacity(0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Center(
                      child: Icon(
                        icon,
                        color: color,
                        size: 120,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // 画像情報
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    Text(
                      'Image #${imageIndex + 1}',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: MaterialColors.onBackground,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Tap the buttons below to save or share this image',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: MaterialColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              // アクションボタン - 大胆で目立つデザイン
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // Saveボタン
                    SizedBox(
                      width: double.infinity,
                      height: 64,
                      child: FilledButton(
                        onPressed: () {
                          _showSnackBar(context, 'Image saved to your device');
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: MaterialColors.primary,
                          foregroundColor: MaterialColors.onPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          elevation: 8,
                          shadowColor: MaterialColors.primary.withOpacity(0.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.download_rounded,
                              size: 32,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'Save to Device',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Shareボタン
                    SizedBox(
                      width: double.infinity,
                      height: 64,
                      child: FilledButton(
                        onPressed: () {
                          _showSnackBar(
                            context,
                            'Share options would appear here',
                          );
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: MaterialColors.secondary,
                          foregroundColor: MaterialColors.onSecondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          elevation: 8,
                          shadowColor: MaterialColors.secondary.withOpacity(0.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.share_rounded,
                              size: 32,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'Share with Others',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showBottomSheet(context);
        },
        icon: const Icon(Icons.more_horiz),
        label: const Text('More Options'),
        backgroundColor: MaterialColors.secondary,
        foregroundColor: MaterialColors.onSecondary,
        elevation: 8,
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: MaterialColors.inverseSurface,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: MaterialColors.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'More Actions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: MaterialColors.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.edit, color: MaterialColors.primary),
              title: const Text('Edit'),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar(context, 'Edit functionality');
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: MaterialColors.error),
              title: const Text('Delete'),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar(context, 'Delete functionality');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: MaterialColors.primary),
              title: const Text('Details'),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar(context, 'Image details');
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

