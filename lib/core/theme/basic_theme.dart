import "package:flutter/material.dart";

class BasicTheme {
  final TextTheme textTheme;

  const BasicTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2f628c),
      surfaceTint: Color(0xff2f628c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffcee5ff),
      onPrimaryContainer: Color(0xff0f4a73),
      secondary: Color(0xff00696a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff9cf1f1),
      onSecondaryContainer: Color(0xff004f50),
      tertiary: Color(0xff056b5b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa0f2de),
      onTertiaryContainer: Color(0xff005144),
      error: Color(0xff904a43),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff73342d),
      surface: Color(0xfff7f9ff),
      onSurface: Color(0xff181c20),
      onSurfaceVariant: Color(0xff42474e),
      outline: Color(0xff72777f),
      outlineVariant: Color(0xffc2c7cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inversePrimary: Color(0xff9bcbfb),
      primaryFixed: Color(0xffcee5ff),
      onPrimaryFixed: Color(0xff001d33),
      primaryFixedDim: Color(0xff9bcbfb),
      onPrimaryFixedVariant: Color(0xff0f4a73),
      secondaryFixed: Color(0xff9cf1f1),
      onSecondaryFixed: Color(0xff002020),
      secondaryFixedDim: Color(0xff80d4d5),
      onSecondaryFixedVariant: Color(0xff004f50),
      tertiaryFixed: Color(0xffa0f2de),
      onTertiaryFixed: Color(0xff00201a),
      tertiaryFixedDim: Color(0xff84d6c3),
      onTertiaryFixedVariant: Color(0xff005144),
      surfaceDim: Color(0xffd8dae0),
      surfaceBright: Color(0xfff7f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3f9),
      surfaceContainer: Color(0xffeceef4),
      surfaceContainerHigh: Color(0xffe6e8ee),
      surfaceContainerHighest: Color(0xffe0e2e8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00395c),
      surfaceTint: Color(0xff2f628c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff40719c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003d3e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff16797a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003e34),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff227a6a),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff5e231e),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffa25850),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7f9ff),
      onSurface: Color(0xff0e1115),
      onSurfaceVariant: Color(0xff31373d),
      outline: Color(0xff4e535a),
      outlineVariant: Color(0xff686d75),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inversePrimary: Color(0xff9bcbfb),
      primaryFixed: Color(0xff40719c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff245882),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff16797a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff005f60),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff227a6a),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff006052),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc4c6cc),
      surfaceBright: Color(0xfff7f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3f9),
      surfaceContainer: Color(0xffe6e8ee),
      surfaceContainerHigh: Color(0xffdbdde2),
      surfaceContainerHighest: Color(0xffcfd1d7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002e4d),
      surfaceTint: Color(0xff2f628c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff134c75),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003233),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff005253),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00332b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff005347),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff511a15),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff76362f),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7f9ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff272d33),
      outlineVariant: Color(0xff444a50),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inversePrimary: Color(0xff9bcbfb),
      primaryFixed: Color(0xff134c75),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003557),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff005253),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff00393a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff005347),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003a31),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb6b9be),
      surfaceBright: Color(0xfff7f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff1f6),
      surfaceContainer: Color(0xffe0e2e8),
      surfaceContainerHigh: Color(0xffd2d4da),
      surfaceContainerHighest: Color(0xffc4c6cc),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff9bcbfb),
      surfaceTint: Color(0xff9bcbfb),
      onPrimary: Color(0xff003353),
      primaryContainer: Color(0xff0f4a73),
      onPrimaryContainer: Color(0xffcee5ff),
      secondary: Color(0xff80d4d5),
      onSecondary: Color(0xff003737),
      secondaryContainer: Color(0xff004f50),
      onSecondaryContainer: Color(0xff9cf1f1),
      tertiary: Color(0xff84d6c3),
      onTertiary: Color(0xff00382f),
      tertiaryContainer: Color(0xff005144),
      onTertiaryContainer: Color(0xffa0f2de),
      error: Color(0xffffb4ab),
      onError: Color(0xff561e19),
      errorContainer: Color(0xff73342d),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff101418),
      onSurface: Color(0xffe0e2e8),
      onSurfaceVariant: Color(0xffc2c7cf),
      outline: Color(0xff8c9199),
      outlineVariant: Color(0xff42474e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2e8),
      inversePrimary: Color(0xff2f628c),
      primaryFixed: Color(0xffcee5ff),
      onPrimaryFixed: Color(0xff001d33),
      primaryFixedDim: Color(0xff9bcbfb),
      onPrimaryFixedVariant: Color(0xff0f4a73),
      secondaryFixed: Color(0xff9cf1f1),
      onSecondaryFixed: Color(0xff002020),
      secondaryFixedDim: Color(0xff80d4d5),
      onSecondaryFixedVariant: Color(0xff004f50),
      tertiaryFixed: Color(0xffa0f2de),
      onTertiaryFixed: Color(0xff00201a),
      tertiaryFixedDim: Color(0xff84d6c3),
      onTertiaryFixedVariant: Color(0xff005144),
      surfaceDim: Color(0xff101418),
      surfaceBright: Color(0xff36393e),
      surfaceContainerLowest: Color(0xff0b0e12),
      surfaceContainerLow: Color(0xff181c20),
      surfaceContainer: Color(0xff1d2024),
      surfaceContainerHigh: Color(0xff272a2f),
      surfaceContainerHighest: Color(0xff32353a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc3dfff),
      surfaceTint: Color(0xff9bcbfb),
      onPrimary: Color(0xff002842),
      primaryContainer: Color(0xff6595c2),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff96ebeb),
      onSecondary: Color(0xff002b2b),
      secondaryContainer: Color(0xff479e9e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff9aecd8),
      onTertiary: Color(0xff002c24),
      tertiaryContainer: Color(0xff4d9f8d),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff48130f),
      errorContainer: Color(0xffcc7b72),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff101418),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd8dde5),
      outline: Color(0xffadb2ba),
      outlineVariant: Color(0xff8c9198),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2e8),
      inversePrimary: Color(0xff114b74),
      primaryFixed: Color(0xffcee5ff),
      onPrimaryFixed: Color(0xff001222),
      primaryFixedDim: Color(0xff9bcbfb),
      onPrimaryFixedVariant: Color(0xff00395c),
      secondaryFixed: Color(0xff9cf1f1),
      onSecondaryFixed: Color(0xff001415),
      secondaryFixedDim: Color(0xff80d4d5),
      onSecondaryFixedVariant: Color(0xff003d3e),
      tertiaryFixed: Color(0xffa0f2de),
      onTertiaryFixed: Color(0xff001510),
      tertiaryFixedDim: Color(0xff84d6c3),
      onTertiaryFixedVariant: Color(0xff003e34),
      surfaceDim: Color(0xff101418),
      surfaceBright: Color(0xff414549),
      surfaceContainerLowest: Color(0xff05080b),
      surfaceContainerLow: Color(0xff1a1e22),
      surfaceContainer: Color(0xff25282c),
      surfaceContainerHigh: Color(0xff303337),
      surfaceContainerHighest: Color(0xff3b3e43),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe7f1ff),
      surfaceTint: Color(0xff9bcbfb),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff97c7f7),
      onPrimaryContainer: Color(0xff000c19),
      secondary: Color(0xffaaffff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff7cd0d1),
      onSecondaryContainer: Color(0xff000e0e),
      tertiary: Color(0xffb2ffec),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff80d2bf),
      onTertiaryContainer: Color(0xff000e0a),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff101418),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffecf0f8),
      outlineVariant: Color(0xffbec3cb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2e8),
      inversePrimary: Color(0xff114b74),
      primaryFixed: Color(0xffcee5ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff9bcbfb),
      onPrimaryFixedVariant: Color(0xff001222),
      secondaryFixed: Color(0xff9cf1f1),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff80d4d5),
      onSecondaryFixedVariant: Color(0xff001415),
      tertiaryFixed: Color(0xffa0f2de),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff84d6c3),
      onTertiaryFixedVariant: Color(0xff001510),
      surfaceDim: Color(0xff101418),
      surfaceBright: Color(0xff4d5055),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1d2024),
      surfaceContainer: Color(0xff2d3135),
      surfaceContainerHigh: Color(0xff383c40),
      surfaceContainerHighest: Color(0xff44474c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
