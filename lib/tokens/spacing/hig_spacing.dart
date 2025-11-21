import 'package:flutter/material.dart';

/// HIG (Human Interface Guidelines) Liquid Glass の Spacing トークン
///
/// Apple の Human Interface Guidelines に基づいた余白定義です。
/// すべて4px単位（4刻み）で定義されています。
class HIGSpacing {
  HIGSpacing._();

  /// 4px - 最小の余白
  static const double s4 = 4.0;
  
  /// 8px - 小さい余白
  static const double s8 = 8.0;
  
  /// 12px - 小さめの余白
  static const double s12 = 12.0;
  
  /// 16px - 標準の余白
  static const double s16 = 16.0;
  
  /// 20px - やや大きめの余白
  static const double s20 = 20.0;
  
  /// 24px - 大きい余白
  static const double s24 = 24.0;
  
  /// 28px - やや大きい余白
  static const double s28 = 28.0;
  
  /// 32px - 非常に大きい余白
  static const double s32 = 32.0;
  
  /// 36px - 特大の余白
  static const double s36 = 36.0;
  
  /// 40px - 特大の余白
  static const double s40 = 40.0;
  
  /// 44px - 特大の余白
  static const double s44 = 44.0;
  
  /// 48px - 特大の余白
  static const double s48 = 48.0;
  
  /// 52px - 特大の余白
  static const double s52 = 52.0;
  
  /// 56px - 特大の余白
  static const double s56 = 56.0;
  
  /// 60px - 特大の余白
  static const double s60 = 60.0;
  
  /// 64px - 特大の余白
  static const double s64 = 64.0;

  // All sides (全方向)
  
  /// 全方向に4pxの余白
  static const EdgeInsets all4 = EdgeInsets.all(s4);
  
  /// 全方向に8pxの余白
  static const EdgeInsets all8 = EdgeInsets.all(s8);
  
  /// 全方向に12pxの余白
  static const EdgeInsets all12 = EdgeInsets.all(s12);
  
  /// 全方向に16pxの余白
  static const EdgeInsets all16 = EdgeInsets.all(s16);
  
  /// 全方向に20pxの余白
  static const EdgeInsets all20 = EdgeInsets.all(s20);
  
  /// 全方向に24pxの余白
  static const EdgeInsets all24 = EdgeInsets.all(s24);
  
  /// 全方向に28pxの余白
  static const EdgeInsets all28 = EdgeInsets.all(s28);
  
  /// 全方向に32pxの余白
  static const EdgeInsets all32 = EdgeInsets.all(s32);
  
  /// 全方向に36pxの余白
  static const EdgeInsets all36 = EdgeInsets.all(s36);
  
  /// 全方向に40pxの余白
  static const EdgeInsets all40 = EdgeInsets.all(s40);
  
  /// 全方向に44pxの余白
  static const EdgeInsets all44 = EdgeInsets.all(s44);
  
  /// 全方向に48pxの余白
  static const EdgeInsets all48 = EdgeInsets.all(s48);
  
  /// 全方向に52pxの余白
  static const EdgeInsets all52 = EdgeInsets.all(s52);
  
  /// 全方向に56pxの余白
  static const EdgeInsets all56 = EdgeInsets.all(s56);
  
  /// 全方向に60pxの余白
  static const EdgeInsets all60 = EdgeInsets.all(s60);
  
  /// 全方向に64pxの余白
  static const EdgeInsets all64 = EdgeInsets.all(s64);

  // Horizontal (水平方向)
  
  /// 水平方向に4pxの余白
  static const EdgeInsets horizontal4 = EdgeInsets.symmetric(horizontal: s4);
  
  /// 水平方向に8pxの余白
  static const EdgeInsets horizontal8 = EdgeInsets.symmetric(horizontal: s8);
  
  /// 水平方向に12pxの余白
  static const EdgeInsets horizontal12 = EdgeInsets.symmetric(horizontal: s12);
  
  /// 水平方向に16pxの余白
  static const EdgeInsets horizontal16 = EdgeInsets.symmetric(horizontal: s16);
  
