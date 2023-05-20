import 'package:flutter/material.dart';

extension ExtContext on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}
