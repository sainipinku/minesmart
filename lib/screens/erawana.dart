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
import 'package:minesmart/screens/details.dart';

class Erawana extends StatefulWidget {
  const Erawana({Key? key}) : super(key: key);

  @override
  _ErawanaState createState() => _ErawanaState();
}

class _ErawanaState extends State<Erawana> {
  RawannaData? rawannaData;
  String sso_id = "";
  String weight_no = "";
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
      body: SafeArea(
        child:rawannaData !=null ? Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.filter_list_alt),
                      onPressed: () {

                      },
                    ),
                    Text(
                      Strings.fillter,
                      style: const TextStyle(
                        color: CentralizeColor.colorBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily:Fonts.ps_default_font_family,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.picture_as_pdf),
                      onPressed: () {

                      },
                    ),
                    Text(
                      Strings.pdf,
                      style: const TextStyle(
                        color: CentralizeColor.colorBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily:Fonts.ps_default_font_family,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.picture_as_pdf),
                      onPressed: () {

                      },
                    ),
                    Text(
                      Strings.excel,
                      style: const TextStyle(
                        color: CentralizeColor.colorBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily:Fonts.ps_default_font_family,
                      ),
                    )
                  ],
                )
              ],
            ),
            Expanded(child: Container(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0,bottom: 10.0),
                child:  ListView.builder(
                    itemCount: rawannaData!.data.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Container(
                            padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) => const Details()));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
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
                                      )),
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 0.5,
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
                                      )),

                                    ],
                                  ),
                                  const Divider(
                                    thickness: 0.5,
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
                                      )),

                                    ],
                                  ),
                                ],
                              ),
                            )

                          // Center(child: Text('Entry ${entries[index]}')),
                        ),
                      )
                        ;
                    }),
              ),
            ))



          ],
        ): SizedBox(),
      )
      ,
    );
  }
}
