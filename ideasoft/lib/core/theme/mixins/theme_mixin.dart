import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/theme_manager.dart';


mixin ThemeMixin<T extends StatefulWidget> on State<T> {
  ThemeManager get currentTheme => context.watch<ThemeManager>();
}