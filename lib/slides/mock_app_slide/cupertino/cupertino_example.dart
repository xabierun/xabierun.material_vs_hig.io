import 'package:flutter/cupertino.dart';
import 'package:material_vs_hig/slides/mock_app_slide/cupertino/widgets/glass_bottom_navigation.dart';
import 'package:material_vs_hig/slides/mock_app_slide/cupertino/widgets/grid_item.dart';
import 'package:material_vs_hig/tokens/colors/hig_colors.dart';

class CupertinoExample extends StatefulWidget {
  const CupertinoExample({super.key});

  @override
  State<CupertinoExample> createState() => _CupertinoExampleState();
}

class _CupertinoExampleState extends State<CupertinoExample> {
  final ScrollController _scrollController = ScrollController();
  final List<int> _imageIndices = [];
  bool _isLoading = false;
  int _selectedTabIndex = 0;
  static const int _initialItemCount = 20;

  @override
  void initState() {
    super.initState();
    _imageIndices.addAll(List.generate(_initialItemCount, (index) => index));
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isLoading) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final threshold = maxScroll * 0.8;

    if (currentScroll >= threshold) {
      _loadMoreImages();
    }
  }

  Future<void> _loadMoreImages() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    await Future<void>.delayed(const Duration(milliseconds: 500));

    setState(() {
      final startIndex = _imageIndices.length;
      _imageIndices.addAll(
        List.generate(20, (index) => startIndex + index),
      );
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: HIGColors.background,
      child: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index >= _imageIndices.length) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }

                    return GridItem(imageIndex: _imageIndices[index]);
                  },
                  childCount: _isLoading
                      ? _imageIndices.length + 1
                      : _imageIndices.length,
                ),
              ),
            ],
          ),
          GlassBottomNavigation(
            selectedIndex: _selectedTabIndex,
            onTabChanged: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
