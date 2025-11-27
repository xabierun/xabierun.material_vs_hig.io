import 'package:flutter/material.dart';
import 'package:material_vs_hig/slides/mock_app_slide/material/widgets/material_grid_item.dart';
import 'package:material_vs_hig/tokens/colors/material_colors.dart';

class MaterialExample extends StatefulWidget {
  const MaterialExample({
    super.key,
  });

  @override
  State<MaterialExample> createState() => _MaterialExampleState();
}

class _MaterialExampleState extends State<MaterialExample> {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: MaterialColors.primary,
          primary: MaterialColors.primary,
          onPrimary: MaterialColors.onPrimary,
          secondary: MaterialColors.secondary,
          onSecondary: MaterialColors.onSecondary,
          surface: MaterialColors.surface,
          onSurface: MaterialColors.onSurface,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: MaterialColors.surfaceContainer,
          indicatorColor: MaterialColors.primaryContainer,
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: MaterialColors.onSurface,
              );
            }
            return const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: MaterialColors.onSurfaceVariant,
            );
          }),
        ),
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                MaterialColors.primaryLight.withOpacity(0.1),
                MaterialColors.secondaryLight.withOpacity(0.05),
                MaterialColors.primaryContainer.withOpacity(0.15),
              ],
            ),
          ),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: 120,
                pinned: true,
                elevation: 0,
                backgroundColor: MaterialColors.primary,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(
                    'Material Gallery',
                    style: TextStyle(
                      color: MaterialColors.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  centerTitle: true,
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          MaterialColors.primary,
                          MaterialColors.primaryDark,
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(28),
                        bottomRight: Radius.circular(28),
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index >= _imageIndices.length) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return MaterialGridItem(
                        imageIndex: _imageIndices[index],
                      );
                    },
                    childCount: _isLoading
                        ? _imageIndices.length + 1
                        : _imageIndices.length,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedTabIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedTabIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              selectedIcon: Icon(Icons.search),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
