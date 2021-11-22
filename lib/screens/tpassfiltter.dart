import 'package:flutter/material.dart';
import 'package:minesmart/Common/Helpers.dart';
import 'package:minesmart/Common/SharedPref.dart';
import 'package:minesmart/Helper/colors.dart';
import 'package:minesmart/Helper/fonts.dart';
import 'package:minesmart/Helper/strings.dart';
import 'package:minesmart/elements/DrawerWidget.dart';
import 'package:minesmart/elements/NoInternetdilogbox.dart';
import 'package:minesmart/model/TPassFiltterModel.dart';
import 'package:intl/intl.dart';
import 'package:minesmart/repository/filtter_repository.dart';
import 'package:minesmart/screens/tpass.dart';
class TpassFiltter extends StatefulWidget {
  const TpassFiltter({Key? key}) : super(key: key);

  @override
  _TpassFiltterState createState() => _TpassFiltterState();
}

class _TpassFiltterState extends State<TpassFiltter> {
  TPassFiltterModel? tPassFiltterModel;
  String sso_id = "";
  String weight_no = "";
  String user_id = "";
  bool filtterType = true;
  String conDropdown = "",tPassNumberDropdown = "",driveNameDropdown= "",vichicleDropdown="",driverMobileDropdown = "";
  int conIndex = 0,tpassnumberIndex = 0,drivenameIndex = 0,vichicleIndex=0,drivemobileIndex=0;
  List <String> conItems = [] ;
  List <String> tpassItems = [] ;
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
    SharedPref.getUserId("user_id").then((value) => setState(() {
      user_id = value.toString();
    }));
    Helpers.verifyInternet().then((intenet) {
      if (intenet != null && intenet) {
        getTpassFiltterData(context,sso_id,weight_no).then((response) {
          setState(() {
            tPassFiltterModel = response;
            for (var i = 0; i < tPassFiltterModel!.data!.table2.length; i++) {
              if(tPassFiltterModel!.data!.table2[i].cONSIGNEENAME != ""){
                conItems.add(tPassFiltterModel!.data!.table2[i].cONSIGNEENAME);
              }

            }
            for (var i = 0; i < tPassFiltterModel!.data!.table4.length; i++) {
              if(tPassFiltterModel!.data!.table4[i].dRIVERMOBILENO != ""){
                drivemobileItems.add(tPassFiltterModel!.data!.table4[i].dRIVERMOBILENO);
              }

            }
            for (var i = 0; i < tPassFiltterModel!.data!.table5.length; i++) {
              if(tPassFiltterModel!.data!.table5[i].dRIVERNAME != ""){
                drivenameItems.add(tPassFiltterModel!.data!.table5[i].dRIVERNAME);
              }

            }
            for (var i = 0; i < tPassFiltterModel!.data!.table6.length; i++) {
              if (tPassFiltterModel!.data!.table6[i].tRANSITPASSNUMBER != "") {
                tpassItems.add(tPassFiltterModel!.data!.table6[i].tRANSITPASSNUMBER);
              }


            }
            for (var i = 0; i < tPassFiltterModel!.data!.table3.length; i++) {
              if(tPassFiltterModel!.data!.table3[i].vECHICLEREGISTRATION != ""){
                vichicleItems.add(tPassFiltterModel!.data!.table3[i].vECHICLEREGISTRATION);
              }

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
  DateTime currentFromDate = DateTime.now();
  DateTime currentToDate = DateTime.now();
  String fromDate = "";
  String toDate = "";
  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentFromDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentFromDate)
      setState(() {
        currentFromDate = pickedDate;
        fromDate = DateFormat("yyyy-MM-dd").format(currentFromDate);
      });
  }
  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentToDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentToDate)
      setState(() {
        currentToDate = pickedDate;
        toDate = DateFormat("yyyy-MM-dd").format(currentToDate);
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
          child: tPassFiltterModel !=null ?  Column(
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TPass(filtterType,conDropdown,driveNameDropdown,driverMobileDropdown,tPassNumberDropdown,vichicleDropdown,fromDate,toDate)));
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
                    onSaved: (input) => tPassNumberDropdown = input!,
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
                      "Select Transit Pass Number",
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
                        tPassNumberDropdown = data!;
                        tpassnumberIndex = tpassItems.indexOf(data);
                      });
                    },
                    items: tpassItems.map<DropdownMenuItem<String>>((String value) {
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
                      "Select Consignee Name",
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
                      "Select Driver Name",
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
                      "Select Driver Mobile No",
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
              Container(
                margin: const EdgeInsets.only(left: 10.0,right: 10.0,top: 20.0),
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                height: 55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: CentralizeColor.colorlogodark,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      fromDate == "" ?"From Date":fromDate.toString(),
                      style: const TextStyle(
                        color: CentralizeColor.colorWhite,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily:Fonts.ps_default_font_family,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.calendar_today,color: Colors.white,),
                      onPressed: () {
                        _selectFromDate(context);
                      },

                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0,right: 10.0,top: 20.0),
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                height: 55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: CentralizeColor.colorlogodark,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      toDate == "" ? "To Date":toDate.toString(),
                      style: const TextStyle(
                        color: CentralizeColor.colorWhite,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily:Fonts.ps_default_font_family,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.calendar_today,color: Colors.white,),
                      onPressed: () {
                        _selectToDate(context);
                      },

                    )
                  ],
                ),
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
