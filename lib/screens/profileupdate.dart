import 'package:flutter/material.dart';
import 'package:minesmart/Common/Helpers.dart';
import 'package:minesmart/Helper/colors.dart';
import 'package:minesmart/Helper/fonts.dart';
import 'package:minesmart/Helper/strings.dart';
import 'package:minesmart/elements/DrawerWidget.dart';
import 'package:minesmart/elements/NoInternetdilogbox.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  bool hidePassword = true;

  final emailControl = TextEditingController();
  final pwControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CentralizeColor.colorWhite,
      appBar: AppBar(
        backgroundColor: CentralizeColor.colorlogodark,
        leading: Builder(
          builder: (context) => // Ensure Scaffold is in context
              // ignore: deprecated_member_use
              FlatButton(
                  padding: EdgeInsets.all(0.0),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer()),
        ),
        actions: [],
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CustomPaint(
                  painter: ShapesPainter(),
                  child: Container(height: 200),
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
                    margin: const EdgeInsets.only(top: 80),
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
              child: Card(
                elevation:5,
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0,bottom: 20.0),
                   child:
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text(
                             Strings.company,
                             style: const TextStyle(
                                 color: Colors.black,
                                 fontSize: 17,
                                 fontFamily: Fonts.ps_default_font_family,
                                 fontWeight: FontWeight.w600),
                           ),
                           Expanded(
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 10.0),
                                 child: Text(
                                   "Minesmart",
                                   maxLines: 2,
                                   overflow: TextOverflow.ellipsis,
                                   style: const TextStyle(
                                       color: Colors.black,
                                       fontSize: 17,
                                       fontFamily: Fonts.ps_default_font_family,
                                       fontWeight: FontWeight.w600),
                                 ),
                               ))
                         ],
                       ),
                       const SizedBox(
                         height: 20,
                       ),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text(
                             Strings.address,
                             style: const TextStyle(
                                 color: Colors.black,
                                 fontSize: 17,
                                 fontFamily: Fonts.ps_default_font_family,
                                 fontWeight: FontWeight.w600),
                           ),
                           const Expanded(
                               child: Padding(
                                 padding: EdgeInsets.only(left: 10.0),
                                 child: Text(
                                   " A 163 Shiv nagar murlipura scheme jaipur 302013 ",
                                   maxLines: 2,
                                   overflow: TextOverflow.ellipsis,
                                   style: TextStyle(
                                       color: Colors.black,
                                       fontSize: 17,
                                       fontFamily: Fonts.ps_default_font_family,
                                       fontWeight: FontWeight.w600),
                                 ),
                               ))
                         ],
                       ),
                       const SizedBox(
                         height: 20,
                       ),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text(
                             Strings.mobileno,
                             style: const TextStyle(
                                 color: Colors.black,
                                 fontSize: 17,
                                 fontFamily: Fonts.ps_default_font_family,
                                 fontWeight: FontWeight.w600),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 10.0),
                             child: Text(
                               "987654321",
                               style: const TextStyle(
                                   color: Colors.black,
                                   fontSize: 17,
                                   fontFamily: Fonts.ps_default_font_family,
                                   fontWeight: FontWeight.w600),
                             ),
                           )
                         ],
                       ),
                       const SizedBox(
                         height: 20,
                       ),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text(
                             Strings.emailid,
                             style: const TextStyle(
                                 color: Colors.black,
                                 fontSize: 17,
                                 fontFamily: Fonts.ps_default_font_family,
                                 fontWeight: FontWeight.w600),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 10.0),
                             child: Text(
                               "abc@gmail.com",
                               style: const TextStyle(
                                   color: Colors.black,
                                   fontSize: 17,
                                   fontFamily: Fonts.ps_default_font_family,
                                   fontWeight: FontWeight.w600),
                             ),
                           )
                         ],
                       ),
                       const SizedBox(
                         height: 20,
                       ),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text(
                             Strings.gstno,
                             style: const TextStyle(
                                 color: Colors.black,
                                 fontSize: 17,
                                 fontFamily: Fonts.ps_default_font_family,
                                 fontWeight: FontWeight.w600),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 10.0),
                             child: Text(
                               "GHFR12456677JHFBHGHNN",
                               style: const TextStyle(
                                   color: Colors.black,
                                   fontSize: 17,
                                   fontFamily: Fonts.ps_default_font_family,
                                   fontWeight: FontWeight.w600),
                             ),
                           )
                         ],
                       ),
                       const SizedBox(
                         height: 20,
                       ),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text(
                             Strings.panno,
                             style: const TextStyle(
                                 color: Colors.black,
                                 fontSize: 17,
                                 fontFamily: Fonts.ps_default_font_family,
                                 fontWeight: FontWeight.w600),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 10.0),
                             child: Text(
                               "GHFR12456677JHFBHGHNN",
                               style: const TextStyle(
                                   color: Colors.black,
                                   fontSize: 17,
                                   fontFamily: Fonts.ps_default_font_family,
                                   fontWeight: FontWeight.w600),
                             ),
                           )
                         ],
                       ),
                       const SizedBox(
                         height: 20,
                       ),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text(
                             Strings.website,
                             style: const TextStyle(
                                 color: Colors.black,
                                 fontSize: 17,
                                 fontFamily: Fonts.ps_default_font_family,
                                 fontWeight: FontWeight.w600),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 10.0),
                             child: Text(
                               "www.minesmart.com",
                               style: const TextStyle(
                                   color: Colors.black,
                                   fontSize: 17,
                                   fontFamily: Fonts.ps_default_font_family,
                                   fontWeight: FontWeight.w600),
                             ),
                           )
                         ],
                       ),
                     ],
                   ),),
              ),
            ),
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
    p.relativeQuadraticBezierTo(
        size.width / 2, 2 * _kCurveHeight, size.width, 0);
    p.lineTo(size.width, 0);
    p.close();

    canvas.drawPath(p, Paint()..color = CentralizeColor.colorlogodark);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
