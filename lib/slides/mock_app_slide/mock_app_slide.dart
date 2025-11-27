import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:material_vs_hig/slides/mock_app_slide/cupertino/cupertino_example.dart';
import 'package:material_vs_hig/slides/mock_app_slide/material/material_example.dart';
import 'package:material_vs_hig/tokens/colors/material_colors.dart';
import 'package:material_vs_hig/tokens/colors/hig_colors.dart';
import 'package:material_vs_hig/tokens/text_styles/material_text_styles.dart';
import 'package:material_vs_hig/tokens/text_styles/hig_text_styles.dart';
import 'package:material_vs_hig/tokens/spacing/hig_spacing.dart';

class MockAppSlide extends FlutterDeckSlideWidget {
  const MockAppSlide({super.key});

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
    return const Row(
      children: [
        Spacer(),
        SizedBox(
          width: 400,
          child: MaterialExample(),
        ),
        Spacer(),
        SizedBox(
          width: 400,
          child: CupertinoExample(),
        ),
        Spacer(),
      ],
    );
  }
}
