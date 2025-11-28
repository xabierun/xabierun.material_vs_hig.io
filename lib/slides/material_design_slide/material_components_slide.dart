import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:material_vs_hig/slides/material_design_slide/widgets/m3_app_bar_sample.dart';
import 'package:material_vs_hig/slides/material_design_slide/widgets/m3_progress_indicator_sample.dart';
import 'package:material_vs_hig/tokens/colors/material_colors.dart';
import 'package:material_vs_hig/tokens/radius/material_radius.dart';
import 'package:material_vs_hig/tokens/spacing/material_spacing.dart';
import 'package:material_vs_hig/tokens/text_styles/material_text_styles.dart';

class MaterialComponentsSlide extends FlutterDeckSlideWidget {
  const MaterialComponentsSlide({super.key});

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
  bool _isFilterSelected1 = false;
  bool _isFilterSelected2 = true;
  bool _isFilterSelected3 = false;
  int _segmentedValue = 0;
  double _sliderValue = 0.5;
  bool _switchValue = true;
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    final flutterDeck = FlutterDeck.of(context);
    final currentSlide = flutterDeck.slideNumber - 1;
    final totalSlides = flutterDeck.router.slides.length;
    const slideTitle = 'Material Design 3 Components';

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
                        Icons.widgets_outlined,
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
                          Icons.filter_list,
                          color: MaterialColors.onSurfaceVariant,
                        ),
                        onPressed: () {},
                        tooltip: 'フィルター',
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(width: MaterialSpacing.s8),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: MaterialSpacing.s8),
              if (currentSlide < totalSlides - 1)
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
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
        padding: MaterialSpacing.all48,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // タイトルセクション
            Text(
              'よく使われるコンポーネント',
              style: MaterialTextStyles.headingOnSurface.copyWith(
                fontSize: 48,
              ),
            ),
            const SizedBox(height: MaterialSpacing.s8),
            Text(
              'Material Design 3 expressiveの代表的なコンポーネント',
              style: MaterialTextStyles.bodyOnSurface.copyWith(
                fontSize: 18,
                color: MaterialColors.onSurface.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: MaterialSpacing.s32),

            // コンポーネントグリッド
            Expanded(
              child: Row(
                children: [
                  // 左カラム
                  Expanded(
                    child: Column(
                      children: [
                        // Chips セクション
                        Expanded(
                          child: _ComponentCard(
                            title: 'Filter Chips',
                            description: '選択可能なフィルターチップ',
                            child: Wrap(
                              spacing: MaterialSpacing.s12,
                              runSpacing: MaterialSpacing.s12,
                              children: [
                                FilterChip(
                                  label: const Text('写真'),
                                  selected: _isFilterSelected1,
                                  onSelected: (value) {
                                    setState(() => _isFilterSelected1 = value);
                                  },
                                  selectedColor:
                                      MaterialColors.primaryContainer,
                                  checkmarkColor:
                                      MaterialColors.onPrimaryContainer,
                                ),
                                FilterChip(
                                  label: const Text('動画'),
                                  selected: _isFilterSelected2,
                                  onSelected: (value) {
                                    setState(() => _isFilterSelected2 = value);
                                  },
                                  selectedColor:
                                      MaterialColors.primaryContainer,
                                  checkmarkColor:
                                      MaterialColors.onPrimaryContainer,
                                ),
                                FilterChip(
                                  label: const Text('音楽'),
                                  selected: _isFilterSelected3,
                                  onSelected: (value) {
                                    setState(() => _isFilterSelected3 = value);
                                  },
                                  selectedColor:
                                      MaterialColors.primaryContainer,
                                  checkmarkColor:
                                      MaterialColors.onPrimaryContainer,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: MaterialSpacing.s16),

                        // Segmented Button
                        Expanded(
                          child: _ComponentCard(
                            title: 'Segmented Button',
                            description: '排他的選択のためのボタングループ',
                            child: SegmentedButton<int>(
                              segments: const [
                                ButtonSegment(
                                  value: 0,
                                  label: Text('日'),
                                  icon: Icon(Icons.calendar_view_day),
                                ),
                                ButtonSegment(
                                  value: 1,
                                  label: Text('週'),
                                  icon: Icon(Icons.calendar_view_week),
                                ),
                                ButtonSegment(
                                  value: 2,
                                  label: Text('月'),
                                  icon: Icon(Icons.calendar_view_month),
                                ),
                              ],
                              selected: {_segmentedValue},
                              onSelectionChanged: (Set<int> newSelection) {
                                setState(() {
                                  _segmentedValue = newSelection.first;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: MaterialSpacing.s16),

                        // Slider
                        Expanded(
                          child: _ComponentCard(
                            title: 'Slider',
                            description: '値を連続的に選択',
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Slider(
                                  value: _sliderValue,
                                  onChanged: (value) {
                                    setState(() => _sliderValue = value);
                                  },
                                ),
                                Text(
                                  '${(_sliderValue * 100).round()}%',
                                  style: MaterialTextStyles.body.copyWith(
                                    color: MaterialColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: MaterialSpacing.s16),

                  // 中央カラム（追加）
                  const Expanded(
                    child: Column(
                      children: [
                        // App Bars
                        Expanded(
                          child: _ComponentCard(
                            title: 'Top App Bar',
                            description: '画面上部のナビゲーション',
                            child: M3AppBarSample(),
                          ),
                        ),
                        SizedBox(height: MaterialSpacing.s16),

                        // Progress Indicators
                        Expanded(
                          child: _ComponentCard(
                            title: 'Progress Indicators',
                            description: '処理の進行状況を表示',
                            child: M3ProgressIndicatorSample(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: MaterialSpacing.s16),

                  // 右カラム
                  Expanded(
                    child: Column(
                      children: [
                        // FAB
                        Expanded(
                          child: _ComponentCard(
                            title: 'Floating Action Button',
                            description: '画面の主要アクション',
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton.extended(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add),
                                      label: const Text('作成'),
                                    ),
                                    const SizedBox(width: MaterialSpacing.s16),
                                    FloatingActionButton(
                                      onPressed: () {},
                                      child: const Icon(Icons.edit),
                                    ),
                                    const SizedBox(width: MaterialSpacing.s16),
                                    FloatingActionButton.small(
                                      onPressed: () {},
                                      child: const Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: MaterialSpacing.s16),

                        // Switch & Badge (復活)
                        Expanded(
                          child: _ComponentCard(
                            title: 'Switch & Badge',
                            description: 'トグルと通知バッジ',
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      '通知',
                                      style: MaterialTextStyles.body,
                                    ),
                                    const SizedBox(width: MaterialSpacing.s16),
                                    Switch(
                                      value: _switchValue,
                                      onChanged: (value) {
                                        setState(() => _switchValue = value);
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: MaterialSpacing.s24),
                                Badge.count(
                                  count: 3,
                                  child: const Icon(
                                    Icons.notifications,
                                    size: 48,
                                    color: MaterialColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: MaterialSpacing.s16),

                        // Navigation Bar
                        Expanded(
                          child: _ComponentCard(
                            title: 'Navigation Bar',
                            description: 'ボトムナビゲーション',
                            child: NavigationBar(
                              selectedIndex: _bottomNavIndex,
                              onDestinationSelected: (index) {
                                setState(() => _bottomNavIndex = index);
                              },
                              destinations: const [
                                NavigationDestination(
                                  icon: Icon(Icons.home_outlined),
                                  selectedIcon: Icon(Icons.home),
                                  label: 'ホーム',
                                ),
                                NavigationDestination(
                                  icon: Icon(Icons.search),
                                  label: '検索',
                                ),
                                NavigationDestination(
                                  icon: Icon(Icons.person_outline),
                                  selectedIcon: Icon(Icons.person),
                                  label: 'プロフィール',
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
          ],
        ),
      ),
    );
  }
}

class _ComponentCard extends StatelessWidget {
  const _ComponentCard({
    required this.title,
    required this.description,
    required this.child,
  });

  final String title;
  final String description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MaterialSpacing.all24,
      decoration: BoxDecoration(
        color: MaterialColors.surface,
        borderRadius: MaterialRadius.all16,
        boxShadow: [
          BoxShadow(
            color: MaterialColors.shadow.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: MaterialTextStyles.subheading.copyWith(
              color: MaterialColors.primary,
            ),
          ),
          const SizedBox(height: MaterialSpacing.s4),
          Text(
            description,
            style: MaterialTextStyles.body.copyWith(
              fontSize: 12,
              color: MaterialColors.onSurface.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: MaterialSpacing.s16),
          Expanded(
            child: Center(child: child),
          ),
        ],
      ),
    );
  }
}
