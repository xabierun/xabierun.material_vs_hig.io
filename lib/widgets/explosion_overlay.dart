import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_vs_hig/slides/thanks/firework.dart';

/// 画面全体に爆発エフェクトを表示するオーバーレイ
class ExplosionOverlay extends StatefulWidget {
  /// 画面全体に爆発エフェクトを表示するオーバーレイ
  const ExplosionOverlay({
    required this.onClose,
    super.key,
  });

  /// 閉じるボタンが押されたときのコールバック
  final VoidCallback onClose;

  @override
  State<ExplosionOverlay> createState() => _ExplosionOverlayState();
}

class _ExplosionOverlayState extends State<ExplosionOverlay> {
  final List<Offset> _explosionPoints = [];
  bool _isExploding = false;

  @override
  void initState() {
    super.initState();
    _startExplosion();
  }

  void _startExplosion() {
    setState(() {
      _isExploding = true;
    });

    // 画面全体にランダムに爆発ポイントを生成
    final random = Random();
    Future.delayed(Duration.zero, () {
      if (!mounted) return;

      final size = MediaQuery.of(context).size;
      for (var i = 0; i < 30; i++) {
        Future.delayed(Duration(milliseconds: i * 100), () {
          if (!mounted) return;
          setState(() {
            _explosionPoints.add(
              Offset(
                random.nextDouble() * size.width,
                random.nextDouble() * size.height,
              ),
            );
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(
        color: Colors.black.withOpacity(0.8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 爆発エフェクト
            ..._explosionPoints.map(
              (point) => Firework(initialPosition: point),
            ),
            // 中央のメッセージ
            if (_isExploding)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '💥 時間切れ！💥',
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'お疲れ様でした！',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 48),
                    ElevatedButton(
                      onPressed: widget.onClose,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                      child: const Text(
                        '閉じる',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
