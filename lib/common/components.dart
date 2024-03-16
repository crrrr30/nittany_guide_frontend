import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nittany_guide_frontend/common/constants.dart';

class AppComponents {
  static late TextTheme dmSansTextTheme, dmSerifDisplayTextTheme;

  static Widget sansLabel(String text, {bool white = false}) => !white
      ? Text(text, style: dmSansTextTheme.labelMedium?.copyWith(fontSize: 12.r))
      : Text(text,
          style: dmSansTextTheme.labelMedium
              ?.copyWith(fontSize: 12.r, color: Colors.white));

  static Widget sansBody(String text, {bool white = false}) => !white
      ? Text(text, style: dmSansTextTheme.bodyMedium?.copyWith(fontSize: 14.r))
      : Text(text,
          style: dmSansTextTheme.bodyMedium
              ?.copyWith(fontSize: 14.r, color: Colors.white));

  static Widget sansTitle(String text, {bool white = false}) => !white
      ? Text(text, style: dmSansTextTheme.titleMedium?.copyWith(fontSize: 16.r))
      : Text(text,
          style: dmSansTextTheme.titleMedium
              ?.copyWith(fontSize: 16.r, color: Colors.white));

  static Widget sansHeadline(String text, {bool white = false}) => !white
      ? Text(text,
          style: dmSansTextTheme.headlineMedium?.copyWith(fontSize: 24.r))
      : Text(text,
          style: dmSansTextTheme.headlineMedium
              ?.copyWith(fontSize: 24.r, color: Colors.white));

  static Widget sansDisplay(String text, {bool white = false}) => !white
      ? Text(text,
          style: dmSansTextTheme.displayMedium?.copyWith(fontSize: 42.r))
      : Text(text,
          style: dmSansTextTheme.displayMedium
              ?.copyWith(fontSize: 42.r, color: Colors.white));

  static Widget serifLabel(String text) => Text(text,
      style: dmSerifDisplayTextTheme.labelMedium?.copyWith(fontSize: 12.r));

  static Widget serifBody(String text) => Text(text,
      style: dmSerifDisplayTextTheme.bodyMedium?.copyWith(fontSize: 14.r));

  static Widget serifTitle(String text) => Text(text,
      style: dmSerifDisplayTextTheme.titleMedium?.copyWith(fontSize: 16.r));

  static Widget serifHeadline(String text) => Text(text,
      style: dmSerifDisplayTextTheme.headlineMedium?.copyWith(fontSize: 24.r));

  static Widget serifDisplay(String text) => Text(text,
      style: dmSerifDisplayTextTheme.displayMedium?.copyWith(fontSize: 42.r));

  static double get getBodyWidth => 1.sw >= 720 ? 0.6.sw : 0.85.sw;

  static void showSnackBar(String text, {Duration? duration}) =>
      Get.find<GlobalKey<ScaffoldMessengerState>>()
          .currentState
          ?.showSnackBar(SnackBar(
            content: Text(text),
            duration: duration ?? ALERT_DURATION,
          ));
}
