import 'package:flutter/material.dart';
import 'package:minesmart/Common/Helpers.dart';
import 'package:minesmart/Common/SharedPref.dart';
import 'package:minesmart/Helper/colors.dart';
import 'package:minesmart/Helper/fonts.dart';
import 'package:minesmart/Helper/strings.dart';
import 'package:minesmart/elements/DrawerWidget.dart';
import 'package:minesmart/elements/NoInternetdilogbox.dart';
import 'package:minesmart/model/CompanyProfileModel.dart';
import 'package:minesmart/repository/company_profile_repository.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  CompanyProfileModel? companyProfileModel;
  String sso_id = "";
  String user_id = "";
  @override
  void initState() {
    super.initState();
    SharedPref.getSsoId("sso_id").then((value) => setState(() {
      sso_id = value;
    }));
    SharedPref.getWeighBridgeNo("user_id").then((value) => setState(() {
      user_id = value;
    }));
    Helpers.verifyInternet().then((intenet) {
      if (intenet != null && intenet) {
        getCompanyDetails(context,sso_id,user_id).then((response) {
          setState(() {
            companyProfileModel = response;
          });

        });
      }
      else {
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (_) => NoInternetdilogbox(),
        );
      }
    });
  }

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
              child:companyProfileModel != null ? Card(
                elevation:5,
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0,bottom: 20.0),
                   child:companyProfileModel!.data.isNotEmpty ?
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
                                 padding: EdgeInsets.only(left: 10.0),
                                 child: Text(
                                   '${companyProfileModel!.data[0].cOMPANYNAME}',
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
                             Strings.address,
                             style: const TextStyle(
                                 color: Colors.black,
                                 fontSize: 17,
                                 fontFamily: Fonts.ps_default_font_family,
                                 fontWeight: FontWeight.w600),
                           ),
                           Expanded(
                               child: Padding(
                                 padding: EdgeInsets.only(left: 10.0),
                                 child: Text(
                                   '${companyProfileModel!.data[0].aDDRESS}',
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
                             padding: EdgeInsets.only(left: 10.0),
                             child: Text(
                               '${companyProfileModel!.data[0].mOBILE}',
                               style: TextStyle(
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
                             padding: EdgeInsets.only(left: 10.0),
                             child: Text(
                               '${companyProfileModel!.data[0].eMAIL}',
                               style: TextStyle(
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
                             padding: EdgeInsets.only(left: 10.0),
                             child: Text(
                               '${companyProfileModel!.data[0].gSTNO}',
                               style: TextStyle(
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
                             padding: EdgeInsets.only(left: 10.0),
                             child: Text(
                               '${companyProfileModel!.data[0].pANCARD}',
                               style: TextStyle(
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
                           const Padding(
                             padding: EdgeInsets.only(left: 10.0),
                             child: Text(
                               "www.minesmart.com",
                               style: TextStyle(
                                   color: Colors.black,
                                   fontSize: 17,
                                   fontFamily: Fonts.ps_default_font_family,
                                   fontWeight: FontWeight.w600),
                             ),
                           )
                         ],
                       ),
                     ],
                   ):Center(
                       child: Text(
                         "No Record",
                         style:  TextStyle(
                             color: Colors.black,
                             fontSize: 17,
                             fontFamily: Fonts.ps_default_font_family,
                             fontWeight: FontWeight.w600),
                       )
                   ),),
              ):const Center(
                  child: Text(
                    "",
                    style:  TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: Fonts.ps_default_font_family,
                        fontWeight: FontWeight.w600),
                  )
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
