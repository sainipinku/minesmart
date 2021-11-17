// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minesmart/Common/Helpers.dart';
import 'package:minesmart/Common/SharedPref.dart';
import 'package:minesmart/Helper/colors.dart';
import 'package:minesmart/Helper/fonts.dart';
import 'package:minesmart/Helper/strings.dart';
import 'package:minesmart/screens/deshboard.dart';
import 'package:minesmart/screens/erawana.dart';
import 'package:minesmart/screens/login.dart';
import 'package:minesmart/screens/profileupdate.dart';

class DrawerWidget extends StatefulWidget {

const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Color whiteui = Colors.white70;
  Color drawericoncolor = Colors.white;

  TextStyle textstyle = TextStyle(
      color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w600,fontFamily: Fonts.ps_default_font_family);

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:  Container(
        child:
        ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: CentralizeColor.colorsblack,
//              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: (){

                      },
                      child:
                      Container(
                        height: 80,
                        width: 80,
                        alignment: Alignment.centerLeft,
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: AssetImage(
                                  'assets/images/minesmart.png'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(55.0),
                            border: Border.all(
                                color: CentralizeColor.colorWhite,
                                width: 1.0)),
                      )

                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 5.0, left: 5.0),
                          child:Text(
                            "Name",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,fontFamily: Fonts.ps_default_font_family),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0, left: 5.0),
                          child: Text(
                            "abc@gmail.com",
                            style: TextStyle(
                                color: Colors.white, fontSize: 15,fontFamily: Fonts.ps_default_font_family),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              child: ListTile(
                title: Align(
                  alignment: Alignment.centerLeft,
                  child:  Text(
                    Strings.deshboard,
                    style: textstyle,
                  ),
                )
               ,
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DeshBoard()),
                    );
                  });
                },
              ),
            ),
            Container(
              height: 48,
              child: ListTile(
                title: Text( Strings.erawana, style: textstyle),
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Erawana(false,"","","","","")),
                    );
                  });
                  /* Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManageShippingPrice()),
              );*/
                },
              ),
            ),
            Container(
              height: 48,
              child: ListTile(

                title: Text( Strings.tpass, style: textstyle),
                onTap: () {
                  setState(() {

                    Navigator.pop(context);
                   /* Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => dealsPage()),
                    );*/
                  });
                  /* Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyProduct()),
              );*/
                },
              ),
            ),
            Container(
              height: 48,
              child:ListTile(
                title: Text( Strings.weightslip, style: textstyle),
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                   /* Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cart()),
                    );*/
                  });
                  /* Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyOrder()),
              );*/
                },
              ) ,
            ),
            Container(
              height: 48,
              child: ListTile(
                title: Text( Strings.profile, style: textstyle),
                onTap: () {
                  setState(() {

                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileUpdate()),
                    );
                  });

                },
              ),
            ),
            Container(
              height: 48,
              child: ListTile(
                title: Text( Strings.help, style: textstyle),
                onTap: () {
                  setState(() {
                    Navigator.pop(context);

                  });
                  /* Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactUs()),
              );*/
                },
              ),
            ),
            Container(
              height: 48,
              child: ListTile(
                title: Text( Strings.logout, style: textstyle),
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                   showDialog(
                barrierDismissible: true,
                context: context,
                builder: (_) => Logout(),
              );
                },
              ),
            ),

          ],
        ),
      ),
    )
     ;
  }
}
class Logout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LogoutState();
}

class LogoutState extends State<Logout>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 40));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              padding: EdgeInsets.all(15.0),
              height: 140.0,
              width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 5,),
                  Padding(padding: EdgeInsets.only(left: 10.0,right: 10.0),
                    child: Text("Do you want to exit this application?"
                      ,style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        fontFamily:Fonts.ps_default_font_family,
                        fontWeight: FontWeight.w600,
                      ),),),
                  SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.30,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: CentralizeColor.colorgray,
                            onPrimary:
                            Colors.white, // foreground
                          ),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop(false);
                          },
                          child: Text(
                            Strings.cancel,
                            style: const TextStyle(
                              color: CentralizeColor.colorWhite,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily:Fonts.ps_default_font_family,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.30,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: CentralizeColor.colorlogodark,
                            onPrimary:
                            Colors.white, // foreground
                          ),
                          onPressed: () {
                            SharedPref.removeAll();
                            SharedPref.removeValues();
                            Helpers.createSnackBar(context, 'Logout Successfully');
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Text(
                            Strings.logout,
                            style: const TextStyle(
                              color: CentralizeColor.colorWhite,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily:Fonts.ps_default_font_family,
                            ),
                          ),
                        ),
                      )
                     /* InkWell(
                        onTap: (){
                          SharedPref.removeAll();
                          SharedPref.removeValues();
                          Helpers.createSnackBar(context, 'Logout Successfully');
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );

                        },
                        child: Text("Yes",
                          style: TextStyle(
                              color: CentralizeColor.coloryellow,
                              fontSize: 15,
                              fontFamily:Fonts.ps_default_font_family,
                              fontWeight: FontWeight.w600
                          ),),),*/
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }

}