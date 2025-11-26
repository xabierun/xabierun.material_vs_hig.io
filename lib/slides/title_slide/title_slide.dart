import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:material_vs_hig/tokens/colors/material_colors.dart';
import 'package:material_vs_hig/tokens/colors/hig_colors.dart';
import 'package:material_vs_hig/tokens/text_styles/material_text_styles.dart';
import 'package:material_vs_hig/tokens/text_styles/hig_text_styles.dart';
import 'package:material_vs_hig/tokens/spacing/material_spacing.dart';

class TitleSlide extends FlutterDeckSlideWidget {
  const TitleSlide({super.key});

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => Center(
        child: Padding(
          padding: MaterialSpacing.all64,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // メインタイトル
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Material Design 3
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Material Design 3',
                          style: MaterialTextStyles.title.copyWith(
                            color: MaterialColors.primary,
                          ),
                        ),
                        SizedBox(height: MaterialSpacing.s16),
                        Text(
                          'Expressive',
                          style: MaterialTextStyles.subheading.copyWith(
                            color: MaterialColors.primaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: MaterialSpacing.s48),
                  // VS (中央に配置)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 4,
                        height: 80,
                        decoration: BoxDecoration(
                          color: MaterialColors.primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      SizedBox(height: MaterialSpacing.s16),
                      Text(
                        'vs',
                        style: MaterialTextStyles.heading.copyWith(
                          color: MaterialColors.onSurface,
                        ),
                      ),
                      SizedBox(height: MaterialSpacing.s16),
                      Container(
                        width: 4,
                        height: 80,
                        decoration: BoxDecoration(
                          color: HIGColors.primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: MaterialSpacing.s48),
                  // Human Interface Guidelines
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Human Interface\nGuidelines',
                          textAlign: TextAlign.left,
                          style: HIGTextStyles.title.copyWith(
                            color: HIGColors.primary,
                          ),
                        ),
                        SizedBox(height: MaterialSpacing.s16),
                        Text(
                          'Liquid Glass',
                          style: HIGTextStyles.subheading.copyWith(
                            color: HIGColors.primaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MaterialSpacing.s64),
              // サブタイトル
              Text(
                'デザイン思想の違い',
                style: MaterialTextStyles.heading.copyWith(
                  color: MaterialColors.onSurface,
                ),
              ),
              SizedBox(height: MaterialSpacing.s32),
              // 説明文
              Container(
                padding: MaterialSpacing.all24,
                decoration: BoxDecoration(
                  color: MaterialColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(MaterialSpacing.s16),
                ),
                child: Column(
                  children: [
                    Text(
                      'デザイナー・エンジニア合同ゼミ',
                      style: MaterialTextStyles.body.copyWith(
                        color: MaterialColors.onSurfaceVariant,
                      ),
                    ),
                    SizedBox(height: MaterialSpacing.s8),
                    Text(
                      'Material Design 3 Expressive と Human Interface Guidelines (Liquid Glass) の',
                      style: MaterialTextStyles.caption.copyWith(
                        color: MaterialColors.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      'デザイントークンとUIの違いを比較します',
                      style: MaterialTextStyles.caption.copyWith(
                        color: MaterialColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
