import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Config/app_pages.dart';
/*class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    HttpClient httpClient = super.createHttpClient(context)
      ..badCertificateCal lback = (X509Certificate cert, String host, int port) {
        return true;
      };
    return httpClient;
  }
}*/
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minesmart app',
      // theme: ThemeData(
      //   primarySwatch: Colors.lightGreen,
      // ),
      // logWriterCallback: Logger.write,
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
    );
  }
}