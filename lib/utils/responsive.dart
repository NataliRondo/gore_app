import 'package:flutter/material.dart';
import 'dart:math' as math;

class ResponsiveApp {
  late double _width, _height, _diagonal;
  late bool _isTablet;

  double get width => _width;
  double get height => _height;
  double get diagonal => _diagonal;
  bool get isTablet => _isTablet;

  static ResponsiveApp of(BuildContext context) => ResponsiveApp(context);

  ResponsiveApp(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;
    _diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));

    _isTablet = size.shortestSide >= 500;
  }

  double wp(double percent) => _width * percent / 100;
  double hp(double percent) => _width * percent / 100;
  double dp(double percent) => _width * percent / 100;
}
