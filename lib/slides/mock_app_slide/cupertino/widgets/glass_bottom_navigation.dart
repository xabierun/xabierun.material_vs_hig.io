import 'package:flutter/cupertino.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:material_vs_hig/slides/mock_app_slide/cupertino/widgets/tab_item.dart';

class GlassBottomNavigation extends StatelessWidget {
  const GlassBottomNavigation({
    required this.selectedIndex,
    required this.onTabChanged,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: LiquidGlassLayer(
            settings: const LiquidGlassSettings(
              blur: 15,
              glassColor: Color(0x26FFFFFF),
              lightIntensity: 0.9,
              ambientStrength: 0.6,
            ),
            child: LiquidGlass(
              shape: const LiquidRoundedSuperellipse(
                borderRadius: 24,
              ),
              child: GlassGlow(
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TabItem(
                        icon: CupertinoIcons.home,
                        label: 'Home',
                        isSelected: selectedIndex == 0,
                        onTap: () => onTabChanged(0),
                      ),
                      TabItem(
                        icon: CupertinoIcons.search,
                        label: 'Search',
                        isSelected: selectedIndex == 1,
                        onTap: () => onTabChanged(1),
                      ),
                      TabItem(
                        icon: CupertinoIcons.person,
                        label: 'Profile',
                        isSelected: selectedIndex == 2,
                        onTap: () => onTabChanged(2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
