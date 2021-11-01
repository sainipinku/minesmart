import 'package:flutter/material.dart';
import 'package:minesmart/Common/Helpers.dart';
import 'package:minesmart/Helper/colors.dart';
import 'package:minesmart/Helper/fonts.dart';
import 'package:minesmart/Helper/strings.dart';
import 'package:minesmart/elements/NoInternetdilogbox.dart';
import 'package:minesmart/screens/deshboard.dart';

import '/Repository/user_repository.dart' as repository;
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;

  final emailControl = TextEditingController();
  final pwControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CentralizeColor.colorWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CustomPaint(
                  painter: ShapesPainter(),
                  child: Container(height: 300),
                ),
               /* Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                      color: CentralizeColor.colorlogodark,
                      borderRadius: new BorderRadius.only(
                        bottomLeft: const Radius.circular(70.0),
                        bottomRight: const Radius.circular(70.0),
                      )
                  ),
                ),*/
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 200,
                    width: 200,
                    margin: const EdgeInsets.only(top: 180),
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
                  ),
                )

              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0,right: 10.0,top: 100.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    style: const TextStyle(
                        color: Colors.black
                    ),
                    controller: emailControl,
                    keyboardType: TextInputType.emailAddress,
                    //onSaved: (input) => _con!.user.email = input!,
                    //validator: (input) => !input!.contains('@') ? "Should be a valid email" : null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Email Id",
                      labelStyle: const TextStyle(color:  Colors.black),
                      contentPadding: const EdgeInsets.all(20),
                      hintText: 'Email Id',
                      hintStyle: TextStyle(color:Colors.black),
                      //  border: OutlineInputBorder(borderSide: BorderSide(color:UiWhiteColor.withOpacity(0.2))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(const Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),

                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: const TextStyle(
                        color: Colors.black
                    ),
                    keyboardType: TextInputType.text,
                    controller: pwControl,
                    //onSaved: (input) => _con!.user.password = input!,
                    //validator: (input) => input!.length < 3 ? "Should be more than 3 characters" : null,
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Password",
                      labelStyle: const TextStyle(color:  Colors.black),
                      contentPadding: const EdgeInsets.all(20),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color:Colors.black),
                      //    prefixIcon: Icon(Icons.lock_outline, color: Theme.of(context).accentColor),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword =!hidePassword;
                          });
                        },
                        color: Colors.black,
                        icon: Icon(hidePassword ? Icons.visibility : Icons.visibility_off),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),

                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),

                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: CentralizeColor.colorlogodark,
                        onPrimary:
                        Colors.white, // foreground
                      ),
                      onPressed: () {

                        Helpers.verifyInternet().then((intenet) {
                          if (intenet != null && intenet) {

                            if(emailControl.text.isEmpty){
                              Helpers.createSnackBar(context, "Should be a fill Email");

                            }
                            else if(!Helpers.validateEmail(emailControl.text)){
                              Helpers.createSnackBar(context, "Should be a valid email");
                            }

                            else if(pwControl.text.isEmpty) {
                              Helpers.createSnackBar(context, "Should be a fill Password");

                            }
                            else{
                              //repository.createLogin(emailControl.text, pwControl.text,context);

                               Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => const DeshBoard()));
                            }

                          }
                          else {
                            showDialog(
                              barrierDismissible: true,
                              context: context,
                              builder: (_) => NoInternetdilogbox(),
                            );
                          }

                        });

                      },
                      child: Text(
                        Strings.login,
                        style: const TextStyle(
                          color: CentralizeColor.colorWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily:Fonts.ps_default_font_family,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                     decoration: BoxDecoration(
                       shape: BoxShape.rectangle,
                       border: Border.all(width: 1.0, color: Colors.grey),
                         borderRadius: const BorderRadius.only(
                           bottomLeft: const Radius.circular(5.0),
                           bottomRight: const Radius.circular(5.0),
                           topRight: const Radius.circular(5.0),
                           topLeft: const Radius.circular(5.0),
                         )
                     ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/images/google.png'),
                        height: 20,
                        width: 20,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(Strings.signinwithgoogle,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: Fonts.ps_default_font_family,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ],
              ),
            )
            ,
          ],
        ),
      ),
    );
  }
}
class ShapesPainter extends CustomPainter {
  double _kCurveHeight = 35;
  @override
  void paint(Canvas canvas, Size size) {
    final p = Path();
    p.lineTo(0, size.height - _kCurveHeight);
    p.relativeQuadraticBezierTo(size.width / 2, 2 * _kCurveHeight, size.width, 0);
    p.lineTo(size.width, 0);
    p.close();

    canvas.drawPath(p, Paint()..color = CentralizeColor.colorlogodark);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}