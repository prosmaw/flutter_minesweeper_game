import 'dart:io';

import 'package:demineur/models/session.dart';
import 'package:demineur/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  Directory appDirectory =
      await pathProvider.getApplicationDocumentsDirectory();
  var path = appDirectory.path;
  Hive
    ..init(path)
    ..registerAdapter(SessionAdapter());
  runApp(const MyApp());
}

ThemeData defaultTheme = ThemeData(
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 102, 182, 225)),
  textTheme: GoogleFonts.poppinsTextTheme(Typography.whiteCupertino),
  useMaterial3: true,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: defaultTheme,
      initialRoute: Routes.Home,
      getPages: getPages,
    );
  }
}
