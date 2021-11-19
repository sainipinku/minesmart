import 'package:flutter/material.dart';
import 'package:minesmart/Common/Helpers.dart';
import 'package:minesmart/Common/SharedPref.dart';
import 'package:minesmart/Helper/colors.dart';
import 'package:minesmart/Helper/fonts.dart';
import 'package:minesmart/Helper/strings.dart';
import 'package:minesmart/elements/DrawerWidget.dart';
import 'package:minesmart/elements/NoInternetdilogbox.dart';
import 'package:minesmart/model/RawannaData.dart';
import 'package:minesmart/model/TPassModel.dart';
import 'package:minesmart/repository/rawanna_repository.dart';
import 'package:minesmart/repository/tpass_repository.dart';
import 'package:minesmart/screens/erawana.dart';
import 'package:minesmart/screens/tpass.dart';
class TPassDetails extends StatefulWidget {
  int index;
  TPassDetails(int this.index) : super();

  @override
  _TPassDetailsState createState() => _TPassDetailsState(index);
}

class _TPassDetailsState extends State<TPassDetails> {
  int index;
  TPassModel? tPassModel;
  String sso_id = "";
  String weight_no = "";
  _TPassDetailsState(int this.index);
  @override
  void initState() {
    super.initState();
    SharedPref.getSsoId("sso_id").then((value) => setState(() {
      sso_id = value;
    }));
    SharedPref.getWeighBridgeNo("weigh_bridge_no").then((value) => setState(() {
      weight_no = value;
    }));
    Helpers.verifyInternet().then((intenet) {
      if (intenet != null && intenet) {
        getTPassData(context, sso_id, weight_no).then((response) {
          setState(() {
            tPassModel = response;
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
      appBar: AppBar(
        backgroundColor: CentralizeColor.colorlogodark,
        leading: Builder(
          builder: (context) => // Ensure Scaffold is in context
          // ignore: deprecated_member_use
          FlatButton(
              padding: EdgeInsets.all(0.0),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => {
              Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TPass(false,"","","","","")))
              }),
        ),
        actions: [
                IconButton(onPressed: () => {}, icon: Icon(
                  Icons.download_sharp,
                  color: Colors.white,
                )),
        ],
      ),
      drawer: const DrawerWidget(),
      body:tPassModel !=null ?  SingleChildScrollView(
        child: Card(
          elevation:5,
          margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0,bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(

                    padding: EdgeInsets.only(left: 10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.transitpassnumber.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${tPassModel!.data[index].tRANSITPASSNUMBER}',
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        )

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.mineralname.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${tPassModel!.data[index].mINERALFORMATIOR}',
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        )

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.consigneename.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${tPassModel!.data[index].cONSIGNEENAME}',
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        )

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.consigngstno,
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${tPassModel!.data[index].cONSIGNEEGSTNO}',
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        )

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.location.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${tPassModel!.data[index].lOCATION}',
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        )

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.vechicleregistration.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${tPassModel!.data[index].vECHICLEREGISTRATION}',
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        )

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.drivermobileno.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${tPassModel!.data[index].dRIVERMOBILENO}',
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        )

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.drivername.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${tPassModel!.data[index].dRIVERNAME}',
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        )

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.tareweight.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${tPassModel!.data[index].tAREWEIGHT}',
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        )

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.grossweight.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${tPassModel!.data[index].gROSSWEIGHT}',
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        )

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.totalweight.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${tPassModel!.data[index].tOTALWEIGHT}',
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        )

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.rawannastatus.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${tPassModel!.data[index].rawannastatus}',
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        )

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.dealername.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${tPassModel!.data[index].dEALERNAME}',
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        )

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.MessageDiscription.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${tPassModel!.data[index].mESSAGEDISCRIPTION}',
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        )

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.address.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${tPassModel!.data[index].cONSIGNEEADDRESS}', maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        )

                      ],
                    ),
                  ),
                ],
              )
            ),
          ),
        ),
      ): null,
    );
  }
}
