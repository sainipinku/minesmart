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
import 'package:minesmart/screens/erawana.dart';
class ErawanaDetails extends StatefulWidget {
  int index;
  ErawanaDetails(int this.index) : super();

  @override
  _ErawanaDetailsState createState() => _ErawanaDetailsState(index);
}

class _ErawanaDetailsState extends State<ErawanaDetails> {
  int index;
  RawannaData? rawannaData;
  String sso_id = "";
  String weight_no = "";
  _ErawanaDetailsState(int this.index);
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
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => {
              Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Erawana(false,"","","","","","","")))
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
      body:rawannaData !=null ?  SingleChildScrollView(
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
                    height: 35,
                    padding: EdgeInsets.only(left: 10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Strings.ERawannaNo.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${rawannaData!.data[index].ERawannaNo}',
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
                          '${rawannaData!.data[index].mineralName}',
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
                          '${rawannaData!.data[index].consigneeName}',
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
                          Strings.vechicle,
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${rawannaData!.data[index].vechicle}',
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
                          Strings.unit.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${rawannaData!.data[index].unit}',
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
                          '${rawannaData!.data[index].vechicleRegistration}',
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
                          '${rawannaData!.data[index].driverMobileNo}',
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
                          '${rawannaData!.data[index].driverName}',
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
                          '${rawannaData!.data[index].tareWeight}',
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
                          '${rawannaData!.data[index].grossWeight}',
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
                          '${rawannaData!.data[index].totalWeight}',
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
                          '${rawannaData!.data[index].rawannastatus}',
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
                          Strings.consigngstno.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${rawannaData!.data[index].ConsigneeGSTNo}',
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
                          Strings.TransportDetails.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${rawannaData!.data[index].TransportDetails}',
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
                          Strings.Royaltyamount.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${rawannaData!.data[index].Royaltyamount}',
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
                          Strings.RawannaCount.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${rawannaData!.data[index].RawannaCount}',
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
                          Strings.RawannaDate.toUpperCase(),
                          style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),
                        Text(
                          '${rawannaData!.data[index].RawannaDate}',
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
                          '${rawannaData!.data[index].ConsigneeAddress}', maxLines: 2,
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
