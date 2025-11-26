import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:material_vs_hig/tokens/colors/material_colors.dart';
import 'package:material_vs_hig/tokens/radius/material_radius.dart';
import 'package:material_vs_hig/tokens/spacing/material_spacing.dart';
import 'package:material_vs_hig/tokens/text_styles/material_text_styles.dart';

class MaterialDesignSlide extends FlutterDeckSlideWidget {
  const MaterialDesignSlide({super.key});

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        final flutterDeck = FlutterDeck.of(context);
        final currentSlide = flutterDeck.slideNumber - 1;
        final totalSlides = flutterDeck.router.slides.length;
        const slideTitle = 'Material Design 3 Expressive';

        return Scaffold(
          backgroundColor: MaterialColors.background,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: Container(
              color: MaterialColors.surface,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                left: MaterialSpacing.s16,
                right: MaterialSpacing.s16,
                bottom: MaterialSpacing.s16,
              ),
              child: Row(
                children: [
                  // ハンバーガーメニューアイコン（戻るボタンとして使用）
                  if (currentSlide > 0)
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: flutterDeck.previous,
                      tooltip: '前のスライド',
                      color: MaterialColors.onSurface,
                    )
                  else
                    const SizedBox(width: MaterialSpacing.s48),
                  const SizedBox(width: MaterialSpacing.s8),
                  // 検索バー（タイトル表示として使用）
                  Expanded(
                    child: Container(
                      height: 56,
                      decoration: const BoxDecoration(
                        color: MaterialColors.surfaceVariant,
                        borderRadius: MaterialRadius.all28,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: MaterialSpacing.s16),
                          const Icon(
                            Icons.search,
                            color: MaterialColors.onSurfaceVariant,
                          ),
                          const SizedBox(width: MaterialSpacing.s12),
                          Expanded(
                            child: Text(
                              slideTitle,
                              style: MaterialTextStyles.body.copyWith(
                                color: MaterialColors.onSurfaceVariant,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: MaterialSpacing.s8),
                          IconButton(
                            icon: const Icon(
                              Icons.mic,
                              color: MaterialColors.onSurfaceVariant,
                            ),
                            onPressed: () {},
                            tooltip: '音声検索',
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                          const SizedBox(width: MaterialSpacing.s8),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: MaterialSpacing.s8),
                  // プロフィールアイコン（進むボタンとして使用）
                  if (currentSlide < totalSlides - 1)
                    IconButton(
                      icon: const Icon(Icons.account_circle),
                      onPressed: flutterDeck.next,
                      tooltip: '次のスライド',
                      color: MaterialColors.onSurface,
                    )
                  else
                    const SizedBox(width: MaterialSpacing.s48),
                ],
              ),
            ),
          ),
          body: Container(
            color: MaterialColors.background,
            padding: MaterialSpacing.all64,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: MaterialSpacing.s32),
                // 核心的な説明
                Container(
                  padding: MaterialSpacing.all32,
                  decoration: BoxDecoration(
                    color: MaterialColors.surface,
                    borderRadius: MaterialRadius.all16,
                    boxShadow: [
                      BoxShadow(
                        color: MaterialColors.shadow.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Material Design とは',
                        style: MaterialTextStyles.headingOnSurface,
                      ),
                      const SizedBox(height: MaterialSpacing.s24),
                      Text(
                        '情報が多い画面でも、視覚的な階層と整理によって\nユーザーが迷わずに目的を達成できるよう、\nユーザーがやりたいことを支援するデザインシステム',
                        style: MaterialTextStyles.bodyOnSurface,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: MaterialSpacing.s48),
                // ポイント
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: MaterialSpacing.all24,
                          decoration: const BoxDecoration(
                            color: MaterialColors.primaryContainer,
                            borderRadius: MaterialRadius.all16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '視覚的な階層',
                                style: MaterialTextStyles.subheading.copyWith(
                                  color: MaterialColors.onPrimaryContainer,
                                ),
                              ),
                              const SizedBox(height: MaterialSpacing.s16),
                              Text(
                                '情報を整理し、\n重要な要素を明確に',
                                style: MaterialTextStyles.body.copyWith(
                                  color: MaterialColors.onPrimaryContainer,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: MaterialSpacing.s24),
                      Expanded(
                        child: Container(
                          padding: MaterialSpacing.all24,
                          decoration: const BoxDecoration(
                            color: MaterialColors.secondaryContainer,
                            borderRadius: MaterialRadius.all16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ユーザーの意図を支援',
                                style: MaterialTextStyles.subheading.copyWith(
                                  color: MaterialColors.onSecondaryContainer,
                                ),
                              ),
                              const SizedBox(height: MaterialSpacing.s16),
                              Text(
                                'ユーザーがやりたいことを\n自然にサポート',
                                style: MaterialTextStyles.body.copyWith(
                                  color: MaterialColors.onSecondaryContainer,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: MaterialSpacing.s24),
                      Expanded(
                        child: Container(
                          padding: MaterialSpacing.all24,
                          decoration: const BoxDecoration(
                            color: MaterialColors.tertiaryContainer,
                            borderRadius: MaterialRadius.all16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '明確さと表現力',
                                style: MaterialTextStyles.subheading.copyWith(
                                  color: MaterialColors.onTertiaryContainer,
                                ),
                              ),
                              const SizedBox(height: MaterialSpacing.s16),
                              Text(
                                '機能性と表現力の\nバランスを重視',
                                style: MaterialTextStyles.body.copyWith(
                                  color: MaterialColors.onTertiaryContainer,
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
        );
      },
    );
  }
}
