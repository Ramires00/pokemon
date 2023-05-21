import 'package:flutter/material.dart';
import 'package:pokemon/view/widget/appbar/divider_appbar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.title = const SizedBox(),
    this.color = Colors.blue,
    this.dividerColor = Colors.white,
    super.key,
  });

  final Widget? title;
  final Color? color;
  final Color? dividerColor;

  static const double toolbarHeight = kToolbarHeight;

  @override
  Widget build(BuildContext context) => SafeArea(
    child: PreferredSize(
          preferredSize: const Size(double.infinity, CustomAppBar.toolbarHeight),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: toolbarHeight,
                width: double.infinity,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                color: color,
                child: Center(
                  child: title,
                ),
              ),
              DividerAppbar(
                color: dividerColor,
              )
            ],
          ),
        ),
  );

  @override
  Size get preferredSize =>
      const Size(double.infinity, CustomAppBar.toolbarHeight);
}
