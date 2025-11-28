import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:material_vs_hig/slides/mock_app_slide/cupertino/cupertino_example.dart';
import 'package:material_vs_hig/slides/mock_app_slide/material/material_example.dart';

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
