import 'dart:async';

import 'package:flutter/material.dart';
import 'package:minesmart/Helper/colors.dart';
import 'package:minesmart/screens/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late Timer timer;
  Future checkFirstSeen() async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Login()));
   // SharedPreferences prefs = await SharedPreferences.getInstance();
   // bool _seen = (prefs.getBool('seen') ?? false);
    /* SharedPreferences prefs1 = await SharedPreferences.getInstance();
    String id=prefs1.getString('id')??'';
    String name=prefs1.getString('name')??'';
    print(name);*/

    /*if (_seen) {
      // if(id==null||id==''){
      //   Navigator.of(context).pushReplacement(
      //       new MaterialPageRoute(builder: (context) => new LoginScreen()));
      // }
      // else{
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Home()));
      // }

    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Welcome()));
    }*/
  }
  @override
  void initState() {
    super.initState();
    timer =
        Timer.periodic(const Duration(seconds: 5), (Timer t) => checkFirstSeen());
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          backgroundColor: CentralizeColor.colorlogodark,
            body: Center(
              child: Container(
                height: 200,
                width: 200,
                alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: CentralizeColor.colorWhite,
                    shape: BoxShape.circle,
                  ),
                child: const Image(
                  image: AssetImage('assets/images/minesmart.png'),
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill,
                ),
              )
              ,
            )
        )
    );
  }
}
