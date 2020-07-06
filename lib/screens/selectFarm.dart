import 'package:flutter/material.dart';
import '../helpers/curvePainter.dart';
import '../helpers/colorGradient.dart';
import '../helpers/fetchedjsondata.dart';
import 'farmDetails.dart';
import 'jsonDataScreen.dart';

class SelectFarm extends StatefulWidget {
  @override
  _SelectFarmState createState() => _SelectFarmState();
}

class _SelectFarmState extends State<SelectFarm> {
  int currentSelection = 0;
  List<String> farmName = [
    '1. Brahmanvel Farm, Dhule, Maharashtra',
    '2. Dhalgaon Farm, Sangli, Maharashtra',
    '3. Jaisalmer Farm, Jaisalmer, Rajasthan',
    '4. Muppandal Farm, Kanyakumari, Tamil Nadu',
    '5. Satara Farm, Satara, Maharashtra',
  ];

  navigate() {
    isLoaded
        ? Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FarmDetails(this.currentSelection),
            ),
          )
        : Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JsonDataScreen(
                "selectTheWindFarm",
                this.currentSelection,
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        CustomPaint(
          painter: CurvePainter(),
          size: Size.infinite,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 10.0),
              margin: EdgeInsets.only(top: height / 6),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  Container(
                    child: Text(
                      "Select the wind \n         farm",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = linearGradient,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  Container(
                    width: width,
                    height: (120.0 * 5) + (20 * 3),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: farmName.length,
                      itemBuilder: (context, i) => Container(
                        padding: EdgeInsets.only(bottom: 20.0),
                        height: 120.0,
                        width: width,
                        child: RaisedButton(
                          splashColor: Colors.cyan,
                          highlightColor: Colors.cyan,
                          elevation: 10.0,
                          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Color(0xFFF1728F),
                          onPressed: () {
                            setState(() {
                              this.currentSelection = i;
                              navigate();
                            });
                          },
                          child: Text(
                            "${farmName[i]}",
                            style: TextStyle(
                              fontSize: 23.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.cyan,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
