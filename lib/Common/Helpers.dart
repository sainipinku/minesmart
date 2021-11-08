import 'dart:async';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:minesmart/Helper/colors.dart';
import 'package:minesmart/Helper/fonts.dart';


import 'CircularLoadingWidget.dart';

class Helpers {
  /// Auth Services
  late BuildContext context;
  late DateTime currentBackPressTime;

  Helpers.of(BuildContext _context) {
    this.context = _context;
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Tap back again to leave");
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  String convertToBase64(String credentials) {
    final Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return stringToBase64.encode(credentials);
  }

  String base64ToString(String credentials) {
    final Codec<String, String> base64ToString = utf8.fuse(base64);
    return base64ToString.decode(credentials);
  }



  static OverlayEntry overlayLoader(context) {
    OverlayEntry loader = OverlayEntry(builder: (context) {
      final size = MediaQuery.of(context).size;
      return Positioned(
        height: size.height,
        width: size.width,
        top: 0,
        left: 0,
        child: Material(
          color:  CentralizeColor.colorlogodark.withOpacity(0.0),
          child: CircularLoadingWidget(height: 200),
        ),
      );
    });
    return loader;
  }


  static hideLoader(OverlayEntry loader) {
    Timer(Duration(milliseconds: 500), () {
      try {
        loader.remove();
      } catch (e) {}
    });
  }

  static Uri getUri(String base_url,String path) {

    String _path = Uri.parse(base_url).path;
    if (!_path.endsWith('/')) {
      _path += '/';
    }
    Uri uri = Uri(
        scheme: Uri.parse(base_url).scheme,
        host: Uri.parse(base_url).host,
        port: Uri.parse(base_url).port, //GlobalConfiguration().getValue('base_url')
        path: _path + path);
    return uri;
  }

  static Future<bool> verifyInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
  static String discount(int price, int saleprice) {
    try {

      // var intprice = int.parse(price);
      //  var intsaleprice = int.parse(saleprice);
      double par = ((price - saleprice)/price)*100;
      double i = double.parse((par).toStringAsFixed(2));
      return '$i';
    } catch (e) {
      return '';
    }
  }

  static createSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: CentralizeColor.colorlogodark,
      content: Text(
        message,
        style: TextStyle(
            fontSize: 14.0,
            fontFamily: Fonts.ps_default_font_family,
            fontWeight: FontWeight.w600,
            color: CentralizeColor.colorWhite),
      ),
    ));
  }

  static bool validateEmail(String value) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    return (!regex.hasMatch(value)) ? false : true;
  }

}