  /// 水平方向に20pxの余白
  static const EdgeInsets horizontal20 = EdgeInsets.symmetric(horizontal: s20);
  
  /// 水平方向に24pxの余白
  static const EdgeInsets horizontal24 = EdgeInsets.symmetric(horizontal: s24);
  
  /// 水平方向に28pxの余白
  static const EdgeInsets horizontal28 = EdgeInsets.symmetric(horizontal: s28);
  
  /// 水平方向に32pxの余白
  static const EdgeInsets horizontal32 = EdgeInsets.symmetric(horizontal: s32);
  
  /// 水平方向に36pxの余白
  static const EdgeInsets horizontal36 = EdgeInsets.symmetric(horizontal: s36);
  
  /// 水平方向に40pxの余白
  static const EdgeInsets horizontal40 = EdgeInsets.symmetric(horizontal: s40);
  
  /// 水平方向に44pxの余白
  static const EdgeInsets horizontal44 = EdgeInsets.symmetric(horizontal: s44);
  
  /// 水平方向に48pxの余白
  static const EdgeInsets horizontal48 = EdgeInsets.symmetric(horizontal: s48);
  
  /// 水平方向に52pxの余白
  static const EdgeInsets horizontal52 = EdgeInsets.symmetric(horizontal: s52);
  
  /// 水平方向に56pxの余白
  static const EdgeInsets horizontal56 = EdgeInsets.symmetric(horizontal: s56);
  
  /// 水平方向に60pxの余白
  static const EdgeInsets horizontal60 = EdgeInsets.symmetric(horizontal: s60);
  
  /// 水平方向に64pxの余白
  static const EdgeInsets horizontal64 = EdgeInsets.symmetric(horizontal: s64);

  // Vertical (垂直方向)
  
  /// 垂直方向に4pxの余白
  static const EdgeInsets vertical4 = EdgeInsets.symmetric(vertical: s4);
  
  /// 垂直方向に8pxの余白
  static const EdgeInsets vertical8 = EdgeInsets.symmetric(vertical: s8);
  
  /// 垂直方向に12pxの余白
  static const EdgeInsets vertical12 = EdgeInsets.symmetric(vertical: s12);
  
  /// 垂直方向に16pxの余白
  static const EdgeInsets vertical16 = EdgeInsets.symmetric(vertical: s16);
  
  /// 垂直方向に20pxの余白
  static const EdgeInsets vertical20 = EdgeInsets.symmetric(vertical: s20);
  
  /// 垂直方向に24pxの余白
  static const EdgeInsets vertical24 = EdgeInsets.symmetric(vertical: s24);
  
  /// 垂直方向に28pxの余白
  static const EdgeInsets vertical28 = EdgeInsets.symmetric(vertical: s28);
  
  /// 垂直方向に32pxの余白
  static const EdgeInsets vertical32 = EdgeInsets.symmetric(vertical: s32);
  
  /// 垂直方向に36pxの余白
  static const EdgeInsets vertical36 = EdgeInsets.symmetric(vertical: s36);
  
  /// 垂直方向に40pxの余白
  static const EdgeInsets vertical40 = EdgeInsets.symmetric(vertical: s40);
  
  /// 垂直方向に44pxの余白
  static const EdgeInsets vertical44 = EdgeInsets.symmetric(vertical: s44);
  
  /// 垂直方向に48pxの余白
  static const EdgeInsets vertical48 = EdgeInsets.symmetric(vertical: s48);
  
  /// 垂直方向に52pxの余白
  static const EdgeInsets vertical52 = EdgeInsets.symmetric(vertical: s52);
  
  /// 垂直方向に56pxの余白
  static const EdgeInsets vertical56 = EdgeInsets.symmetric(vertical: s56);
  
  /// 垂直方向に60pxの余白
  static const EdgeInsets vertical60 = EdgeInsets.symmetric(vertical: s60);
  
