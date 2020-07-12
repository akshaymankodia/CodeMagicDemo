import 'package:codemagic_demo/app_config.dart';
import 'package:codemagic_demo/app_widget.dart';
import 'package:codemagic_demo/environment.dart';
import 'package:codemagic_demo/main_common.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  await mainCommon(Environment.dev);
}

// Future<void> main() async {
//   var configuredApp = AppConfig(
//     appTitle: "Flutter Flavors Dev",
//     buildFlavor: "Development",
//     primaryColor: Colors.blue,
//     child: MyApp(),
//   );
//   return runApp(configuredApp);
// }

