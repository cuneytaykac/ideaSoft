import 'package:flutter/material.dart';

extension ScreenSizeExtension on BuildContext {
  double get height {
    return MediaQuery.of(this).size.height;
  }

  double screenWidht([double? width]) =>
      MediaQuery.of(this).size.width * (width ?? 1);
  double screenHeight([double? height]) =>
      MediaQuery.of(this).size.height * (height ?? 1);
}
