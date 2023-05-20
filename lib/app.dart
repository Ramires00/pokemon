import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/view/view_home.dart';

class App extends GetMaterialApp {
  const App({super.key});

  @override
  Widget? get home => ViewHome();
}
