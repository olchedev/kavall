import 'package:flutter/material.dart';
import 'package:kavall/core/constants/dimensions.dart';

class KavallTheme {
  static fetchMainTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.deepPurple,
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: AppDimensions.semiBig,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  const KavallTheme._();
}
