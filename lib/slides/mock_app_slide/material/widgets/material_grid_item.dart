import 'package:flutter/material.dart';
import 'package:material_vs_hig/slides/mock_app_slide/material/material_detail_screen.dart';
import 'package:material_vs_hig/tokens/colors/material_colors.dart';

class MaterialGridItem extends StatelessWidget {
  const MaterialGridItem({
    required this.imageIndex,
    super.key,
  });

  final int imageIndex;

  static const List<IconData> _iconList = [
    Icons.star,
    Icons.favorite,
    Icons.notifications,
    Icons.bookmark,
    Icons.camera_alt,
    Icons.music_note,
    Icons.videogame_asset,
    Icons.chat_bubble,
    Icons.send,
    Icons.settings,
    Icons.shopping_cart,
    Icons.shopping_bag,
    Icons.card_giftcard,
    Icons.local_fire_department,
    Icons.auto_awesome,
  ];

  static const List<Color> _colors = [
    MaterialColors.primary,
    MaterialColors.secondary,
    MaterialColors.primaryLight,
    MaterialColors.secondaryLight,
    MaterialColors.primaryDark,
  ];

  @override
  Widget build(BuildContext context) {
    final iconIndex = imageIndex % _iconList.length;
    final icon = _iconList[iconIndex];
    final colorIndex = imageIndex % _colors.length;
    final color = _colors[colorIndex];

    return Hero(
      tag: 'image_$imageIndex',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => MaterialDetailScreen(
                  imageIndex: imageIndex,
                  icon: icon,
                  color: color,
                ),
              ),
            );
          },
          borderRadius: BorderRadius.circular(24),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    color.withOpacity(0.15),
                    color.withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: color,
                  size: 64,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
