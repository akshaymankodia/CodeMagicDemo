import 'package:codemagic_demo/app_config.dart';
import 'package:codemagic_demo/config_reader.dart';
import 'package:codemagic_demo/environment.dart';
import 'package:codemagic_demo/main.dart';
import 'package:flutter/material.dart';

Future<void> mainCommon(String env) async {
  // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();
  // Load the JSON config into memory
  await ConfigReader.initialize();

  switch (env) {
    case Environment.dev:
      var configuredApp = AppConfig(
        appTitle: "Flutter Flavors Dev",
        buildFlavor: "Development",
        primaryColor: Colors.blue,
        child: MyApp(),
      );
      return runApp(configuredApp);
      break;
    case Environment.prod:
    var configuredApp = AppConfig(
    appTitle: "Flutter Flavors Prod",
    buildFlavor: "Production",
    primaryColor: Colors.red,
    child: MyApp(),
  );
  return runApp(configuredApp);
      break;
  }
}
