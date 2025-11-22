import 'package:flutter/material.dart';
import 'package:material_vs_hig/tokens/colors/material_colors.dart';

/// Material Design 3 Expressive の TextStyle トークン
///
/// スライド用のテキストスタイル定義です。
class MaterialTextStyles {
  MaterialTextStyles._();

  /// タイトル - スライドのメインタイトル用
  static const TextStyle title = TextStyle(
    fontSize: 48.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.0,
  );

  /// 見出し - セクション見出し用
  static const TextStyle heading = TextStyle(
    fontSize: 36.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.0,
  );

  /// サブ見出し - サブセクション見出し用
  static const TextStyle subheading = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.0,
  );

  /// 本文 - 通常のテキスト用
  static const TextStyle body = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.0,
  );

  /// キャプション - 補足説明用
  static const TextStyle caption = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.0,
  );

  // With Colors (カラー付きバリエーション)

  /// タイトル with primary color
  static TextStyle get titlePrimary =>
      title.copyWith(color: MaterialColors.primary);

  /// タイトル with on surface color
  static TextStyle get titleOnSurface =>
      title.copyWith(color: MaterialColors.onSurface);

  /// 見出し with primary color
  static TextStyle get headingPrimary =>
      heading.copyWith(color: MaterialColors.primary);

  /// 見出し with on surface color
  static TextStyle get headingOnSurface =>
      heading.copyWith(color: MaterialColors.onSurface);

  /// 本文 with on surface color
  static TextStyle get bodyOnSurface =>
      body.copyWith(color: MaterialColors.onSurface);

  /// 本文 with on surface variant color
  static TextStyle get bodyOnSurfaceVariant =>
      body.copyWith(color: MaterialColors.onSurfaceVariant);
}
