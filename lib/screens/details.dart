import 'package:flutter/material.dart';
import 'package:minesmart/Helper/colors.dart';
import 'package:minesmart/Helper/fonts.dart';
import 'package:minesmart/elements/DrawerWidget.dart';
class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0,bottom: 10.0),
            child: ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => const Details()));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                // color: CentralizeColor.colorgray,
                                border: Border.all(
                                    width: 0.5, color: CentralizeColor.colorsdrakgray),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Detal1 :",
                                    style: TextStyle(
                                      color: CentralizeColor.colorBlack,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      fontFamily:Fonts.ps_default_font_family,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Detal1 list is ",
                                    style: TextStyle(
                                      color: CentralizeColor.colorBlack,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      fontFamily:Fonts.ps_default_font_family,
                                    ),
                                  ),)

                                ],
                              ),
                            )
                            ,
                          ],
                        ),
                      )

                    // Center(child: Text('Entry ${entries[index]}')),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
