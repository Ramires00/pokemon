import 'package:flutter/material.dart';
import 'package:pokemon/view/widget/appbar/divider_appbar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.title,
    this.color = Colors.blue,
    super.key,
  });

  final String? title;
  final Color? color;

  static const double toolbarHeight = kToolbarHeight + 44;

  @override
  Widget build(BuildContext context) => PreferredSize(
        preferredSize: const Size(double.infinity, CustomAppBar.toolbarHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                height: toolbarHeight,
                color: color,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    title ?? "",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )),
            const DividerAppbar()
          ],
        ),
      );

  @override
  Size get preferredSize => const Size(double.infinity, CustomAppBar.toolbarHeight);
}
