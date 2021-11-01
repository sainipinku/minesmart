import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minesmart/Common/Helpers.dart';
import 'package:minesmart/Common/SharedPref.dart';
import 'package:minesmart/Helper/constants.dart';
import 'package:minesmart/model/UserData.dart';
import 'package:http/http.dart' as http;
ValueNotifier<UserData> usergetDatas = ValueNotifier(UserData());

Future<UserData> createLogin(
    String email, String password, BuildContext context) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url = Uri.parse(Constants.baseUrl+ Constants.login);
  var map = new Map<String, dynamic>();
  map['email'] = email;
  map['password'] = password;
  map['device_token'] = '';
  http.Response response = await http.post(
    url,
    //headers: {'Authorization':Helpers.authId},
    body: map,
  );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    int status;
    status=json.decode(response.body)['status'];
    if(status==1){
      Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
      usergetDatas.value = UserData.fromJSON(json.decode(response.body)['data']);
      SharedPref.setId(jsonDecode(response.body)['data']["id"]);
      SharedPref.setName(jsonDecode(response.body)['data']["name"]);
      SharedPref.setLastName(jsonDecode(response.body)['data']["lastname"]);
      SharedPref.setEmail(jsonDecode(response.body)['data']["email"]);
      SharedPref.setPhone(jsonDecode(response.body)['data']["mobileno"]);
      SharedPref.setProfilePic(jsonDecode(response.body)['data']["profilepic"]);
     /* Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Home()
        ),
      );*/
      return usergetDatas.value;
    }
    else{
      Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    }

  } else {
    Helpers.hideLoader(loader);
    Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    throw new Exception(response.body);

  }
  return usergetDatas.value;
}