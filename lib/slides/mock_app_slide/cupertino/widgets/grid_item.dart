import 'package:flutter/cupertino.dart';
import 'package:material_vs_hig/slides/mock_app_slide/cupertino/image_detail_screen.dart';
import 'package:material_vs_hig/tokens/colors/hig_colors.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    required this.imageIndex,
    super.key,
  });

  final int imageIndex;

  static const List<IconData> _iconList = [
    CupertinoIcons.star_fill,
    CupertinoIcons.heart_fill,
    CupertinoIcons.bell_fill,
    CupertinoIcons.bookmark_fill,
    CupertinoIcons.camera_fill,
    CupertinoIcons.music_note,
    CupertinoIcons.game_controller_solid,
    CupertinoIcons.chat_bubble_fill,
    CupertinoIcons.paperplane_fill,
    CupertinoIcons.settings_solid,
    CupertinoIcons.cart_fill,
    CupertinoIcons.bag_fill,
    CupertinoIcons.gift_fill,
    CupertinoIcons.flame_fill,
    CupertinoIcons.sparkles,
  ];

  static const List<Color> _colors = [
    HIGColors.primary,
    HIGColors.secondary,
    HIGColors.accent,
    HIGColors.error,
    HIGColors.success,
  ];

  @override
  Widget build(BuildContext context) {
    final iconIndex = imageIndex % _iconList.length;
    final icon = _iconList[iconIndex];
    final colorIndex = imageIndex % _colors.length;
    final color = _colors[colorIndex];

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute<void>(
            builder: (context) => ImageDetailScreen(
              imageIndex: imageIndex,
              icon: icon,
              color: color,
            ),
          ),
        );
      },
      child: ColoredBox(
        color: HIGColors.primaryLight,
        child: Center(
          child: Icon(
            icon,
            color: color,
            size: 48,
          ),
        ),
      ),
    );
  }
}
