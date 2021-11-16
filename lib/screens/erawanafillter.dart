import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minesmart/Common/Helpers.dart';
import 'package:minesmart/Common/SharedPref.dart';
import 'package:minesmart/Helper/colors.dart';
import 'package:minesmart/Helper/fonts.dart';
import 'package:minesmart/Helper/strings.dart';
import 'package:minesmart/elements/DrawerWidget.dart';
import 'package:minesmart/elements/NoInternetdilogbox.dart';
import 'package:minesmart/model/FiltterModel.dart';
import 'package:minesmart/model/RawannaData.dart';
import 'package:minesmart/repository/filtter_repository.dart';
import 'package:minesmart/repository/rawanna_repository.dart';

class ErawanaFillter extends StatefulWidget {
  const ErawanaFillter({Key? key}) : super(key: key);

  @override
  _ErawanaFillterState createState() => _ErawanaFillterState();
}

class _ErawanaFillterState extends State<ErawanaFillter> {
  FiltterModel? filtterModel;
  String sso_id = "";
  String weight_no = "";
  String conDropdown = "",eRawannaNoDropdown = "",driveNameDropdown= "",vichicleDropdown="",driverMobileDropdown = "";
  int conIndex = 0,erawannaIndex = 0,drivenameIndex = 0,vichicleIndex=0,drivemobileIndex=0;
  List <String> conItems = [] ;
  List <String> erawannaItems = [] ;
  List <String> drivenameItems = [] ;
  List <String> vichicleItems = [] ;
  List <String> drivemobileItems = [] ;
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
        getFiltterData(context,sso_id,weight_no).then((response) {
          setState(() {
            filtterModel = response;
            for (var i = 0; i < filtterModel!.data!.table1.length; i++) {
              conItems.add(filtterModel!.data!.table1[i].cONSIGNEENAME);
            }
            for (var i = 0; i < filtterModel!.data!.table3.length; i++) {
              drivemobileItems.add(filtterModel!.data!.table3[i].dRIVERMOBILENO);
            }
            for (var i = 0; i < filtterModel!.data!.table4.length; i++) {
              drivenameItems.add(filtterModel!.data!.table4[i].dRIVERNAME);
            }
            for (var i = 0; i < filtterModel!.data!.table5.length; i++) {
              erawannaItems.add(filtterModel!.data!.table5[i].eRAWANNANO);
            }
            for (var i = 0; i < filtterModel!.data!.table2.length; i++) {
              vichicleItems.add(filtterModel!.data!.table2[i].vECHICLEREGISTRATION);
            }

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
      body: SafeArea(
        child: Container(
          child: filtterModel !=null ?  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                margin: const EdgeInsets.only(left: 5.0,right: 5.0,top: 20.0),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: CentralizeColor.colorlogodark,
                    onPrimary:
                    Colors.white, // foreground
                  ),
                  onPressed: () {
                  },
                  child: Text(
                    Strings.applyfilter,
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
                margin: const EdgeInsets.only(left: 10.0,right: 10.0,top: 20.0),
                child:
                Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: CentralizeColor.colorlogodark,
                  ),
                  child:
                  DropdownButtonFormField<String>(
                    iconEnabledColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    onSaved: (input) => eRawannaNoDropdown = input!,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: CentralizeColor.colorlogodark,
                      // labelText: "First name",
                      labelStyle: const TextStyle(color:  Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.white30.withOpacity(0.5)),

                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.white30),
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),

                    hint: const Text(
                      "Select ErawannaNo",
                      style:  TextStyle(
                          fontSize: 15,
                          fontFamily: Fonts.ps_default_font_family,
                          color: CentralizeColor.colorWhite
                      ),

                    ),
                    // value:conItems.length== 0 ?null : conItems[conIndex],
                    isExpanded: true,
                    onChanged: (String? data) {
                      setState(() {
                        eRawannaNoDropdown = data!;
                        erawannaIndex = erawannaItems.indexOf(data);
                      });
                    },
                    items: erawannaItems.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style:  const TextStyle(
                                fontSize: 15,
                                fontFamily: Fonts.ps_default_font_family,
                                color: CentralizeColor.colorWhite
                            )),
                      );
                    }).toList(),
                  ),
                ),
                height: 55,
                width: MediaQuery.of(context).size.width,

              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0,right: 10.0,top: 20.0),
                child:
                Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: CentralizeColor.colorlogodark,
                  ),
                  child:
                  DropdownButtonFormField<String>(
                    iconEnabledColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    onSaved: (input) => conDropdown = input!,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: CentralizeColor.colorlogodark,
                      // labelText: "First name",
                      labelStyle: const TextStyle(color:  Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.white30.withOpacity(0.5)),

                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.white30),
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),

                    hint: const Text(
                      "Select ConsigneeName",
                      style:  TextStyle(
                          fontSize: 15,
                          fontFamily: Fonts.ps_default_font_family,
                          color: CentralizeColor.colorWhite
                      ),

                    ),
                   // value:conItems.length== 0 ?null : conItems[conIndex],
                    isExpanded: true,
                    onChanged: (String? data) {
                      setState(() {
                        conDropdown = data!;
                        conIndex = conItems.indexOf(data);
                      });
                    },
                    items: conItems.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style:  const TextStyle(
                                fontSize: 15,
                                fontFamily: Fonts.ps_default_font_family,
                                color: CentralizeColor.colorWhite
                            )),
                      );
                    }).toList(),
                  ),
                ),
                height: 55,
                width: MediaQuery.of(context).size.width,

              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0,right: 10.0,top: 20.0),
                child:
                Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: CentralizeColor.colorlogodark,
                  ),
                  child:
                  DropdownButtonFormField<String>(
                    iconEnabledColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    onSaved: (input) => driveNameDropdown = input!,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: CentralizeColor.colorlogodark,
                      // labelText: "First name",
                      labelStyle: const TextStyle(color:  Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.white30.withOpacity(0.5)),

                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.white30),
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),

                    hint: const Text(
                      "Select DriverName",
                      style:  TextStyle(
                          fontSize: 15,
                          fontFamily: Fonts.ps_default_font_family,
                          color: CentralizeColor.colorWhite
                      ),

                    ),
                    // value:conItems.length== 0 ?null : conItems[conIndex],
                    isExpanded: true,
                    onChanged: (String? data) {
                      setState(() {
                        driveNameDropdown = data!;
                        drivenameIndex = drivenameItems.indexOf(data);
                      });
                    },
                    items: drivenameItems.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style:  const TextStyle(
                                fontSize: 15,
                                fontFamily: Fonts.ps_default_font_family,
                                color: CentralizeColor.colorWhite
                            )),
                      );
                    }).toList(),
                  ),
                ),
                height: 55,
                width: MediaQuery.of(context).size.width,

              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0,right: 10.0,top: 20.0),
                child:
                Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: CentralizeColor.colorlogodark,
                  ),
                  child:
                  DropdownButtonFormField<String>(
                    iconEnabledColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    onSaved: (input) => vichicleDropdown = input!,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: CentralizeColor.colorlogodark,
                      // labelText: "First name",
                      labelStyle: const TextStyle(color:  Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.white30.withOpacity(0.5)),

                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.white30),
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),

                    hint: const Text(
                      "Select Vehicle",
                      style:  TextStyle(
                          fontSize: 15,
                          fontFamily: Fonts.ps_default_font_family,
                          color: CentralizeColor.colorWhite
                      ),

                    ),
                    // value:conItems.length== 0 ?null : conItems[conIndex],
                    isExpanded: true,
                    onChanged: (String? data) {
                      setState(() {
                        vichicleDropdown = data!;
                        vichicleIndex = vichicleItems.indexOf(data);
                      });
                    },
                    items: vichicleItems.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style:  const TextStyle(
                                fontSize: 15,
                                fontFamily: Fonts.ps_default_font_family,
                                color: CentralizeColor.colorWhite
                            )),
                      );
                    }).toList(),
                  ),
                ),
                height: 55,
                width: MediaQuery.of(context).size.width,

              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0,right: 10.0,top: 20.0),
                child:
                Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: CentralizeColor.colorlogodark,
                  ),
                  child:
                  DropdownButtonFormField<String>(
                    iconEnabledColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    onSaved: (input) => driverMobileDropdown = input!,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: CentralizeColor.colorlogodark,
                      // labelText: "First name",
                      labelStyle: const TextStyle(color:  Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.white30.withOpacity(0.5)),

                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.white30),
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),

                    hint: const Text(
                      "Select DriverMobileNo",
                      style:  TextStyle(
                          fontSize: 15,
                          fontFamily: Fonts.ps_default_font_family,
                          color: CentralizeColor.colorWhite
                      ),

                    ),
                    // value:conItems.length== 0 ?null : conItems[conIndex],
                    isExpanded: true,
                    onChanged: (String? data) {
                      setState(() {
                        driverMobileDropdown = data!;
                        drivemobileIndex = drivemobileItems.indexOf(data);
                      });
                    },
                    items: drivemobileItems.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style:  const TextStyle(
                                fontSize: 15,
                                fontFamily: Fonts.ps_default_font_family,
                                color: CentralizeColor.colorWhite
                            )),
                      );
                    }).toList(),
                  ),
                ),
                height: 55,
                width: MediaQuery.of(context).size.width,

              ),
            ],
          ): const Center(
            child: SizedBox(),
          ),
        )
        ,
      ),
    );
  }
}
