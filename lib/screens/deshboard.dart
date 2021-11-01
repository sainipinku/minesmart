import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:minesmart/Helper/colors.dart';
import 'package:minesmart/Helper/fonts.dart';
import 'package:minesmart/Helper/strings.dart';
import 'package:minesmart/elements/DrawerWidget.dart';
import 'package:pie_chart/pie_chart.dart';
class DeshBoard extends StatefulWidget {
  const DeshBoard({Key? key}) : super(key: key);

  @override
  _DeshBoardState createState() => _DeshBoardState();
}

class _DeshBoardState extends State<DeshBoard> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  DateTime currentBackPressTime = DateTime.now();
  Map<String, double> dataMap = Map();
 /* Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };*/
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];
  String dropdownValue = 'Choose Company Name';

  List <String> spinnerItems = [
    'Choose Company Name',
    'Price Too High',
    'Buying From Other Places',
    'Order by Mistake',
    'Information Not Complete',
    'Delay in Shipping',
    'Support Not Perfect',
    'Other',
  ] ;
  String dropdown = 'Day';
  List <String> Items = [
    'Day',
    'Week',
    'Month',
  ] ;

  void changeGraph() {
    dataMap.putIfAbsent("Flutter", () => 5);
    dataMap.putIfAbsent("React", () => 3);
    dataMap.putIfAbsent("Xamarin", () => 2);
    dataMap.putIfAbsent("Ionic", () => 2);
  }

  void initState() {
    super.initState();
    changeGraph();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
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
      body: WillPopScope(
          child:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          Strings.companyname,
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        //hint:  const Text("Choose Company Name"),
                        value: dropdownValue,
                        isExpanded: false,
                        //icon: const Visibility (visible:false, child: Icon(Icons.arrow_downward)),
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(
                            color: CentralizeColor.colorsdrakgray,
                            fontSize: 15,
                            fontFamily: Fonts.ps_default_font_family),
                        onChanged: (String? data) {
                          setState(() {
                            dropdownValue = data!;
                          });
                        },
                        items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 10.0,right: 10.0),
                  child: Center(
                      child: Image.asset(
                        "assets/images/mines_img.jpg",
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width, fit: BoxFit.fill,),
                ),
                ),
                SizedBox(
                  height: 20,
                ),
                PieChart(
                  dataMap: dataMap,
                  animationDuration: Duration(milliseconds: 800),
                  chartLegendSpacing: 72,
                  chartRadius: MediaQuery.of(context).size.width / 2.5,
                  colorList: colorList,
                  initialAngleInDegree: 0,
                  chartType: ChartType.disc,
                  ringStrokeWidth: 32,
                  //centerText: "HYBRID",
                  legendOptions: const LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.right,
                    showLegends: true,
                    legendShape: BoxShape.rectangle,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: true,
                    showChartValues: true,
                    showChartValuesInPercentage: true,
                    showChartValuesOutside: false,
                    decimalPlaces: 1,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                /*Container(
                  height: 50,
                  padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0,bottom: 5.0),
                  margin: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    // color: CentralizeColor.colorgray,
                    border: Border.all(
                        width: 0.5, color: CentralizeColor.colorsdrakgray),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.white,
                      value: dropdown,
                      hint:  const Text("Day"),
                      isExpanded: true,
                      //icon: const Visibility (visible:false, child: Icon(Icons.arrow_downward)),
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(
                          color: CentralizeColor.colorsdrakgray,
                          fontSize: 15,
                          fontFamily: Fonts.ps_default_font_family),
                      onChanged: (String? data) {
                        setState(() {
                          dropdown = data!;
                        });
                      },
                      items: Items.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )
                  ,
                ),*/
                Container(
                  margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                  child:
                  Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: CentralizeColor.colorlogodark,
                    ),
                    child:
                    DropdownButtonFormField<String>(
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.white,
                      onSaved: (input) => dropdown = input!,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CentralizeColor.colorlogodark,
                        // labelText: "First name",
                        labelStyle: TextStyle(color:  Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
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
                        "Day",
                        style:  TextStyle(
                            fontSize: 15,
                            fontFamily: Fonts.ps_default_font_family,
                            color: CentralizeColor.colorWhite
                        ),

                      ),
                      value:dropdown,
                      isExpanded: true,
                      onChanged: (String? data) {
                        setState(() {
                          dropdown = data!;
                        });
                      },
                      items: Items.map<DropdownMenuItem<String>>((String value) {
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                        child: Text(
                          Strings.erawana,
                          style: const TextStyle(
                            color: CentralizeColor.colorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily:Fonts.ps_default_font_family,
                          ),
                        ),),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 60,
                            width: 80,
                            alignment: Alignment.center,
                           /* decoration: const BoxDecoration(
                              color: CentralizeColor.colorlogodark,
                              shape: BoxShape.circle,
                            ),*/
                            child: const Text(
                              "2000",
                              style: TextStyle(
                                color: CentralizeColor.colorBlack,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily:Fonts.ps_default_font_family,
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                          child: Text(
                            Strings.tpass,
                            style: const TextStyle(
                              color: CentralizeColor.colorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily:Fonts.ps_default_font_family,
                            ),
                          ),),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 60,
                            width: 80,
                            alignment: Alignment.center,
                            /* decoration: const BoxDecoration(
                              color: CentralizeColor.colorlogodark,
                              shape: BoxShape.circle,
                            ),*/
                            child: const Text(
                              "2000",
                              style: TextStyle(
                                color: CentralizeColor.colorBlack,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily:Fonts.ps_default_font_family,
                              ),
                            ),
                          ),
                        )
                        /*Container(
                          height: 60,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: CentralizeColor.colorlogodark,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "2000",
                            style: const TextStyle(
                              color: CentralizeColor.colorWhite,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily:Fonts.ps_default_font_family,
                            ),
                          ),
                        )*/
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                          child: Text(
                            Strings.weightslip,
                            style: const TextStyle(
                              color: CentralizeColor.colorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily:Fonts.ps_default_font_family,
                            ),
                          ),),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 60,
                            width: 80,
                            alignment: Alignment.center,
                            /* decoration: const BoxDecoration(
                              color: CentralizeColor.colorlogodark,
                              shape: BoxShape.circle,
                            ),*/
                            child: Text(
                              "2000",
                              style: const TextStyle(
                                color: CentralizeColor.colorBlack,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily:Fonts.ps_default_font_family,
                              ),
                            ),
                          ),
                        )
                        /*Container(
                          height: 60,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: CentralizeColor.colorlogodark,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "2000",
                            style: const TextStyle(
                              color: CentralizeColor.colorWhite,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily:Fonts.ps_default_font_family,
                            ),
                          ),
                        )*/
                      ],
                    )
                  ],
                )
              ],
            ),
          ) , onWillPop: onWillPop),
    );
  }
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (_globalKey.currentState!.isDrawerOpen) {
      Navigator.pop(context);
      return Future.value(false);
    }
    else{
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime) > Duration(seconds: 2)) {

        currentBackPressTime = now;
        Fluttertoast.showToast(msg: Strings.leave);
        return Future.value(false);
      }
    }
    return Future.value(true);
  }
}
