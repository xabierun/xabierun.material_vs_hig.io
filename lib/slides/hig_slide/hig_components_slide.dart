import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:material_vs_hig/tokens/colors/hig_colors.dart';
import 'package:material_vs_hig/tokens/radius/hig_radius.dart';
import 'package:material_vs_hig/tokens/spacing/hig_spacing.dart';
import 'package:material_vs_hig/tokens/text_styles/hig_text_styles.dart';

class HIGComponentsSlide extends FlutterDeckSlideWidget {
  const HIGComponentsSlide({super.key});

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
  // Filter Chips equivalent (Custom Toggle Buttons)
  bool _isFilterSelected1 = false;
  bool _isFilterSelected2 = true;
  bool _isFilterSelected3 = false;

  // Segmented Control
  int _segmentedValue = 0;

  // Slider
  double _sliderValue = 0.5;

  // Switch
  bool _switchValue = true;

  // Tab Bar
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final flutterDeck = FlutterDeck.of(context);
    final currentSlide = flutterDeck.slideNumber - 1;
    final totalSlides = flutterDeck.router.slides.length;
    const slideTitle = 'Human Interface Guidelines Components';

    return CupertinoPageScaffold(
      backgroundColor: HIGColors.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: HIGColors.surfaceBlur,
        border: null,
        leading: currentSlide > 0
            ? CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.back),
                onPressed: flutterDeck.previous,
              )
            : const SizedBox(width: 44), // Spacer
        middle: Text(slideTitle, style: HIGTextStyles.body),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(CupertinoIcons.slider_horizontal_3),
              onPressed: () {},
            ),
            if (currentSlide < totalSlides - 1)
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.forward),
                onPressed: flutterDeck.next,
              ),
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: HIGSpacing.all48,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section
              Text(
                'よく使われるコンポーネント',
                style: HIGTextStyles.titlePrimary,
              ),
              const SizedBox(height: HIGSpacing.s8),
              Text(
                'iOS (Human Interface Guidelines) の代表的なコンポーネント',
                style: HIGTextStyles.bodyLabelSecondary.copyWith(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: HIGSpacing.s32),

              // Component Grid
              Expanded(
                child: Row(
                  children: [
                    // Left Column
                    Expanded(
                      child: Column(
                        children: [
                          // Filter Buttons (Chips equivalent)
                          Expanded(
                            child: _ComponentCard(
                              title: 'Filter Buttons',
                              description: '選択可能なフィルターボタン（カスタム）',
                              child: Wrap(
                                spacing: HIGSpacing.s12,
                                runSpacing: HIGSpacing.s12,
                                children: [
                                  _buildFilterButton(
                                    '写真',
                                    _isFilterSelected1,
                                    (val) => setState(
                                        () => _isFilterSelected1 = val),
                                  ),
                                  _buildFilterButton(
                                    '動画',
                                    _isFilterSelected2,
                                    (val) => setState(
                                        () => _isFilterSelected2 = val),
                                  ),
                                  _buildFilterButton(
                                    '音楽',
                                    _isFilterSelected3,
                                    (val) => setState(
                                        () => _isFilterSelected3 = val),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: HIGSpacing.s16),

                          // Segmented Control
                          Expanded(
                            child: _ComponentCard(
                              title: 'Segmented Control',
                              description: '相互排他的な選択コントロール',
                              child: SizedBox(
                                width: double.infinity,
                                child: CupertinoSlidingSegmentedControl<int>(
                                  groupValue: _segmentedValue,
                                  onValueChanged: (int? value) {
                                    if (value != null) {
                                      setState(() {
                                        _segmentedValue = value;
                                      });
                                    }
                                  },
                                  children: const <int, Widget>{
                                    0: Padding(
                                      padding: HIGSpacing.horizontal16,
                                      child: Text('日'),
                                    ),
                                    1: Padding(
                                      padding: HIGSpacing.horizontal16,
                                      child: Text('週'),
                                    ),
                                    2: Padding(
                                      padding: HIGSpacing.horizontal16,
                                      child: Text('月'),
                                    ),
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: HIGSpacing.s16),

                          // Slider
                          Expanded(
                            child: _ComponentCard(
                              title: 'Slider',
                              description: '値を連続的に選択',
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: CupertinoSlider(
                                      value: _sliderValue,
                                      onChanged: (value) {
                                        setState(() => _sliderValue = value);
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: HIGSpacing.s8),
                                  Text(
                                    '${(_sliderValue * 100).round()}%',
                                    style: HIGTextStyles.body.copyWith(
                                      color: HIGColors.primary,
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
                    const SizedBox(width: HIGSpacing.s16),

                    // Center Column
                    Expanded(
                      child: Column(
                        children: [
                          // Navigation Bar
                          Expanded(
                            child: _ComponentCard(
                              title: 'Navigation Bar',
                              description: '画面上部のナビゲーション',
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: HIGColors.separator),
                                  borderRadius: HIGRadius.all8,
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: const CupertinoNavigationBar(
                                  backgroundColor: HIGColors.surfaceBlur,
                                  middle: Text('Title'),
                                  leading: Icon(CupertinoIcons.back),
                                  trailing: Icon(CupertinoIcons.share),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: HIGSpacing.s16),

                          // Activity Indicator
                          Expanded(
                            child: _ComponentCard(
                              title: 'Activity Indicator',
                              description: '処理の進行状況を表示',
                              child: const CupertinoActivityIndicator(
                                radius: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: HIGSpacing.s16),

                    // Right Column
                    Expanded(
                      child: Column(
                        children: [
                          // Primary Button / Toolbar
                          Expanded(
                            child: _ComponentCard(
                              title: 'Primary Button',
                              description: '主要なアクション',
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CupertinoButton.filled(
                                    child: const Text('Create'),
                                    onPressed: () {},
                                  ),
                                  const SizedBox(height: HIGSpacing.s16),
                                  CupertinoButton(
                                    child: const Text('Edit'),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: HIGSpacing.s16),

                          // Switch & Badge
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
                                        style: HIGTextStyles.body,
                                      ),
                                      const SizedBox(width: HIGSpacing.s16),
                                      CupertinoSwitch(
                                        value: _switchValue,
                                        onChanged: (value) {
                                          setState(() => _switchValue = value);
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: HIGSpacing.s24),
                                  Badge.count(
                                    count: 3,
                                    backgroundColor: HIGColors.error,
                                    child: const Icon(
                                      CupertinoIcons.bell,
                                      size: 48,
                                      color: HIGColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: HIGSpacing.s16),

                          // Tab Bar
                          Expanded(
                            child: _ComponentCard(
                              title: 'Tab Bar',
                              description: '画面下部のナビゲーション',
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: HIGColors.separator),
                                  borderRadius: HIGRadius.all8,
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: CupertinoTabBar(
                                  currentIndex: _tabIndex,
                                  onTap: (index) {
                                    setState(() => _tabIndex = index);
                                  },
                                  items: const [
                                    BottomNavigationBarItem(
                                      icon: Icon(CupertinoIcons.home),
                                      label: 'Home',
                                    ),
                                    BottomNavigationBarItem(
                                      icon: Icon(CupertinoIcons.search),
                                      label: 'Search',
                                    ),
                                    BottomNavigationBarItem(
                                      icon: Icon(CupertinoIcons.profile_circled),
                                      label: 'Profile',
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton(
      String label, bool isSelected, ValueChanged<bool> onSelected) {
    return GestureDetector(
      onTap: () => onSelected(!isSelected),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? HIGColors.primary : HIGColors.surface,
          borderRadius: HIGRadius.all16,
          border: Border.all(
            color: isSelected ? HIGColors.primary : HIGColors.separator,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected) ...[
              const Icon(
                CupertinoIcons.check_mark,
                size: 16,
                color: HIGColors.onPrimary,
              ),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: HIGTextStyles.caption.copyWith(
                color: isSelected ? HIGColors.onPrimary : HIGColors.label,
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
      padding: HIGSpacing.all24,
      decoration: BoxDecoration(
        color: HIGColors.surface,
        borderRadius: HIGRadius.all16,
        boxShadow: [
          BoxShadow(
            color: HIGColors.onSurface.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: HIGColors.separator.withOpacity(0.2),
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: HIGTextStyles.subheading.copyWith(
              color: HIGColors.label,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: HIGSpacing.s4),
          Text(
            description,
            style: HIGTextStyles.captionLabelSecondary.copyWith(fontSize: 12),
          ),
          const SizedBox(height: HIGSpacing.s16),
          Expanded(
            child: Center(child: child),
          ),
        ],
      ),
    );
  }
}

