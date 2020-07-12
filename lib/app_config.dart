import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppConfig extends InheritedWidget{
  final String appTitle;
  final String buildFlavor;
  final Widget child;
  final MaterialColor primaryColor;

  AppConfig({
    @required this.child,
    @required this.appTitle,
    @required this.buildFlavor,
    @required this.primaryColor});

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}