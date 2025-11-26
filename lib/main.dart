import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:material_vs_hig/slides/title_slide/title_slide.dart';
import 'package:material_vs_hig/slides/material_design_slide/material_design_slide.dart';

void main() {
  runApp(
    FlutterDeckApp(
      configuration: const FlutterDeckConfiguration(),
      slides: [
        const TitleSlide(),
        const MaterialDesignSlide(),
      ],
    ),
  );
}
