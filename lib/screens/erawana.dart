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
import 'package:minesmart/screens/erawanadetails.dart';
import 'package:minesmart/screens/erawanafillter.dart';

class Erawana extends StatefulWidget {
  bool filtterType = false;
  String conDropdown = "",
      eRawannaNoDropdown = "",
      driveNameDropdown = "",
      vichicleDropdown = "",
      driverMobileDropdown = "",
      fromdate = "",
      todate = "";

  Erawana(this.filtterType, this.conDropdown, this.driveNameDropdown,
      this.driverMobileDropdown, this.eRawannaNoDropdown, this.vichicleDropdown,this.fromdate,this.todate)
      : super();

  @override
  _ErawanaState createState() => _ErawanaState(
      filtterType,
      conDropdown,
      driveNameDropdown,
      driverMobileDropdown,
      eRawannaNoDropdown,
      vichicleDropdown,fromdate,todate);
}

class _ErawanaState extends State<Erawana> {
  RawannaData? rawannaData;
  String sso_id = "";
  String weight_no = "";
  String user_id = "";
  bool filtterType = false;
  String conDropdown = "",
      eRawannaNoDropdown = "",
      driveNameDropdown = "",
      vichicleDropdown = "",
      driverMobileDropdown = "",
      fromdate = "",
      todate = "";

  _ErawanaState(
      this.filtterType,
      this.conDropdown,
      this.driveNameDropdown,
      this.driverMobileDropdown,
      this.eRawannaNoDropdown,
      this.vichicleDropdown,
      this.fromdate,
      this.todate);

