import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:minesmart/Common/Helpers.dart';
import 'package:minesmart/Common/SharedPref.dart';
import 'package:minesmart/Helper/constants.dart';
import 'package:minesmart/model/UserData.dart';
import 'package:http/http.dart' as http;
import 'package:minesmart/screens/deshboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
ValueNotifier<UserData> usergetDatas = ValueNotifier(UserData());

Future<UserData> createLogin(
    String email, String password, BuildContext context) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  String Url = Constants.baseUrl+ Constants.login;
  var url;
    url = Uri.parse(Constants.baseUrl+ Constants.login+'objAuthoken=987654321&objUserName='+email+'&objPassword='+password+'');
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
/*  var queryParameters = {
    'objAuthoken': '987654321',
    'objUserName': email,
    'objPassword': password,
  };
  var uri =
  Uri.https(Constants.baseUrl, Constants.login, queryParameters);
  var response = await http.post(uri, headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
  });*/
/*  var map = new Map<String, dynamic>();
  map['objUserName'] = email;
  map['objPassword'] = password;
  map['objAuthoken'] = '987654321';
  final client = new http.Client();
  final response = await client.post(
    Url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json',},
    body: map,
  );*/
  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    usergetDatas.value = UserData.fromJson(json.decode(response.body));
    SharedPref.setUserId(usergetDatas.value.data[0].userId);
    SharedPref.setSsoId(usergetDatas.value.data[0].ssoId);
    SharedPref.setWeighBridgeNo(usergetDatas.value.data[0].weighBridgeNo);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', usergetDatas.value.data[0].userId.toString());
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => DeshBoard()));
    return usergetDatas.value;

  } else {
    Helpers.hideLoader(loader);
    Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    throw new Exception(response.body);

  }

}