import 'dart:math';

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
      builder: (context) => const _SlideBody(),
    );
  }
}

class _SlideBody extends StatefulWidget {
  const _SlideBody();

  @override
  State<_SlideBody> createState() => _SlideBodyState();
}

class _SlideBodyState extends State<_SlideBody> {
  bool _showLargeButton = false;

  @override
  Widget build(BuildContext context) {
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
              // 戻るボタン
              if (currentSlide > 0)
                IconButton(
                  icon: const Icon(Icons.arrow_back),
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
            Row(
              children: [
                Expanded(
                  child: Container(
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
                          '''情報が多い画面でも、視覚的な階層と整理によって\nユーザーが迷わずに目的を達成できるよう、\nユーザーがやりたいことを支援するデザインシステム''',
                          style: MaterialTextStyles.bodyOnSurface,
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutQuart,
                  child: _showLargeButton
                      ? Row(
                          children: [
                            const SizedBox(width: MaterialSpacing.s32),
                            TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0, end: 1),
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.elasticOut,
                              builder: (context, value, child) {
                                return Transform.scale(
                                  scale: value,
                                  child: child,
                                );
                              },
                              child: FloatingActionButton.large(
                                onPressed: flutterDeck.next,
                                backgroundColor:
                                    MaterialColors.primaryContainer,
                                foregroundColor:
                                    MaterialColors.onPrimaryContainer,
                                child: const Icon(
                                  Icons.arrow_forward,
                                  size: 48,
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
            const SizedBox(height: MaterialSpacing.s48),
            // ポイント
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _SpringCard(
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
                              '1. 躍動的なモーション✨',
                              style: MaterialTextStyles.subheading.copyWith(
                                color: MaterialColors.onPrimaryContainer,
                              ),
                            ),
                            const SizedBox(height: MaterialSpacing.s16),
                            Text(
                              '''ボタンを押したら「ふわっ」とバネのように弾む（スプリング）！\n無機質なUIに命を吹き込み、操作するたびに心地よいフィードバックを返します。\n\nエンジニアは実装の工夫、デザイナーは魅力的な体験設計がカギ！''',
                              style: MaterialTextStyles.body.copyWith(
                                color: MaterialColors.onPrimaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: MaterialSpacing.s24),
                  const Expanded(
                    child: _PersonalizeCard(),
                  ),
                  const SizedBox(width: MaterialSpacing.s24),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showLargeButton = !_showLargeButton;
                        });
                      },
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
                              '3. 情報が勝手に飛び込む！大胆レイアウト',
                              style: MaterialTextStyles.subheading.copyWith(
                                color: MaterialColors.onTertiaryContainer,
                              ),
                            ),
                            const SizedBox(height: MaterialSpacing.s16),
                            Text(
                              '''大事な情報は特大のフォントや派手な色で視線を集め、アクションボタンは画面から浮き上がらせる（フローティング）。\n\n迷う余地を与えず、ユーザーをスムーズに導くユーザーライクな画面作りが可能です。''',
                              style: MaterialTextStyles.body.copyWith(
                                color: MaterialColors.onTertiaryContainer,
                              ),
                            ),
                          ],
                        ),
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
  }
}

class _SpringCard extends StatefulWidget {
  const _SpringCard({required this.child});

  final Widget child;

  @override
  State<_SpringCard> createState() => _SpringCardState();
}

class _SpringCardState extends State<_SpringCard> {
  double _scale = 1;

  void _onTapDown(TapDownDetails details) {
    setState(() => _scale = 0.95);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _scale = 1.0);
  }

  void _onTapCancel() {
    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 200),
        curve: _scale == 1.0 ? Curves.elasticOut : Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}

class _PersonalizeCard extends StatefulWidget {
  const _PersonalizeCard();

  @override
  State<_PersonalizeCard> createState() => _PersonalizeCardState();
}

class _PersonalizeCardState extends State<_PersonalizeCard> {
  Color _backgroundColor = MaterialColors.secondaryContainer;
  Color _textColor = MaterialColors.onSecondaryContainer;

  void _changeColor() {
    setState(() {
      final random = Random();
      final hue = random.nextDouble() * 360;
      final saturation = 0.6 + random.nextDouble() * 0.4; // 0.6 - 1.0
      final lightnessBg = 0.85 + random.nextDouble() * 0.1; // 0.85 - 0.95
      final lightnessText = 0.1 + random.nextDouble() * 0.2; // 0.1 - 0.3

      _backgroundColor = HSLColor.fromAHSL(
        1,
        hue,
        saturation,
        lightnessBg,
      ).toColor();
      _textColor = HSLColor.fromAHSL(
        1,
        hue,
        saturation,
        lightnessText,
      ).toColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: MaterialSpacing.all24,
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: MaterialRadius.all16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: MaterialTextStyles.subheading.copyWith(
                color: _textColor,
              ),
              child: const Text(
                '2. ユーザーの気分をUIに！超絶パーソナライズ',
              ),
            ),
            const SizedBox(height: MaterialSpacing.s16),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: MaterialTextStyles.body.copyWith(
                color: _textColor,
              ),
              child: const Text(
                '''壁紙とUIの色が自動でリンク！\nアプリ全体がユーザーだけの「推しカラー」に染まります。\n\n355種類のシェイプでブランドの個性を爆発させ、他のアプリと一線を画す「エッジ」を効かせます。''',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
