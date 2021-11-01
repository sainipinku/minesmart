import 'package:flutter/material.dart';
import 'package:minesmart/Helper/colors.dart';
import 'package:minesmart/Helper/fonts.dart';

class NoInternetdilogbox extends StatefulWidget {


  @override
  _NoInternetdilogboxState createState() => _NoInternetdilogboxState();
}

class _NoInternetdilogboxState extends State<NoInternetdilogbox> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 40));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              //margin: EdgeInsets.all(20.0),
              height: 300.0,
              width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      //borderRadius: BorderRadius.circular(10.0)
                  )

              ),
              child:
                  Container(
                    margin: EdgeInsets.all(15.0),
                  decoration: ShapeDecoration(
                        color: Colors.white,
                        shadows: [BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                        ),],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        )

                    ),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Image(
                            image: AssetImage('assets/images/no_internet_image.png'),
                            width: 150,
                            height: 100,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(5),
                          child:  Align(
                            alignment: Alignment.center,
                            child: Text(
                              "No Internet",
                              style: TextStyle(
                                  color:Colors.black,
                                  fontSize: 24,
                                  fontFamily: Fonts.ps_default_font_family,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(5),
                          child:  Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Please check your connection status and try again",
                              style: TextStyle(
                                  color:Colors.black,
                                  fontSize: 15,
                                  fontFamily: Fonts.ps_default_font_family,
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context, true);
                                },
                                child:
                                Padding(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width/1.5,
                                    height: 50,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        gradient:
                                        LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.topRight,
                                            colors: [Color(0xff0000ff), Color(0xFF448AFF)]),

                                        shape: BoxShape.rectangle,
                                        color: CentralizeColor.coloryellow,
                                        borderRadius: BorderRadius.circular(7.0)
                                    ),
                                    child:  Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "CLOSE",
                                        style: TextStyle(
                                            color: CentralizeColor.colorWhite,
                                            fontSize: 15,
                                            fontFamily: Fonts.ps_default_font_family
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        )

                      ],
                    ),
                  )


        ),
        ),
      ),
    );
  }
}
