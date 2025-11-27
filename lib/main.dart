import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:material_vs_hig/slides/hig_slide/hig_slide.dart';
import 'package:material_vs_hig/slides/material_design_slide/material_design_slide.dart';
import 'package:material_vs_hig/slides/mock_app_slide/mock_app_slide.dart';
import 'package:material_vs_hig/slides/thanks/thank_you_slide.dart';
import 'package:material_vs_hig/slides/title_slide/title_slide.dart';
import 'package:material_vs_hig/widgets/presentation_timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PresentationTimer(
      child: FlutterDeckApp(
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
}
