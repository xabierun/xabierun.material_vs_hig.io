import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_vs_hig/widgets/cat_explosion.dart';

/// プレゼンテーション用のタイマー付き進捗バー
class PresentationTimer extends StatefulWidget {
  /// プレゼンテーション用のタイマー付き進捗バー
  const PresentationTimer({
    required this.child,
    this.durationInSeconds = 600, // 10分 = 600秒
    super.key,
  });

  /// 子ウィジェット
  final Widget child;

  /// プレゼンテーションの制限時間（秒）
  final int durationInSeconds;

  @override
  State<PresentationTimer> createState() => _PresentationTimerState();
}

class _PresentationTimerState extends State<PresentationTimer> {
  late Timer _timer;
  late int _remainingMilliseconds;
  bool _hasExploded = false;
  bool _isCatExploding = false;

  @override
  void initState() {
    super.initState();
    _remainingMilliseconds = widget.durationInSeconds * 1000;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (!mounted) return;

      setState(() {
        _remainingMilliseconds -= 50;
      });

      // 時間切れで猫を爆発
      if (_remainingMilliseconds <= 0 && !_hasExploded) {
        _hasExploded = true;
        setState(() {
          _isCatExploding = true;
        });
      }
    });
  }

  double get _progress {
    final totalMilliseconds = widget.durationInSeconds * 1000;
    final progress = _remainingMilliseconds / totalMilliseconds;
    return progress.clamp(0.0, 1.0);
  }

  void _onCatTapped() {
    setState(() {
      _isCatExploding = true;
    });

    // 800ms後に爆発状態を解除
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() {
          _isCatExploding = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // メインコンテンツ
          widget.child,

          // 移動する猫アイコン
          Positioned.fill(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // 猫の横方向の位置を計算（左端から右端まで）
                const catSize = 30.0;
                final availableWidth = constraints.maxWidth - catSize;
                final catPosition = availableWidth * (1 - _progress);

                return Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 100),
                      left: catPosition,
                      top: 8,
                      child: GestureDetector(
                        onTap: _onCatTapped,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: _isCatExploding
                              ? const CatExplosion(size: catSize)
                              : Container(
                                  width: catSize,
                                  height: catSize,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.6),
                                      width: 2,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '🐱',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