  /// 垂直方向に64pxの余白
  static const EdgeInsets vertical64 = EdgeInsets.symmetric(vertical: s64);

  // Top (上)
  
  /// 上に4pxの余白
  static const EdgeInsets top4 = EdgeInsets.only(top: s4);
  
  /// 上に8pxの余白
  static const EdgeInsets top8 = EdgeInsets.only(top: s8);
  
  /// 上に12pxの余白
  static const EdgeInsets top12 = EdgeInsets.only(top: s12);
  
  /// 上に16pxの余白
  static const EdgeInsets top16 = EdgeInsets.only(top: s16);
  
  /// 上に20pxの余白
  static const EdgeInsets top20 = EdgeInsets.only(top: s20);
  
  /// 上に24pxの余白
  static const EdgeInsets top24 = EdgeInsets.only(top: s24);
  
  /// 上に28pxの余白
  static const EdgeInsets top28 = EdgeInsets.only(top: s28);
  
  /// 上に32pxの余白
  static const EdgeInsets top32 = EdgeInsets.only(top: s32);
  
  /// 上に36pxの余白
  static const EdgeInsets top36 = EdgeInsets.only(top: s36);
  
  /// 上に40pxの余白
  static const EdgeInsets top40 = EdgeInsets.only(top: s40);
  
  /// 上に44pxの余白
  static const EdgeInsets top44 = EdgeInsets.only(top: s44);
  
  /// 上に48pxの余白
  static const EdgeInsets top48 = EdgeInsets.only(top: s48);
  
  /// 上に52pxの余白
  static const EdgeInsets top52 = EdgeInsets.only(top: s52);
  
  /// 上に56pxの余白
  static const EdgeInsets top56 = EdgeInsets.only(top: s56);
  
  /// 上に60pxの余白
  static const EdgeInsets top60 = EdgeInsets.only(top: s60);
  
  /// 上に64pxの余白
  static const EdgeInsets top64 = EdgeInsets.only(top: s64);

  // Bottom (下)
  
  /// 下に4pxの余白
  static const EdgeInsets bottom4 = EdgeInsets.only(bottom: s4);
  
  /// 下に8pxの余白
  static const EdgeInsets bottom8 = EdgeInsets.only(bottom: s8);
  
  /// 下に12pxの余白
  static const EdgeInsets bottom12 = EdgeInsets.only(bottom: s12);
  
  /// 下に16pxの余白
  static const EdgeInsets bottom16 = EdgeInsets.only(bottom: s16);
  
  /// 下に20pxの余白
  static const EdgeInsets bottom20 = EdgeInsets.only(bottom: s20);
  
  /// 下に24pxの余白
  static const EdgeInsets bottom24 = EdgeInsets.only(bottom: s24);
  
  /// 下に28pxの余白
  static const EdgeInsets bottom28 = EdgeInsets.only(bottom: s28);
  
  /// 下に32pxの余白
  static const EdgeInsets bottom32 = EdgeInsets.only(bottom: s32);
  
  /// 下に36pxの余白
  static const EdgeInsets bottom36 = EdgeInsets.only(bottom: s36);
  
  /// 下に40pxの余白
  static const EdgeInsets bottom40 = EdgeInsets.only(bottom: s40);
  
  /// 下に44pxの余白
  static const EdgeInsets bottom44 = EdgeInsets.only(bottom: s44);
  
  /// 下に48pxの余白
  static const EdgeInsets bottom48 = EdgeInsets.only(bottom: s48);
  
  /// 下に52pxの余白
  static const EdgeInsets bottom52 = EdgeInsets.only(bottom: s52);
  
  /// 下に56pxの余白
  static const EdgeInsets bottom56 = EdgeInsets.only(bottom: s56);
  
  /// 下に60pxの余白
  static const EdgeInsets bottom60 = EdgeInsets.only(bottom: s60);
  
  /// 下に64pxの余白
  static const EdgeInsets bottom64 = EdgeInsets.only(bottom: s64);

  // Left (左)
  
