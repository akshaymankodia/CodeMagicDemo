import 'package:codemagic_demo/environment.dart';
import 'package:codemagic_demo/main_common.dart';

Future<void> main() async {
  await mainCommon(Environment.dev);
}