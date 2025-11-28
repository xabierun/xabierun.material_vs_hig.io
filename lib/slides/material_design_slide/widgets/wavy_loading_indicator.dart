import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:material_vs_hig/tokens/colors/material_colors.dart';

class WavyLoadingIndicator extends StatefulWidget {
  const WavyLoadingIndicator({
    super.key,
    this.size = 48.0,
    this.color = MaterialColors.primary,
    this.strokeWidth = 4.0,
    this.value,
  });

  final double size;
  final Color color;
  final double strokeWidth;
  final double? value;

  @override
  State<WavyLoadingIndicator> createState() => _WavyLoadingIndicatorState();
}

class _WavyLoadingIndicatorState extends State<WavyLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // ゆったりとした動き
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.size, widget.size),
          painter: _WavyShapePainter(
            animationValue: _controller.value,
            color: widget.color,
            strokeWidth: widget.strokeWidth,
            progress: widget.value,
          ),
        );
      },
    );
  }
}

class _WavyShapePainter extends CustomPainter {
  _WavyShapePainter({
    required this.animationValue,
    required this.color,
    required this.strokeWidth,
    this.progress,
  });

  final double animationValue;
  final Color color;
  final double strokeWidth;
  final double? progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width) / 2;

    if (progress == null) {
      // Indeterminate (Loading)
      _drawLoadingShape(canvas, center, radius);
    } else {
      // Determinate (Progress)
      _drawProgressShape(canvas, center, radius);
    }
  }

  void _drawLoadingShape(Canvas canvas, Offset center, double radius) {
    // M3 Loading Indicator:
    // 回転しながら、形状が少し有機的に変化する

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    const points = 100; // 滑らかにするための分割数
    const waves = 8.0; // 波の数（花びらの数）

    // アニメーション: 回転
    final rotation = animationValue * 2 * math.pi;

    // アニメーション: 呼吸（波の深さが変化）
    // 0.1 〜 0.2 の間で変動
    final waveDepth = radius * (0.15 + 0.05 * math.sin(animationValue * 4 * math.pi));

    for (var i = 0; i <= points; i++) {
      final t = i / points;
      final angle = t * 2 * math.pi + rotation;

      // 極座標方程式: r = R + d * sin(k * theta)
      // 波の形状を作る
      final currentRadius = (radius - waveDepth) +
          waveDepth * math.sin(angle * waves);

      final x = center.dx + currentRadius * math.cos(angle);
      final y = center.dy + currentRadius * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    // 少し影をつけるか、レイヤーを重ねる表現もM3らしいが、まずはフラットに
    canvas.drawPath(path, paint);
  }

  void _drawProgressShape(Canvas canvas, Offset center, double radius) {
    // Determinateな場合は円形のトラックとインジケータ
    // ここでは角丸の円弧を描く

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final trackPaint = Paint()
      ..color = color.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius - strokeWidth / 2, trackPaint);

    final sweepAngle = 2 * math.pi * (progress ?? 0);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      -math.pi / 2,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _WavyShapePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.progress != progress ||
        oldDelegate.color != color;
  }
}