  @override
  void initState() {
    super.initState();
    SharedPref.getSsoId("sso_id").then((value) => setState(() {
          sso_id = value;
          print(sso_id);
        }));
    SharedPref.getWeighBridgeNo("weigh_bridge_no").then((value) => setState(() {
          weight_no = value;
          print(weight_no);
        }));
    SharedPref.getUserId("user_id").then((value) => setState(() {
          user_id = value.toString();
          print(user_id);
        }));
    Helpers.verifyInternet().then((intenet) {
      if (intenet != null && intenet) {
        if (filtterType == true) {
          getRawannaFillterData(
                  context,
                  sso_id,
                  weight_no,
                  user_id,
                  "",
                  conDropdown,
                  vichicleDropdown,
                  driverMobileDropdown,
                  driveNameDropdown,
                  "",
                  eRawannaNoDropdown,
                   fromdate,
                   todate)
              .then((response) {
            setState(() {
              rawannaData = response;
            });
          });
        } else {
          getRawannaData(context, sso_id, weight_no).then((response) {
            setState(() {
              rawannaData = response;
            });
          });
        }
      } else {
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
        actions: [],
      ),
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: rawannaData != null
            ? Container(
                child: rawannaData!.data.isNotEmpty
                    ? Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ErawanaFillter()));
                                },
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.filter_list_alt),
                                      onPressed: () {},
                                    ),
                                    Text(
                                      Strings.fillter,
                                      style: const TextStyle(
                                        color: CentralizeColor.colorBlack,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily:
                                            Fonts.ps_default_font_family,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.picture_as_pdf),
                                      onPressed: () {},
                                    ),
                                    Text(
                                      Strings.pdf,
                                      style: const TextStyle(
                                        color: CentralizeColor.colorBlack,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily:
                                            Fonts.ps_default_font_family,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.picture_as_pdf),
                                      onPressed: () {},
                                    ),
                                    Text(
                                      Strings.excel,
                                      style: const TextStyle(
                                        color: CentralizeColor.colorBlack,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily:
                                            Fonts.ps_default_font_family,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Expanded(
                              child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: ListView.builder(
                                  itemCount: rawannaData!.data.length,
                                  shrinkWrap: true,
                                  primary: false,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                      elevation: 5,
                                      margin: EdgeInsets.fromLTRB(
                                          5.0, 5.0, 5.0, 5.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              top: 10.0, bottom: 10.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ErawanaDetails(index)));
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        child: Container(
                                                      height: 30,
                                                      alignment:
                                                          Alignment.center,
                                                      padding: EdgeInsets.only(
                                                          left: 10.0),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Image.asset(
                                                            "assets/images/truck_img.png",
                                                            height: 50,
                                                            width: 50,
                                                            fit: BoxFit.fill,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                Helpers.rawanadate(rawannaData!.data[index].RawannaDate),
                                                                style:
                                                                const TextStyle(
                                                                  color:
                                                                  CentralizeColor
                                                                      .colorBlack,
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                                  fontFamily: Fonts
                                                                      .ps_default_font_family,
                                                                ),
                                                              ),
                                                              Text(
                                                                Helpers.rawanatime(rawannaData!.data[index].RawannaDate),
                                                                style:
                                                                const TextStyle(
                                                                  color:
                                                                  CentralizeColor
                                                                      .colorBlack,
                                                                  fontSize: 8,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                                  fontFamily: Fonts
                                                                      .ps_default_font_family,
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                          ,
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        10.0),
                                                            child: Text(
                                                              '${rawannaData!.data[index].ERawannaNo}',
                                                              style:
                                                                  const TextStyle(
                                                                color: CentralizeColor
                                                                    .colorBlack,
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFamily: Fonts
                                                                    .ps_default_font_family,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )),
                                                  ],
                                                ),
                                                const Divider(
                                                  thickness: 0.1,
                                                  color: CentralizeColor
                                                      .colorBlack,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            Strings
                                                                .consigneename.toUpperCase(),
                                                            style:
                                                                const TextStyle(
                                                              color: CentralizeColor
                                                                  .colorsdrakgray,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily: Fonts
                                                                  .ps_default_font_family,
                                                            ),
                                                          ),
                                                          Text(
                                                            '${rawannaData!.data[index].consigneeName}',
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  CentralizeColor
                                                                      .colorBlack,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily: Fonts
                                                                  .ps_default_font_family,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 5.0),
                                                            child: Text(
                                                              Strings
                                                                  .totalweight.toUpperCase(),
                                                              style:
                                                                  const TextStyle(
                                                                color: CentralizeColor
                                                                    .colorsdrakgray,
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFamily: Fonts
                                                                    .ps_default_font_family,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '${rawannaData!.data[index].totalWeight}',
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  CentralizeColor
                                                                      .colorBlack,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily: Fonts
                                                                  .ps_default_font_family,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 5.0),
                                                            child: Text(
                                                              Strings
                                                                  .mineralname.toUpperCase(),
                                                              style:
                                                                  const TextStyle(
                                                                color: CentralizeColor
                                                                    .colorsdrakgray,
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFamily: Fonts
                                                                    .ps_default_font_family,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '${rawannaData!.data[index].mineralName}',
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  CentralizeColor
                                                                      .colorBlack,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily: Fonts
                                                                  .ps_default_font_family,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          right: 10.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            Strings.vechicle.toUpperCase(),
                                                            style:
                                                                const TextStyle(
                                                              color: CentralizeColor
                                                                  .colorsdrakgray,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily: Fonts
                                                                  .ps_default_font_family,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 5.0),
                                                            child: Text(
                                                              '${rawannaData!.data[index].driverName}',
                                                              style:
                                                                  const TextStyle(
                                                                color: CentralizeColor
                                                                    .colorBlack,
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFamily: Fonts
                                                                    .ps_default_font_family,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 5.0),
                                                            child: Text(
                                                              '${rawannaData!.data[index].vechicle}',
                                                              style:
                                                                  const TextStyle(
                                                                color: CentralizeColor
                                                                    .colorBlack,
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFamily: Fonts
                                                                    .ps_default_font_family,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 5.0),
                                                            child: Text(
                                                              '${rawannaData!.data[index].driverMobileNo}',
                                                              style:
                                                                  const TextStyle(
                                                                color: CentralizeColor
                                                                    .colorBlack,
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFamily: Fonts
                                                                    .ps_default_font_family,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                                /*Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: Container(
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
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:Fonts.ps_default_font_family,
                                                ),
                                              ),
                                              Padding(padding: EdgeInsets.only(left: 5.0),
                                                child: Text(
                                                  '${rawannaData!.data[index].consigneeName}',
                                                  style: const TextStyle(
                                                    color: CentralizeColor.colorBlack,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:Fonts.ps_default_font_family,
                                                  ),
                                                ),)

                                            ],
                                          ),
                                        )),

                                      ],
                                    ),
                                    const Divider(
                                      thickness: 0.1,
                                      color: CentralizeColor.colorBlack,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: Container(
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
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:Fonts.ps_default_font_family,
                                                ),
                                              ),
                                              Padding(padding: EdgeInsets.only(left: 5.0),
                                                child: Text(
                                                  '${rawannaData!.data[index].driverName}',
                                                  style: const TextStyle(
                                                    color: CentralizeColor.colorBlack,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:Fonts.ps_default_font_family,
                                                  ),
                                                ),)

                                            ],
                                          ),
                                        ),

                                        ),
                                        Expanded(child: Container(
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
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:Fonts.ps_default_font_family,
                                                ),
                                              ),
                                              Padding(padding: EdgeInsets.only(left: 5.0),
                                                child: Text(
                                                  '${rawannaData!.data[index].vechicle}',
                                                  style: const TextStyle(
                                                    color: CentralizeColor.colorBlack,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:Fonts.ps_default_font_family,
                                                  ),
                                                ),)

                                            ],
                                          ),
                                        )),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 0.1,
                                      color: CentralizeColor.colorBlack,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: Container(
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
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:Fonts.ps_default_font_family,
                                                ),
                                              ),
                                              Padding(padding: EdgeInsets.only(left: 5.0),
                                                child: Text(
                                                  '${rawannaData!.data[index].driverMobileNo}',
                                                  style: const TextStyle(
                                                    color: CentralizeColor.colorBlack,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:Fonts.ps_default_font_family,
                                                  ),
                                                ),)

                                            ],
                                          ),
                                        ),

                                        ),
                                        Expanded(child: Container(
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
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:Fonts.ps_default_font_family,
                                                ),
                                              ),
                                              Padding(padding: EdgeInsets.only(left: 5.0),
                                                child: Text(
                                                  '${rawannaData!.data[index].totalWeight}',
                                                  style: const TextStyle(
                                                    color: CentralizeColor.colorBlack,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:Fonts.ps_default_font_family,
                                                  ),
                                                ),)

                                            ],
                                          ),
                                        )),
                                      ],
                                    ),*/
                                              ],
                                            ),
                                          )

                                          // Center(child: Text('Entry ${entries[index]}')),
                                          ),
                                    );
                                  }),
                            ),
                          ))
                        ],
                      )
                    : const Center(
                        child: Text(
                          "Record Not Found",
                          style: TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: Fonts.ps_default_font_family,
                          ),
                        ),
                      ),
              )
            : const SizedBox(),
      ),
    );
  }
}
