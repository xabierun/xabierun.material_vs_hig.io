import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

void main() {
  runApp(
    FlutterDeckApp(
      configuration: const FlutterDeckConfiguration(
        // title: 'Material Design 3 Expressive vs HIG Liquid Glass',
      ),
      slides: [const _TitleSlide()],
    ),
  );
}

class _TitleSlide extends StatelessWidget {
  const _TitleSlide();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Material Design 3 Expressive
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Material Design 3',
                  style: textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Expressive',
                  style: textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w300,
                    color: Colors.deepPurple.shade300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 64),
            // VS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 4, height: 80, color: Colors.deepPurple),
                const SizedBox(width: 24),
                Text(
                  'vs',
                  style: textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 24),
                Container(width: 4, height: 80, color: Colors.blue),
              ],
            ),
            const SizedBox(height: 64),
            // HIG Liquid Glass
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'HIG',
                  style: textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Liquid Glass',
                  style: textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w300,
                    color: Colors.blue.shade300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),
            // Subtitle
            Text(
              'デザインシステムの比較',
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 48),
            // Comparison Points
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '比較ポイント',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
