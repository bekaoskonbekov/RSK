import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rsk1/generated/codegen_loader.g.dart';
import 'common/app/app.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(  EasyLocalization(
     supportedLocales: [Locale('en'), Locale('ru'),],
      path: 'assets/translations', // <-- change the path of the translation files 
      fallbackLocale: Locale('ru'),
      assetLoader: const CodegenLoader(

      ),
    child: const MyApp()));
}
