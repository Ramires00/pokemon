import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/view/style/colors.dart';
import 'package:pokemon/view/view_home.dart';

class App extends GetMaterialApp {
  const App({super.key});

  @override
  Widget? get home => ViewHome();

  @override
  ThemeData? get theme => ThemeData(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        colorScheme: AppColors.colorScheme,
        scrollbarTheme: const ScrollbarThemeData(
          thumbColor: MaterialStatePropertyAll(AppColors.onSecondary),
        ),
      );
}
