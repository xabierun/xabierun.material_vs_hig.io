import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:material_vs_hig/tokens/colors/hig_colors.dart';
import 'package:material_vs_hig/tokens/spacing/hig_spacing.dart';
import 'package:material_vs_hig/tokens/text_styles/hig_text_styles.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  const HeaderWidget({
    required this.currentSlide,
    required this.flutterDeck,
    required this.slideTitle,
    required this.totalSlides,
    super.key,
  });

  final int currentSlide;
  final FlutterDeck flutterDeck;
  final String slideTitle;
  final int totalSlides;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120),
      child: Stack(
        children: [
          // 背景コンテンツ（ガラス効果の背景として使用）
          Container(
            color: Colors.transparent,
          ),
          // ナビゲーションバー
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: HIGSpacing.s16,
              right: HIGSpacing.s16,
              bottom: HIGSpacing.s16,
            ),
            child: Row(
              children: [
                // 戻るボタン
                if (currentSlide > 0) ...[
                  LiquidGlassLayer(
                    settings: const LiquidGlassSettings(
                      blur: 10,
                      glassColor: Color(0x33FFFFFF),
                      lightIntensity: 0.8,
                      ambientStrength: 0.5,
                    ),
                    child: LiquidGlass(
                      shape: const LiquidOval(),
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: flutterDeck.previous,
                          child: const Icon(
                            CupertinoIcons.back,
                            color: HIGColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  const SizedBox(width: HIGSpacing.s48),
                ],
                const SizedBox(width: HIGSpacing.s8),
                // 検索バー（タイトル表示として使用）
                Expanded(
                  child: LiquidGlassLayer(
                    settings: const LiquidGlassSettings(
                      blur: 10,
                      glassColor: Color(0x33FFFFFF),
                      lightIntensity: 0.8,
                      ambientStrength: 0.5,
                    ),
                    child: LiquidGlass(
                      shape: const LiquidRoundedSuperellipse(
                        borderRadius: 28,
                      ),
                      child: SizedBox(
                        height: 56,
                        child: Row(
                          children: [
                            const SizedBox(width: HIGSpacing.s16),
                            const Icon(
                              CupertinoIcons.search,
                              color: HIGColors.labelSecondary,
                            ),
                            const SizedBox(width: HIGSpacing.s12),
                            Expanded(
                              child: Text(
                                slideTitle,
                                style: HIGTextStyles.body.copyWith(
                                  color: HIGColors.labelSecondary,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: HIGSpacing.s8),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              child: const Icon(
                                CupertinoIcons.mic,
                                color: HIGColors.labelSecondary,
                              ),
                            ),
                            const SizedBox(width: HIGSpacing.s8),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: HIGSpacing.s8),
                // プロフィールアイコン（進むボタンとして使用）
                if (currentSlide < totalSlides - 1)
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: flutterDeck.next,
                    child: const Icon(
                      CupertinoIcons.person_circle,
                      color: HIGColors.primary,
                    ),
                  )
                else
                  const SizedBox(width: HIGSpacing.s48),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(120);
}
