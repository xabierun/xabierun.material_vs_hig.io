import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:material_vs_hig/slides/thanks/app_colors.dart';
import 'package:material_vs_hig/slides/thanks/firework.dart';
import 'package:material_vs_hig/tokens/text_styles/material_text_styles.dart';

/// ご清聴ありがとうございましたスライド
class ThankYouSlide extends FlutterDeckSlideWidget {
  /// ご清聴ありがとうございましたスライド
  const ThankYouSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/thank-you',
          title: 'ご清聴ありがとうございました',
        ),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(builder: (context) => const _Page());
  }
}

class _Page extends StatefulWidget {
  const _Page();

  @override
  State<_Page> createState() => _PageState();
}

class _PageState extends State<_Page> {
  final List<Offset> _fireworks = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (details) {
        setState(() {
          _fireworks.add(details.localPosition - const Offset(4, 4));
        });
      },
      child: Stack(
        children: [
          // 全画面タップ領域を確保
          Positioned.fill(
            child: Container(
              color: Colors.transparent,
            ),
          ),

          // Fireworkエフェクト
          Positioned.fill(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ..._fireworks.map((e) => Firework(initialPosition: e)),
              ],
            ),
          ),

          // メインコンテンツ
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // タイトル
                ShaderMask(
                  shaderCallback: (bounds) =>
                      AppColors.textGradient.createShader(bounds),
                  child: const Text(
                    'ご清聴',
                    style: MaterialTextStyles.title,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                ShaderMask(
                  shaderCallback: (bounds) =>
                      AppColors.textGradient.createShader(bounds),
                  child: const Text(
                    'ありがとうございました！',
                    style: MaterialTextStyles.title,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 48),

                // 装飾的なアイコン
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryBlue.withValues(alpha: 0.3),
                        blurRadius: 30,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.celebration,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
