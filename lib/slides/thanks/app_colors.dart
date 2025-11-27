import 'package:flutter/material.dart';

/// アプリ全体で使用するカラーパレット
class AppColors {
  /// プライマリカラー（Flutterのイメージカラー）
  static const Color primaryBlue = Color(0xFF1E3A8A);

  /// プライマリカラー（Flutterのイメージカラー）
  static const Color primaryBlueLight = Color(0xFF3B82F6);

  /// プライマリカラー（Flutterのイメージカラー）
  static const Color primaryCyan = Color(0xFF06B6D4);

  /// セカンダリカラー
  static const Color secondaryGreen = Color(0xFF10B981);

  /// セカンダリカラー
  static const Color secondaryGray = Color(0xFF6B7280);

  /// 背景カラー
  static const Color backgroundLight = Color(0xFFB5FFFC);

  /// 背景カラー
  static const Color backgroundDark = Color(0xFF16222A);

  /// 背景カラー
  static const Color backgroundPrimary = Color(0xFF1E3A8A);

  /// テキストカラー
  static const Color textPrimary = Color(0xFF1E40AF);

  /// テキストカラー
  static const Color textSecondary = Color(0xFF6B7280);

  /// テキストカラー
  static const Color textWhite = Colors.white;

  /// グラデーション
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryBlue, primaryBlueLight, primaryCyan],
  );

  /// テキストグラデーション
  static const LinearGradient textGradient = LinearGradient(
    colors: [Colors.white, Color(0xFFE0F2FE)],
  );

  /// アシストグラデーション
  static const LinearGradient accentGradient = LinearGradient(
    colors: [primaryBlueLight, primaryCyan],
  );

  /// カード・コンテナカラー
  static const Color cardBackground = Color(0xFFFFFFFF);

  /// カード・コンテナカラー
  static const Color cardBackgroundTransparent = Color(0x0FFFFFFF);

  /// ガラス背景カラー
  static const Color glassBackground = Color(0x33FFFFFF);

  /// ガラス境界カラー
  static const Color glassBorder = Color(0x33FFFFFF);

  /// メインカラー（水色）
  static const Color mainColor = Color(0xFF57A9F3);

  /// メインカラーの（薄い青）
  static const Color mainLightColor = Color(0xFF9ECCE7);

  /// 白色
  static const Color white = Colors.white;

  /// 画面のバックグラウンドカラー
  static const Color appBGColor = Color(0xFFEFEFF4);

  /// フォームのヒントテキストカラー
  static const Color hintTextColor = Color(0xFFCCCCCC);

  /// 黒色
  static const Color black = Colors.black;

  /// 透過度12%の黒色
  static const Color dialogBarrierColor = Colors.black12;

  /// grey60色
  static const Color grey60 = Color(0xFF999999);

  /// grey70色
  static const Color grey70 = Color(0xFFCCCCCC);

  /// grey87色
  static const Color grey87 = Color(0xFFDEDEDE);

  /// grey93色
  static const Color grey93 = Color(0xFFEEEEEE);

  /// grey95色
  static const Color grey95 = Color(0xFFF2F2F2);

  /// grey98色
  static const Color grey98 = Color(0xFFF9F9F9);

  /// pink色
  static const Color pink = Color(0xFFFD4079);

  /// ライトブルー色（ローディングインジケータの背景色に使用されてます）
  static const Color lightBlueGrey = Color(0xFFF1F6F9);

  /// 薄ピンク色
  static const Color accentColor = Color(0xFFFD7894);

  /// 薄ピンク色のライトカラー
  static const Color accentLightColor = Color(0xFFF0A5B4);

  /// 黒33色
  static const Color black33 = Color(0xFF333333);

  /// 黒66色
  static const Color black66 = Color(0xFF666666);

  /// 黒80色
  static const Color black80 = Color(0x80000000);

  /// 黒50色
  static const Color black50 = Color(0x50000000);

  /// Cupertinoデザインのバックグラウンドカラー
  static const Color cupertinoBgColor = Color(0xFFCBCED5);

  /// Cupertinoデザインのエレメントのカラー
  static const Color cupertinoElementColor = Color(0xFF006CF6);

  /// 濃い赤色
  static const Color txtAccent = Color(0xFFCC0000);

  /// プレミアムカラー
  static const Color premiumColor = Color(0xFFE1A602);

  /// 臙脂色
  static const Color redAccent = Colors.redAccent;

  /// 連絡BOX検索ワード背景色
  static const Color searchWordBackgroundColor = Color(0xFF81807E);

  /// 黒色の透明色
  static const Color blackTransparent = Color(0x00FFFFFF);

  /// ベージュグレー色
  static const Color beigeGrey = Color(0xFFC3BFBC);

  /// 紫色のライトカラー
  static const Color lightPurple = Color(0xFF9284AC);

  /// オフホワイト色
  static const Color offWhite = Color(0xFFFCFCF7);

  /// グレージュ（グレー＋ベージュ）色
  static const Color warmGrey = Color(0xFF9f9d8e);

  /// オリーブイエロー
  static const Color surfaceTintColor = Color(0xffE4DA96);

  /// 黒38色
  static const Color black38 = Color(0x61000000);

  /// グレーB3色
  static const Color grayB3 = Color(0xFFB3B3B3);

  /// ハイパーリンクの青色
  static const Color hyperlinkBlue = Color(0xFF0000FD);

  /// グレー4A色
  static const Color gray4A = Color(0xFF4A4A4A);

  /// 黄色
  static const Color yellow = Colors.yellow;

  /// スライダーで利用するグラデーションの開始色
  static const Color sliderGradientStart = Color(0xFFFBDA61);

  /// スライダーで利用するグラデーションの終了色
  static const Color sliderGradientEnd = Color(0xFFF08080);

  /// 結婚観のテキストカラー
  static const Color marrigeColor = Color(0xFFFF9AC1);

  /// 黒26色
  static const Color black26 = Colors.black26;

  /// 申受け一覧のカウントを表示する文字色
  static const Color preomiCountGray = Color(0xff81807F);

  /// 活動管理画面の薄い青色
  static const Color activityLightBlue = Color(0xff6EBFFF);

  /// 黒12色
  static const Color black12 = Colors.black12;

  /// 淡い黄色
  static const Color lightYellow = Color(0xffFEF8D6);

  /// 淡い緑色
  static const Color lightGreen = Color(0xffC8EFEA);

  /// 申込みボタンのピンク色
  static const Color applyButtonPink = Color(0xffFF6D8A);

  /// 通報ボタンのグレー色
  static const Color reportButtonGray = Color(0xFFC6C6C8);

  /// 薄い青色
  static const Color lightSkyBlue = Color(0xFFE6F3FF);

  /// 青色
  static const Color skyBlue = Color(0xFF3A9CF5);

  /// 薄いピンク色
  static const Color lightPink = Color(0xffFD89A2);

  /// 少し暗い赤
  static const Color lightDarkRed = Color(0xffD01500);

  /// 少し暗い青色
  static const Color darkBlue = Color(0xff2F669B);

  /// 少し明るい灰色
  static const Color lightGray = Color(0xffDDDDDD);

  /// 少し明るいオレンジ色
  static const Color lightOrange = Color(0xffFF9600);

  /// 白に近い黄色
  static const Color whiteYellow = Color(0xffFFFFDC);

  /// 薄いグレー色
  static const Color lightGray240 = Color(0xFFF0F2F4);
}
