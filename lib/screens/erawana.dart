import 'package:flutter/material.dart';
import 'package:minesmart/Helper/colors.dart';
import 'package:minesmart/Helper/fonts.dart';
import 'package:minesmart/Helper/strings.dart';
import 'package:minesmart/elements/DrawerWidget.dart';
import 'package:minesmart/screens/details.dart';

class Erawana extends StatefulWidget {
  const Erawana({Key? key}) : super(key: key);

  @override
  _ErawanaState createState() => _ErawanaState();
}

class _ErawanaState extends State<Erawana> {
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
        child: Column(
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
                child: ListView.builder(
                    itemCount: 10,
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
                                        child: const Text(
                                          "Detal1",
                                          style: TextStyle(
                                            color: CentralizeColor.colorBlack,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            fontFamily:Fonts.ps_default_font_family,
                                          ),
                                        ),
                                      ),

                                      ),
                                      Expanded(child: Container(
                                        height: 30,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Detal2",
                                          style: TextStyle(
                                            color: CentralizeColor.colorBlack,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            fontFamily:Fonts.ps_default_font_family,
                                          ),
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
                                        child: const Text(
                                          "Detal3",
                                          style: TextStyle(
                                            color: CentralizeColor.colorBlack,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            fontFamily:Fonts.ps_default_font_family,
                                          ),
                                        ),
                                      )),
                                      Expanded(child: Container(
                                        height: 30,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Detal4",
                                          style: TextStyle(
                                            color: CentralizeColor.colorBlack,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            fontFamily:Fonts.ps_default_font_family,
                                          ),
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
                                        child: const Text(
                                          "Detal5",
                                          style: TextStyle(
                                            color: CentralizeColor.colorBlack,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            fontFamily:Fonts.ps_default_font_family,
                                          ),
                                        ),
                                      )),
                                      Expanded(child: Container(
                                        height: 30,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Detal6",
                                          style: TextStyle(
                                            color: CentralizeColor.colorBlack,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            fontFamily:Fonts.ps_default_font_family,
                                          ),
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
        ),
      )
      ,
    );
  }
}
