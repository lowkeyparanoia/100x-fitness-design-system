// 100x Fitness — Flutter mirror of tokens.css. Keep values in sync with tokens.css.
// Usage: MaterialApp(theme: AppTheme.light, darkTheme: AppTheme.dark)
//        final m = Theme.of(context).extension<MetricColors>()!;
import 'dart:ui' show FontFeature;
import 'package:flutter/material.dart';

class Brand {
  static const blue = Color(0xFF2A6FD6);
  static const skyTop = Color(0xFF2F6BD0);
  static const skyBottom = Color(0xFF8EC3F0);
}

/// Metric hues. Always pair with a label or icon — never colour alone.
@immutable
class MetricColors extends ThemeExtension<MetricColors> {
  const MetricColors({
    this.move = const Color(0xFF2FD15B),
    this.move2 = const Color(0xFF7BE03A),
    this.move3 = const Color(0xFF22C3E6),
    this.heart = const Color(0xFFE0243A),
    this.sleep = const Color(0xFF4B16D9),
    this.effort = const Color(0xFF8C96A8),
    this.breathe = const Color(0xFF14B8A6),
    this.statusOk = const Color(0xFF1F9D55),
    this.statusWatch = const Color(0xFFC77700),
    this.statusGap = const Color(0xFF8A8FA3),
  });
  final Color move, move2, move3, heart, sleep, effort, breathe, statusOk, statusWatch, statusGap;

  @override
  MetricColors copyWith() => this;
  @override
  MetricColors lerp(MetricColors? other, double t) => this; // ponytail: hues are mode-invariant
}

class Radii {
  static const tile = 28.0, card = 20.0, sheet = 28.0, chip = 999.0;
}

class Space {
  static const s1 = 4.0, s2 = 8.0, s3 = 12.0, s4 = 16.0, s6 = 24.0, s8 = 32.0;
  static const gutter = 16.0, tap = 48.0;
}

class Motion {
  static const zoom = Duration(milliseconds: 350); // tile → detail (OpenContainer)
  static const quick = Duration(milliseconds: 180);
  static const emphasized = Cubic(0.2, 0, 0, 1);
}

class AppTheme {
  static const _tabular = [FontFeature.tabularFigures()];

  static TextTheme _text(Color ink) => TextTheme(
        displayLarge: TextStyle(fontSize: 64, fontWeight: FontWeight.w300, height: 1, color: ink, fontFeatures: _tabular),
        headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, height: 1.15, color: ink),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, height: 1.25, color: ink),
        titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, height: 1.1, color: ink, fontFeatures: _tabular),
        bodyMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, height: 1.45, color: ink),
        labelMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, height: 1.3, color: ink),
        labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.6, color: ink),
      );

  static ThemeData _build({required Brightness b, required Color canvas, required Color card, required Color ink, required Color muted, required Color line}) {
    final scheme = ColorScheme.fromSeed(seedColor: Brand.blue, brightness: b).copyWith(
      surface: card, onSurface: ink, onSurfaceVariant: muted, outlineVariant: line, primary: Brand.blue);
    return ThemeData(
      useMaterial3: true,
      brightness: b,
      colorScheme: scheme,
      scaffoldBackgroundColor: canvas,
      fontFamily: 'Inter', // bundle Inter (OFL); iOS may fall back to SF Pro
      textTheme: _text(ink),
      cardTheme: CardThemeData(color: card, elevation: 0, margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Radii.card))),
      filledButtonTheme: FilledButtonThemeData(style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52), shape: const StadiumBorder(),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
      chipTheme: ChipThemeData(shape: const StadiumBorder(), side: BorderSide(color: line)),
      bottomSheetTheme: const BottomSheetThemeData(showDragHandle: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(Radii.sheet)))),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      extensions: const [MetricColors()],
    );
  }

  static final light = _build(b: Brightness.light, canvas: const Color(0xFFF6F5FB), card: Colors.white,
      ink: const Color(0xFF14152A), muted: const Color(0xFF6B6F86), line: const Color(0xFFE6E5EF));

  static final dark = _build(b: Brightness.dark, canvas: const Color(0xFF0B0C14), card: const Color(0xFF161826),
      ink: const Color(0xFFF2F3FA), muted: const Color(0xFF8E92AB), line: const Color(0xFF262A3E));

  /// Home canvas (Trackable-style sky gradient).
  static const sky = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
      colors: [Brand.skyTop, Brand.skyBottom]);
}
