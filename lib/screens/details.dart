import 'package:flutter/material.dart';
import 'package:minesmart/Common/Helpers.dart';
import 'package:minesmart/Common/SharedPref.dart';
import 'package:minesmart/Helper/colors.dart';
import 'package:minesmart/Helper/fonts.dart';
import 'package:minesmart/Helper/strings.dart';
import 'package:minesmart/elements/DrawerWidget.dart';
import 'package:minesmart/elements/NoInternetdilogbox.dart';
import 'package:minesmart/model/RawannaData.dart';
import 'package:minesmart/repository/rawanna_repository.dart';
class Details extends StatefulWidget {
  int index;
  Details(int this.index) : super();

  @override
  _DetailsState createState() => _DetailsState(index);
}

class _DetailsState extends State<Details> {
  int index;
  RawannaData? rawannaData;
  String sso_id = "";
  String weight_no = "";
  _DetailsState(int this.index);
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
        getRawannaData(context,sso_id,weight_no).then((response) {
          setState(() {
            rawannaData = response;
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
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () => Scaffold.of(context).openDrawer()),
        ),
        actions: [
        ],
      ),
      drawer: const DrawerWidget(),
      body:rawannaData !=null ?  SingleChildScrollView(
        child: Card(
          elevation:5,
          margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0,bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.mineralname,
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            '${rawannaData!.data[index].mineralName}',
                            style: const TextStyle(
                              color: CentralizeColor.colorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily:Fonts.ps_default_font_family,
                            ),
                          ),)

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.consigneename,
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            '${rawannaData!.data[index].consigneeName}',
                            style: const TextStyle(
                              color: CentralizeColor.colorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily:Fonts.ps_default_font_family,
                            ),
                          ),)

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.vechicle,
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            '${rawannaData!.data[index].vechicle}',
                            style: const TextStyle(
                              color: CentralizeColor.colorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily:Fonts.ps_default_font_family,
                            ),
                          ),)

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.unit,
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            '${rawannaData!.data[index].unit}',
                            style: const TextStyle(
                              color: CentralizeColor.colorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily:Fonts.ps_default_font_family,
                            ),
                          ),)

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.vechicleregistration,
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            '${rawannaData!.data[index].vechicleRegistration}',
                            style: const TextStyle(
                              color: CentralizeColor.colorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily:Fonts.ps_default_font_family,
                            ),
                          ),)

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.drivermobileno,
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            '${rawannaData!.data[index].driverMobileNo}',
                            style: const TextStyle(
                              color: CentralizeColor.colorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily:Fonts.ps_default_font_family,
                            ),
                          ),)

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.drivername,
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            '${rawannaData!.data[index].driverName}',
                            style: const TextStyle(
                              color: CentralizeColor.colorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily:Fonts.ps_default_font_family,
                            ),
                          ),)

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.tareweight,
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            '${rawannaData!.data[index].tareWeight}',
                            style: const TextStyle(
                              color: CentralizeColor.colorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily:Fonts.ps_default_font_family,
                            ),
                          ),)

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.grossweight,
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            '${rawannaData!.data[index].grossWeight}',
                            style: const TextStyle(
                              color: CentralizeColor.colorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily:Fonts.ps_default_font_family,
                            ),
                          ),)

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.totalweight,
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            '${rawannaData!.data[index].totalWeight}',
                            style: const TextStyle(
                              color: CentralizeColor.colorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily:Fonts.ps_default_font_family,
                            ),
                          ),)

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.rawannastatus,
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            '${rawannaData!.data[index].rawannastatus}',
                            style: const TextStyle(
                              color: CentralizeColor.colorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily:Fonts.ps_default_font_family,
                            ),
                          ),)

                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    color: CentralizeColor.colorBlack,
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
