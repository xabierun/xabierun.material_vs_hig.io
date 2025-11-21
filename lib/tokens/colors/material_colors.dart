import 'package:flutter/material.dart';

/// Material Design 3 Expressive のカラートークン
///
/// Material Design 3 のカラーパレットに基づいた色定義です。
/// deepPurple をベースカラーとして使用しています。
class MaterialColors {
  /// deepPurple[500] - プライマリーカラー
  static const Color primary = Color(0xFF6200EE);

  /// deepPurple[300] - 明るいプライマリーカラー
  static const Color primaryLight = Color(0xFF9D46FF);

  /// deepPurple[700] - 暗いプライマリーカラー
  static const Color primaryDark = Color(0xFF3700B3);

  /// プライマリーカラーの上に表示するテキストの色
  static const Color onPrimary = Color(0xFFFFFFFF);

  /// Secondary Colors
  /// セカンダリーカラー。プライマリーカラーを補完する色として使用します。

  /// teal[200] - セカンダリーカラー
  static const Color secondary = Color(0xFF03DAC6);

  /// teal[100] - 明るいセカンダリーカラー
  static const Color secondaryLight = Color(0xFF66FFF9);

  /// teal[700] - 暗いセカンダリーカラー
  static const Color secondaryDark = Color(0xFF018786);

  /// セカンダリーカラーの上に表示するテキストの色
  static const Color onSecondary = Color(0xFF000000);

  /// Surface Colors
  /// サーフェスカラー。カードやダイアログなどの表面に使用します。

  /// サーフェスカラー
  static const Color surface = Color(0xFFFFFFFF);

  /// バリアントサーフェスカラー
  static const Color surfaceVariant = Color(0xFFF5F5F5);

  /// 暗いサーフェスカラー
  static const Color surfaceDim = Color(0xFFE0E0E0);

  /// 明るいサーフェスカラー
  static const Color surfaceBright = Color(0xFFFFFFFF);

  /// サーフェスカラーの上に表示するテキストの色
  static const Color onSurface = Color(0xFF1C1B1F);

  /// バリアントサーフェスカラーの上に表示するテキストの色
  static const Color onSurfaceVariant = Color(0xFF49454F);

  /// Background Colors
  /// 背景カラー。アプリケーションの背景に使用します。

  /// 背景カラー
  static const Color background = Color(0xFFFFFFFF);

  /// 背景カラーの上に表示するテキストの色
  static const Color onBackground = Color(0xFF1C1B1F);

  /// Error Colors
  /// エラーカラー。エラーや警告を表示する際に使用します。

  /// エラーカラー
  static const Color error = Color(0xFFB00020);

  /// 明るいエラーカラー
  static const Color errorLight = Color(0xFFEF5350);

  /// 暗いエラーカラー
  static const Color errorDark = Color(0xFFC62828);

  /// エラーカラーの上に表示するテキストの色
  static const Color onError = Color(0xFFFFFFFF);

  /// Outline Colors
  /// アウトラインカラー。境界線や区切り線に使用します。

  /// アウトラインカラー
  static const Color outline = Color(0xFF79747E);

  /// バリアントアウトラインカラー
  static const Color outlineVariant = Color(0xFFCAC4D0);

  /// Inverse Colors
  /// 反転カラー。ダークモードなどで使用します。

  /// 反転サーフェスカラー
  static const Color inverseSurface = Color(0xFF1C1B1F);

  /// 反転サーフェスカラーの上に表示するテキストの色
  static const Color onInverseSurface = Color(0xFFF4EFF4);

  /// 反転プライマリーカラー
  static const Color inversePrimary = Color(0xFFBB86FC);

  /// Shadow Colors
  /// シャドウカラー。影やスクリムに使用します。

  /// シャドウカラー
  static const Color shadow = Color(0xFF000000);

  /// スクリムカラー
  static const Color scrim = Color(0xFF000000);

  /// Container Colors (Material 3 のコンテナカラー)
  /// Material 3 のコンテナカラー。コンテナ内の背景色として使用します。

  /// プライマリーコンテナカラー
  static const Color primaryContainer = Color(0xFFEADDFF);

  /// プライマリーコンテナカラーの上に表示するテキストの色
  static const Color onPrimaryContainer = Color(0xFF21005D);

  /// セカンダリーコンテナカラー
  static const Color secondaryContainer = Color(0xFFC8FFF4);

  /// セカンダリーコンテナカラーの上に表示するテキストの色
  static const Color onSecondaryContainer = Color(0xFF001F1C);

  /// ターシャリーコンテナカラー
  static const Color tertiaryContainer = Color(0xFFFFD8E4);

  /// ターシャリーコンテナカラーの上に表示するテキストの色
  static const Color onTertiaryContainer = Color(0xFF31111D);

  /// エラーコンテナカラー
  static const Color errorContainer = Color(0xFFF9DEDC);

  /// エラーコンテナカラーの上に表示するテキストの色
  static const Color onErrorContainer = Color(0xFF410E0B);

  /// 最も高いサーフェスコンテナカラー
  static const Color surfaceContainerHighest = Color(0xFFE6E0E9);

  /// 高いサーフェスコンテナカラー
  static const Color surfaceContainerHigh = Color(0xFFECE6F0);

  /// サーフェスコンテナカラー
  static const Color surfaceContainer = Color(0xFFF3EDF7);

  /// 低いサーフェスコンテナカラー
  static const Color surfaceContainerLow = Color(0xFFF7F2FA);

  /// 最も低いサーフェスコンテナカラー
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
}

