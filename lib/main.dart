import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:material_vs_hig/slides/hig_slide/hig_slide.dart';
import 'package:material_vs_hig/slides/material_design_slide/material_design_slide.dart';
import 'package:material_vs_hig/slides/mock_app_slide/mock_app_slide.dart';
import 'package:material_vs_hig/slides/thanks/thank_you_slide.dart';
import 'package:material_vs_hig/slides/title_slide/title_slide.dart';

void main() {
  runApp(
    FlutterDeckApp(
      slides: const [
        TitleSlide(),
        MaterialDesignSlide(),
        HigSlide(),
        MockAppSlide(),
        ThankYouSlide(),
      ],
    ),
  );
}
