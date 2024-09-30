import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/core/theme_manager.dart';
import '../theme/mixins/theme_mixin.dart';
import 'base_viewmodel.dart';

abstract class BaseViewProtocol<T extends BaseViewModelProtocol>
    extends StatefulWidget {
  final T viewModel;

  Widget startView(BuildContext context, ThemeManager theme);
  void init();
  void dispose();

  const BaseViewProtocol(this.viewModel, {Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseViewProtocol> with ThemeMixin {
  @override
  void initState() {
    debugPrint("Show -- $widget");
    widget.init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("Close -- $widget");
    if (mounted) {
      widget.dispose();
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    var theme = context.watch<ThemeManager>();
    return widget.startView(context, theme);
  }
}
