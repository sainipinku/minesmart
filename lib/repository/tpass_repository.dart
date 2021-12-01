import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:minesmart/Common/Helpers.dart';
import 'package:minesmart/Common/SharedPref.dart';
import 'package:minesmart/Helper/constants.dart';
import 'package:minesmart/model/RawannaData.dart';
import 'package:minesmart/model/TPassModel.dart';
import 'package:minesmart/model/UserData.dart';
import 'package:http/http.dart' as http;
import 'package:minesmart/screens/deshboard.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<TPassModel> getTPassData(BuildContext context,String ssoid,String weightno) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse(Constants.baseUrl+ Constants.gettpass+'objAuthoken=987654321&objssoid=AMITKUMARMEHRA&objweightno='+weightno+'');
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
    return  TPassModel.fromJson(json.decode(response.body));

  } else {
    Helpers.hideLoader(loader);
    Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    throw new Exception(response.body);

  }

}


Future<TPassModel> getTPassFillterData(BuildContext context,String ssoid,String weightno,String userid,String mineralname,String consigneename,String vechicle,String drivemoble,String drivename,String mlno,String erwannano,String formdate,String todate) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse(Constants.baseUrl+ Constants.getTranistPassSearchDetails+'objUserId='+userid+'&objssoid=AMITKUMARMEHRA&objAuthoken=987654321&objMineralName='+mineralname+'&objConsigneeName='+consigneename+'&objVechicle='+vechicle+'&objDriverMobile='+drivemoble+'&objDriverName='+drivename+'&objdealerName='+mlno+'&objErawannaNo='+erwannano+'&objweightno='+weightno+'&objFromdate='+formdate+'&objTodate='+todate+'');
  print("url $url");
  //url = Uri.parse(Constants.baseUrl+ Constants.getFillterSearchDetails+'objUserId="5"&objssoid=somendrac90&objAuthoken=987654321&objMineralName=""&objConsigneeName=""&objVechicle=""&objDriverMobile=""&objDriverName=Amit kumar&objMLNo=""&objErawannaNo=""&objweightno=00844');
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
    return  TPassModel.fromJson(json.decode(response.body));

  } else {
    Helpers.hideLoader(loader);
    Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    throw new Exception(response.body);

  }

}
