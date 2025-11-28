import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:material_vs_hig/slides/hig_slide/direct_manipulation_demo.dart';
import 'package:material_vs_hig/slides/hig_slide/header_widget.dart';
import 'package:material_vs_hig/tokens/colors/hig_colors.dart';
import 'package:material_vs_hig/tokens/radius/hig_radius.dart';
import 'package:material_vs_hig/tokens/spacing/hig_spacing.dart';
import 'package:material_vs_hig/tokens/text_styles/hig_text_styles.dart';

class HigSlide extends FlutterDeckSlideWidget {
  const HigSlide({super.key});

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const _SlideBody(),
    );
  }
}

class _SlideBody extends StatelessWidget {
  const _SlideBody();

  @override
  Widget build(BuildContext context) {
    final flutterDeck = FlutterDeck.of(context);
    final currentSlide = flutterDeck.slideNumber - 1;
    final totalSlides = flutterDeck.router.slides.length;
    const slideTitle = 'Human Interface Guidelines';

    return Scaffold(
      backgroundColor: HIGColors.backgroundBlueGrey,
      appBar: HeaderWidget(
        currentSlide: currentSlide,
        flutterDeck: flutterDeck,
        slideTitle: slideTitle,
        totalSlides: totalSlides,
      ),
      body: Padding(
        padding: HIGSpacing.all64,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: HIGSpacing.s32),
            // 核心的な説明
            LiquidGlassLayer(
              settings: const LiquidGlassSettings(
                blur: 10,
                glassColor: Color(0x33FFFFFF),
                lightIntensity: 0.8,
                ambientStrength: 0.5,
              ),
              child: LiquidGlass(
                shape: const LiquidRoundedRectangle(borderRadius: 16),
                child: Padding(
                  padding: HIGSpacing.all32,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HIG とは？ 「迷わない、疲れない、普遍的な美しさ」',
                        style: HIGTextStyles.headingLabel,
                      ),
                      const SizedBox(height: HIGSpacing.s24),
                      Text(
                        '''Apple製品（iOS, macOSなど）全体で共通の「お作法」。\n\n派手な表現を抑え、ユーザーが何も考えなくても直感的に使えることを最優先します。\nMD3 Expressiveが「視覚的に楽しい」なら、HIGは「目に見える情報量を減らして使いやすい」を目指します。''',
                        style: HIGTextStyles.bodyLabelSecondary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: HIGSpacing.s48),
            // ポイント
            const Expanded(
              child: _InteractiveCardsArea(),
            ),
          ],
        ),
      ),
    );
  }
}

class _InteractiveCardsArea extends StatefulWidget {
  const _InteractiveCardsArea();

  @override
  State<_InteractiveCardsArea> createState() => _InteractiveCardsAreaState();
}

class _InteractiveCardsAreaState extends State<_InteractiveCardsArea> {
  // カードの位置を管理するためのリスト
  // nullの場合は初期配置を使用する
  final List<Offset?> _cardPositions = [null, null, null];

  final GlobalKey _containerKey = GlobalKey();

