import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
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
      backgroundColor: HIGColors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          color: HIGColors.surface,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: HIGSpacing.s16,
            right: HIGSpacing.s16,
            bottom: HIGSpacing.s16,
          ),
          child: Row(
            children: [
              // 戻るボタン
              if (currentSlide > 0)
                LiquidGlass.withOwnLayer(
                  shape: const LiquidOval(),
                  settings: LiquidGlassSettings(
                    glassColor: HIGColors.primary.withOpacity(0.1),
                    blur: 20,
                    thickness: 10,
                  ),
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: flutterDeck.previous,
                    child: const Icon(
                      CupertinoIcons.back,
                      color: HIGColors.primary,
                    ),
                  ),
                )
              else
                const SizedBox(width: HIGSpacing.s48),
              const SizedBox(width: HIGSpacing.s8),
              // タイトル
              Expanded(
                child: Text(
                  slideTitle,
                  style: HIGTextStyles.headingLabel,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: HIGSpacing.s8),
              // 進むボタン
              if (currentSlide < totalSlides - 1)
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: flutterDeck.next,
                  child: const Icon(
                    CupertinoIcons.forward,
                    color: HIGColors.primary,
                  ),
                )
              else
                const SizedBox(width: HIGSpacing.s48),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: HIGSpacing.all64,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: HIGSpacing.s32),
            // 核心的な説明
            Container(
              padding: HIGSpacing.all32,
              decoration: BoxDecoration(
                color: HIGColors.surface,
                borderRadius: HIGRadius.all16,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'HIG とは？ 「迷わない、疲れない、普遍的な美しさ」',
                    style: HIGTextStyles.headingLabel,
                  ),
                  const SizedBox(height: HIGSpacing.s24),
                  Text(
                    '''Apple製品（iOS, macOSなど）全体で共通の「お作法」。\n\n派手な表現を抑え、ユーザーが何も考えなくても直感的に使えることを最優先します。\nMD3 Expressiveが「使って楽しい」なら、HIGは「使っていてストレスがない」を目指します。''',
                    style: HIGTextStyles.bodyLabelSecondary,
                  ),
                ],
              ),
            ),
            const SizedBox(height: HIGSpacing.s48),
            // ポイント
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _HigCard(
                      title: '1. どこを触っても一緒！\n安心の「既視感」',
                      description:
                          'アプリが変わっても、ボタンやアイコンの形、操作のルールは変えません。ユーザーは新しいアプリを使うたびに操作を覚える必要がなく、学習コストがゼロに。エンジニアもデザイナーも、共通のコンポーネントを使うことで開発と品質チェックがスムーズになります。',
                      icon: CupertinoIcons.square_grid_2x2,
                      child: Center(
                        child: CupertinoButton.filled(
                          onPressed: () {},
                          child: const Text('Standard Button'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: HIGSpacing.s24),
                  Expanded(
                    child: _HigCard(
                      title: '2. 情報は「一目でわかる」\nのが正義！',
                      description:
                          'テキストは読みやすく、アイコンは意味がすぐ伝わるシンプルな形を採用。不必要な装飾は徹底的に排除し、情報が背景に埋もれないようにします。MD3 Expressiveの大胆な色や形と違い、HIGは控えめなエレガンスで、機能性が際立つデザインを求めます。',
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
                  ),
                  const SizedBox(width: HIGSpacing.s24),
                  const Expanded(
                    child: _HigCard(
                      title: '3. UIは「現実世界の延長」\nとして触る',
                      description:
                          '画面上のオブジェクトを、現実のモノに触れるように直接操作します（例：リストを指でドラッグして移動、ページをめくるようにスワイプ）。直感的で自然な操作感を生み出し、ユーザーとシステムの間に余計な障壁を作らないことを大切にします。',
                      icon: CupertinoIcons.hand_draw,
                      child: Center(
                        child: _DirectManipulationDemo(),
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
    return Container(
      padding: HIGSpacing.all24,
      decoration: BoxDecoration(
        color: HIGColors.surface,
        borderRadius: HIGRadius.all16,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
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
            const Spacer(),
            child!,
          ],
        ],
      ),
    );
  }
}

class _DirectManipulationDemo extends StatefulWidget {
  const _DirectManipulationDemo();

  @override
  State<_DirectManipulationDemo> createState() =>
      _DirectManipulationDemoState();
}

class _DirectManipulationDemoState extends State<_DirectManipulationDemo> {
  double _value = 0.5;
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CupertinoSlider(
          value: _value,
          onChanged: (value) => setState(() => _value = value),
        ),
        const SizedBox(height: 16),
        CupertinoSwitch(
          value: _switchValue,
          onChanged: (value) => setState(() => _switchValue = value),
        ),
      ],
    );
  }
}
