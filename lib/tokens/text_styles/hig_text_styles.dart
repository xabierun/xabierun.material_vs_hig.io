import 'package:flutter/material.dart';
import 'package:material_vs_hig/tokens/colors/hig_colors.dart';

/// HIG (Human Interface Guidelines) Liquid Glass の TextStyle トークン
///
/// スライド用のテキストスタイル定義です。
class HIGTextStyles {
  HIGTextStyles._();

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
      title.copyWith(color: HIGColors.primary);

  /// タイトル with label color
  static TextStyle get titleLabel =>
      title.copyWith(color: HIGColors.label);

  /// 見出し with primary color
  static TextStyle get headingPrimary =>
      heading.copyWith(color: HIGColors.primary);

  /// 見出し with label color
  static TextStyle get headingLabel =>
      heading.copyWith(color: HIGColors.label);

  /// 本文 with label color
  static TextStyle get bodyLabel =>
      body.copyWith(color: HIGColors.label);

  /// 本文 with secondary label color
  static TextStyle get bodyLabelSecondary =>
      body.copyWith(color: HIGColors.labelSecondary);

  /// キャプション with label color
  static TextStyle get captionLabel =>
      caption.copyWith(color: HIGColors.label);

  /// キャプション with secondary label color
  static TextStyle get captionLabelSecondary =>
      caption.copyWith(color: HIGColors.labelSecondary);
}