  /// 左に4pxの余白
  static const EdgeInsets left4 = EdgeInsets.only(left: s4);
  
  /// 左に8pxの余白
  static const EdgeInsets left8 = EdgeInsets.only(left: s8);
  
  /// 左に12pxの余白
  static const EdgeInsets left12 = EdgeInsets.only(left: s12);
  
  /// 左に16pxの余白
  static const EdgeInsets left16 = EdgeInsets.only(left: s16);
  
  /// 左に20pxの余白
  static const EdgeInsets left20 = EdgeInsets.only(left: s20);
  
  /// 左に24pxの余白
  static const EdgeInsets left24 = EdgeInsets.only(left: s24);
  
  /// 左に28pxの余白
  static const EdgeInsets left28 = EdgeInsets.only(left: s28);
  
  /// 左に32pxの余白
  static const EdgeInsets left32 = EdgeInsets.only(left: s32);
  
  /// 左に36pxの余白
  static const EdgeInsets left36 = EdgeInsets.only(left: s36);
  
  /// 左に40pxの余白
  static const EdgeInsets left40 = EdgeInsets.only(left: s40);
  
  /// 左に44pxの余白
  static const EdgeInsets left44 = EdgeInsets.only(left: s44);
  
  /// 左に48pxの余白
  static const EdgeInsets left48 = EdgeInsets.only(left: s48);
  
  /// 左に52pxの余白
  static const EdgeInsets left52 = EdgeInsets.only(left: s52);
  
  /// 左に56pxの余白
  static const EdgeInsets left56 = EdgeInsets.only(left: s56);
  
  /// 左に60pxの余白
  static const EdgeInsets left60 = EdgeInsets.only(left: s60);
  
  /// 左に64pxの余白
  static const EdgeInsets left64 = EdgeInsets.only(left: s64);

  // Right (右)
  
  /// 右に4pxの余白
  static const EdgeInsets right4 = EdgeInsets.only(right: s4);
  
  /// 右に8pxの余白
  static const EdgeInsets right8 = EdgeInsets.only(right: s8);
  
  /// 右に12pxの余白
  static const EdgeInsets right12 = EdgeInsets.only(right: s12);
  
  /// 右に16pxの余白
  static const EdgeInsets right16 = EdgeInsets.only(right: s16);
  
  /// 右に20pxの余白
  static const EdgeInsets right20 = EdgeInsets.only(right: s20);
  
  /// 右に24pxの余白
  static const EdgeInsets right24 = EdgeInsets.only(right: s24);
  
  /// 右に28pxの余白
  static const EdgeInsets right28 = EdgeInsets.only(right: s28);
  
  /// 右に32pxの余白
  static const EdgeInsets right32 = EdgeInsets.only(right: s32);
  
  /// 右に36pxの余白
  static const EdgeInsets right36 = EdgeInsets.only(right: s36);
  
  /// 右に40pxの余白
  static const EdgeInsets right40 = EdgeInsets.only(right: s40);
  
  /// 右に44pxの余白
  static const EdgeInsets right44 = EdgeInsets.only(right: s44);
  
  /// 右に48pxの余白
  static const EdgeInsets right48 = EdgeInsets.only(right: s48);
  
  /// 右に52pxの余白
  static const EdgeInsets right52 = EdgeInsets.only(right: s52);
  
  /// 右に56pxの余白
  static const EdgeInsets right56 = EdgeInsets.only(right: s56);
  
  /// 右に60pxの余白
  static const EdgeInsets right60 = EdgeInsets.only(right: s60);
  
  /// 右に64pxの余白
  static const EdgeInsets right64 = EdgeInsets.only(right: s64);

  // Common aliases (よく使われる値のエイリアス)
  
  /// 小さい余白（8px）
  static const EdgeInsets small = all8;
  
  /// 標準の余白（16px）
  static const EdgeInsets medium = all16;
  
  /// 大きい余白（24px）
  static const EdgeInsets large = all24;
  
  /// 非常に大きい余白（32px）
  static const EdgeInsets xlarge = all32;
}

