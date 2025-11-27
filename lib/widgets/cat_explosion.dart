import 'dart:math';

import 'package:flutter/material.dart';

/// 猫の爆発エフェクト
class CatExplosion extends StatefulWidget {
  /// 猫の爆発エフェクト
  const CatExplosion({
    required this.size,
    super.key,
  });

  /// 猫のサイズ
  final double size;

  @override
  State<CatExplosion> createState() => _CatExplosionState();
}

class _CatExplosionState extends State<CatExplosion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<_Particle> _particles;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // パーティクルを生成
    _particles = List.generate(20, (index) {
      final angle = (2 * pi / 20) * index;
      final velocity = 100.0 + _random.nextDouble() * 100;
      return _Particle(
        angle: angle,
        velocity: velocity,
        color: _randomColor(),
        size: 4.0 + _random.nextDouble() * 6,
      );
    });

    _controller.forward();
  }

  Color _randomColor() {
    final colors = [
      Colors.orange,
      Colors.red,
      Colors.yellow,
      Colors.pink,
      Colors.amber,
    ];
    return colors[_random.nextInt(colors.length)];
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
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // パーティクル
              ..._particles.map((particle) {
                final progress = _controller.value;
                final distance = particle.velocity * progress;
                final dx = cos(particle.angle) * distance;
                final dy = sin(particle.angle) * distance;
                final opacity = 1.0 - progress;

                return Transform.translate(
                  offset: Offset(dx, dy),
                  child: Opacity(
                    opacity: opacity,
                    child: Container(
                      width: particle.size,
                      height: particle.size,
                      decoration: BoxDecoration(
                        color: particle.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              }),
              // 猫の絵文字がフェードアウト
              Opacity(
                opacity: 1.0 - _controller.value,
                child: Transform.scale(
                  scale: 1.0 + (_controller.value * 0.5),
                  child: Text(
                    '🐱',
                    style: TextStyle(fontSize: widget.size * 0.67),
                  ),
                ),
              ),
              // 💥エフェクトがフェードイン・アウト
              if (_controller.value > 0.1 && _controller.value < 0.5)
                Opacity(
                  opacity: _controller.value < 0.3
                      ? (_controller.value - 0.1) / 0.2
                      : (0.5 - _controller.value) / 0.2,
                  child: Text(
                    '💥',
                    style: TextStyle(fontSize: widget.size * 0.9),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _Particle {
  _Particle({
    required this.angle,
    required this.velocity,
    required this.color,
    required this.size,
  });

  final double angle;
  final double velocity;
  final Color color;
  final double size;
}

