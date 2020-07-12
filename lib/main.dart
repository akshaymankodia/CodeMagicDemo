import 'package:codemagic_demo/app_config.dart';
import 'package:codemagic_demo/app_widget.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.of(context).appTitle,
      theme: ThemeData(
        primarySwatch: AppConfig.of(context).primaryColor,
      ),
      home: MyHomePage(),
    );
  }
}