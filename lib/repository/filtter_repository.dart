import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:minesmart/Common/Helpers.dart';
import 'package:minesmart/Common/SharedPref.dart';
import 'package:minesmart/Helper/constants.dart';
import 'package:minesmart/model/FiltterModel.dart';
import 'package:minesmart/model/RawannaData.dart';
import 'package:minesmart/model/TPassFiltterModel.dart';
import 'package:minesmart/model/UserData.dart';
import 'package:http/http.dart' as http;
import 'package:minesmart/screens/deshboard.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<FiltterModel> getFiltterData(BuildContext context,String ssoid,String weightno) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse(Constants.baseUrl+ Constants.getFillterMaster+'objAuthoken=987654321&objssoid='+ssoid+'&objweightno='+weightno+'');
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    /* body: jsonEncode(<String, String>{
      'objAuthoken': '987654321',
      'objUserName': email,
      'objPassword': password,
    }
    ),*/
  );
  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    return  FiltterModel.fromJson(json.decode(response.body));

  } else {
    Helpers.hideLoader(loader);
    Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    throw new Exception(response.body);

  }

}

Future<TPassFiltterModel> getTpassFiltterData(BuildContext context,String ssoid,String weightno) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse(Constants.baseUrl+ Constants.getTpassFillterMaster+'objAuthoken=987654321&objssoid=AMITKUMARMEHRA&objweightno='+weightno+'');
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    /* body: jsonEncode(<String, String>{
      'objAuthoken': '987654321',
      'objUserName': email,
      'objPassword': password,
    }
    ),*/
  );
  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    return  TPassFiltterModel.fromJson(json.decode(response.body));

  } else {
    Helpers.hideLoader(loader);
    Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    throw new Exception(response.body);

  }

}