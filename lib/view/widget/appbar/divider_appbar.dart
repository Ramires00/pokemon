import 'package:flutter/material.dart';

class DividerAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DividerAppbar({this.color = Colors.grey, this.thickness = 2, super.key});

  final Color? color;
  final double? thickness;

  @override
  Widget build(BuildContext context) => Divider(
        color: color,
        height: 0,
        thickness: thickness,
      );

  @override
  Size get preferredSize => const Size(double.infinity, 0);
}