  void _updateCardPosition(int index, Offset delta) {
    setState(() {
      if (_cardPositions[index] == null) {
        // 初期位置がまだ計算されていない場合は、レイアウト後に設定されるはずだが
        // ここでは安全策として何もしない、または初期位置を取得して加算する処理が必要
        return;
      }
      _cardPositions[index] = _cardPositions[index]! + delta;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final cardWidth = (width - HIGSpacing.s24 * 2) / 3;

        // 初期位置の設定（まだ設定されていない場合）
        if (_cardPositions[0] == null) {
          // 3つのカードを均等に配置
          _cardPositions[0] = const Offset(0, 0);
          _cardPositions[1] = Offset(cardWidth + HIGSpacing.s24, 0);
          _cardPositions[2] = Offset((cardWidth + HIGSpacing.s24) * 2, 0);
        }

        return LiquidGlassLayer(
          settings: const LiquidGlassSettings(
            blur: 20,
            glassColor: Color(0x33FFFFFF),
            thickness: 30,
            lightIntensity: 0.8, // 光を強く
            ambientStrength: 0.5,
            chromaticAberration: 0.8, // 色収差を強くして虹色感を出す
            refractiveIndex: 1.6, // 屈折率を上げて歪みを強調
          ),
          child: LiquidGlassBlendGroup(
            blend: 40, // ブレンドを強くして、より遠くからくっつくようにする
            child: Stack(
              key: _containerKey,
              children: [
                _buildDraggableCard(
                  index: 0,
                  width: cardWidth,
                  height: height, // 高さも指定
                  title: '1. どこを触っても一緒！\n安心の「既視感」',
                  description:
                      '''アプリが変わっても、ボタンやアイコンの形、操作のルールは変更しない。\nユーザーは新しいアプリを使うたびに操作を覚える必要がなく、学習コストがゼロ。\n\nエンジニアもデザイナーも、共通のコンポーネントを使うことで開発と品質チェックがスムーズになります。''',
                  icon: CupertinoIcons.square_grid_2x2,
                  child: Center(
                    child: CupertinoButton.filled(
                      onPressed: () {},
                      child: const Text('Standard Button'),
                    ),
                  ),
                ),
                _buildDraggableCard(
                  index: 1,
                  width: cardWidth,
                  height: height,
                  title: '2. 情報は「一目でわかる」\nのが正義！',
                  description:
                      '''テキストは読みやすく、アイコンは意味がすぐ伝わるシンプルな形を採用。\n不必要な装飾は徹底的に排除し、コンテンツが背景に埋もれないようにします。\n\nHIGは控えめな情報で、機能性が際立つデザインが特徴です。''',
                  icon: CupertinoIcons.eye,
                  child: Center(
                    child: Container(
                      padding: HIGSpacing.all12,
                      decoration: BoxDecoration(
                        border: Border.all(color: HIGColors.separator),
                        borderRadius: HIGRadius.all8,
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            CupertinoIcons.info,
                            color: HIGColors.primary,
                          ),
                          SizedBox(width: 8),
                          Text('Clean & Clear'),
                        ],
                      ),
                    ),
                  ),
                ),
                _buildDraggableCard(
                  index: 2,
                  width: cardWidth,
                  height: height,
                  title: '3. UIは「現実世界の延長」\nとして触る',
                  description:
                      '''画面上のオブジェクトを、現実のモノに触れるように直接操作します\n（例：リストを指でドラッグして移動、ページをめくるようにスワイプ）。\n\n直感的で自然な操作感を生み出し、ユーザーとシステムの間に余障壁を作らないことを重視。''',
                  icon: CupertinoIcons.hand_draw,
                  child: const Center(
                    child: DirectManipulationDemo(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDraggableCard({
    required int index,
    required double width,
    required double height,
    required String title,
    required String description,
    required IconData icon,
    Widget? child,
  }) {
    final position = _cardPositions[index] ?? Offset.zero;

    return Positioned(
      left: position.dx,
      top: position.dy,
      width: width,
      // 高さは内容に合わせて自動調整されるが、Positionedで制約を与える場合はheightも必要
      // ただし、内容は可変長なのでbottomを指定しない方が良いが、Stack内での配置なので
      // ここでは高さを指定せず、Containerの高さに任せる形にするには工夫が必要
      // 今回はLayoutBuilderで取得した高さを使わず、コンテンツの高さに任せる
      child: GestureDetector(
        onPanUpdate: (details) {
          _updateCardPosition(index, details.delta);
        },
        child: _HigCard(
          title: title,
          description: description,
          icon: icon,
        ),
      ),
    );
  }
}

class _HigCard extends StatelessWidget {
  const _HigCard({
    required this.title,
    required this.description,
    required this.icon,
    this.child,
  });

  final String title;
  final String description;
  final IconData icon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // LiquidGlass.groupedを使用してブレンドグループに参加する
    return LiquidGlass.grouped(
      shape: const LiquidRoundedRectangle(
        borderRadius: 32,
      ), // 角丸を大きくして液体の表面張力っぽさを出す
      child: Padding(
        padding: HIGSpacing.all24,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: HIGColors.primary, size: 32),
                const SizedBox(width: HIGSpacing.s12),
                Expanded(
                  child: Text(
                    title,
                    style: HIGTextStyles.subheading.copyWith(
                      color: HIGColors.label,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: HIGSpacing.s16),
            Text(
              description,
              style: HIGTextStyles.bodyLabelSecondary.copyWith(fontSize: 20),
            ),
            if (child != null) ...[
              const SizedBox(height: HIGSpacing.s16),
              child!,
            ],
          ],
        ),
      ),
    );
  }
}
