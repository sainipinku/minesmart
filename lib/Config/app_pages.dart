
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:minesmart/Config/app_route.dart';
import 'package:minesmart/screens/deshboard.dart';
import 'package:minesmart/screens/details.dart';
import 'package:minesmart/screens/erawana.dart';
import 'package:minesmart/screens/erawanafillter.dart';
import 'package:minesmart/screens/login.dart';
import 'package:minesmart/screens/profileupdate.dart';
import 'package:minesmart/screens/splash.dart';

class AppPages {
  static const INITIAL = Routes.splash;
  static final routes = [
    GetPage(
        name: Routes.splash,
        page: () => Splash()),
    GetPage(
        name: Routes.login,
        page: () => Login()),
    GetPage(
        name: Routes.login,
        page: () => DeshBoard()),
    GetPage(
        name: Routes.erawana,
        page: () => Erawana(false,"","","","","")),
    GetPage(
        name: Routes.details,
        page: () => Details(0)),
    GetPage(
        name: Routes.profileupdate,
        page: () => ProfileUpdate()),
    GetPage(
        name: Routes.erawanafillter,
        page: () => ErawanaFillter()),
  ];
}
