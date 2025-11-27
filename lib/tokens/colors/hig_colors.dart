import 'package:flutter/material.dart';

/// HIG (Human Interface Guidelines) Liquid Glass のカラートークン
///
/// Apple の Human Interface Guidelines に基づいた色定義です。
/// Liquid Glass スタイルの透明感のあるガラス風の色も含まれています。
/// blue をベースカラーとして使用しています。
class HIGColors {
  HIGColors._();

  /// Primary Colors (blue ベース - iOS システムブルー)
  /// プライマリーカラー。アプリケーションの主要な色として使用します。

  /// iOS System Blue - プライマリーカラー
  static const Color primary = Color(0xFF007AFF);

  /// iOS System Blue Light - 明るいプライマリーカラー
  static const Color primaryLight = Color(0xFF5AC8FA);

  /// iOS System Blue Dark - 暗いプライマリーカラー
  static const Color primaryDark = Color(0xFF0051D5);

  /// プライマリーカラーの上に表示するテキストの色
  static const Color onPrimary = Color(0xFFFFFFFF);

  /// Secondary Colors
  /// セカンダリーカラー。プライマリーカラーを補完する色として使用します。

  /// iOS System Green - セカンダリーカラー
  static const Color secondary = Color(0xFF34C759);

  /// 明るいセカンダリーカラー
  static const Color secondaryLight = Color(0xFF66D99A);

  /// 暗いセカンダリーカラー
  static const Color secondaryDark = Color(0xFF248A3D);

  /// セカンダリーカラーの上に表示するテキストの色
  static const Color onSecondary = Color(0xFFFFFFFF);

  /// Accent Colors
  /// アクセントカラー。強調表示に使用します。

  /// iOS System Orange - アクセントカラー
  static const Color accent = Color(0xFFFF9500);

  /// 明るいアクセントカラー
  static const Color accentLight = Color(0xFFFFB340);

  /// 暗いアクセントカラー
  static const Color accentDark = Color(0xFFCC7700);

  /// アクセントカラーの上に表示するテキストの色
  static const Color onAccent = Color(0xFFFFFFFF);

  /// Background Colors (Liquid Glass スタイル)
  /// 背景カラー。Liquid Glass スタイルの透明感のある背景に使用します。

  /// iOS System Background - 背景カラー
  static const Color background = Color(0xFFF2F2F7);

  /// iOS Secondary Background - セカンダリ背景カラー
  static const Color backgroundSecondary = Color(0xFFFFFFFF);

  /// iOS Tertiary Background - ターシャリ背景カラー
  static const Color backgroundTertiary = Color(0xFFE5E5EA);

  /// 背景カラーの上に表示するテキストの色
  static const Color onBackground = Color(0xFF000000);

  /// セカンダリ背景カラーの上に表示するテキストの色
  static const Color onBackgroundSecondary = Color(0xFF3C3C43);

  /// Surface Colors (ガラス風の透明感)
  /// サーフェスカラー。Liquid Glass スタイルの透明感のあるサーフェスに使用します。

  /// サーフェスカラー
  static const Color surface = Color(0xFFFFFFFF);

  /// 半透明のガラス効果を持つサーフェスカラー
  static const Color surfaceBlur = Color(0x80FFFFFF);

  /// より透明なガラス効果を持つサーフェスカラー
  static const Color surfaceGlass = Color(0x40FFFFFF);

  /// サーフェスカラーの上に表示するテキストの色
  static const Color onSurface = Color(0xFF000000);

  /// サーフェスカラーの上に表示するセカンダリテキストの色
  static const Color onSurfaceSecondary = Color(0xFF3C3C43);

  /// サーフェスカラーの上に表示するターシャリテキストの色
  static const Color onSurfaceTertiary = Color(0xFF8E8E93);

  /// Grouped Background Colors (iOS スタイル)
  /// グループ化された背景カラー。iOS スタイルのグループ化されたビューに使用します。

  /// グループ化された背景カラー
  static const Color groupedBackground = Color(0xFFF2F2F7);

  /// グループ化されたセカンダリ背景カラー
  static const Color groupedBackgroundSecondary = Color(0xFFFFFFFF);

  /// グループ化されたターシャリ背景カラー
  static const Color groupedBackgroundTertiary = Color(0xFFF2F2F7);

  /// 薄い青色とグレーが混ざった背景カラー
  static const Color backgroundBlueGrey = Color(0xFFE8EBF0);

  /// Error Colors
  /// エラーカラー。エラーや警告を表示する際に使用します。

  /// iOS System Red - エラーカラー
  static const Color error = Color(0xFFFF3B30);

  /// 明るいエラーカラー
  static const Color errorLight = Color(0xFFFF6961);

  /// 暗いエラーカラー
  static const Color errorDark = Color(0xFFD70015);

  /// エラーカラーの上に表示するテキストの色
  static const Color onError = Color(0xFFFFFFFF);

  /// Warning Colors
  /// 警告カラー。警告を表示する際に使用します。

  /// iOS System Orange - 警告カラー
  static const Color warning = Color(0xFFFF9500);

  /// 明るい警告カラー
  static const Color warningLight = Color(0xFFFFB340);

  /// 暗い警告カラー
  static const Color warningDark = Color(0xFFCC7700);

  /// 警告カラーの上に表示するテキストの色
  static const Color onWarning = Color(0xFFFFFFFF);

  /// Success Colors
  /// 成功カラー。成功状態を表示する際に使用します。

  /// iOS System Green - 成功カラー
  static const Color success = Color(0xFF34C759);

  /// 明るい成功カラー
  static const Color successLight = Color(0xFF66D99A);

  /// 暗い成功カラー
  static const Color successDark = Color(0xFF248A3D);

  /// 成功カラーの上に表示するテキストの色
  static const Color onSuccess = Color(0xFFFFFFFF);

  /// Separator Colors
  /// セパレーターカラー。区切り線に使用します。

  /// セパレーターカラー
  static const Color separator = Color(0xFFC6C6C8);

  /// 不透明なセパレーターカラー
  static const Color separatorOpaque = Color(0xFF38383A);

  /// Label Colors (テキスト用)
  /// ラベルカラー。テキスト表示に使用します。

  /// ラベルカラー
  static const Color label = Color(0xFF000000);

  /// セカンダリラベルカラー
  static const Color labelSecondary = Color(0xFF3C3C43);

  /// ターシャリラベルカラー
  static const Color labelTertiary = Color(0xFF8E8E93);

  /// クォータナリラベルカラー
  static const Color labelQuaternary = Color(0xFFC7C7CC);

  /// Fill Colors
  /// フィルカラー。塗りつぶしに使用します。

  /// フィルカラー
  static const Color fill = Color(0xFF787880);

  /// セカンダリフィルカラー
  static const Color fillSecondary = Color(0xFF787880);

  /// ターシャリフィルカラー
  static const Color fillTertiary = Color(0xFF767680);

  /// クォータナリフィルカラー
  static const Color fillQuaternary = Color(0xFF747480);

  /// Tint Colors (Liquid Glass 用のティント)
  /// ティントカラー。Liquid Glass スタイルのティント効果に使用します。

  /// 半透明のプライマリーカラーのティント
  static const Color tint = Color(0x40007AFF);

  /// 半透明のセカンダリーカラーのティント
  static const Color tintSecondary = Color(0x2034C759);
}
