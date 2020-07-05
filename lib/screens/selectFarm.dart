import 'package:flutter/material.dart';
import '../helpers/curvePainter.dart';
import '../helpers/colorGradient.dart';

class SelectFarm extends StatefulWidget {
  @override
  _SelectFarmState createState() => _SelectFarmState();
}

class _SelectFarmState extends State<SelectFarm> {
  List selected = ['y', 'n', 'n', 'n', 'n'];
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
                  Container(
                    child: GestureDetector(
                      child: Icon(
                        Icons.arrow_forward,
                        size: 70.0,
                        color: Colors.cyan,
                      ),
                      // TODO: Navigate to next Page
                      onTap: () {},
                    ),
                  ),
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
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color:
                          selected[0] == 'y' ? Colors.cyan : Color(0xFFF1728F),
                      onPressed: () {
                        setState(() {
                          selected = List<String>.generate(6, (index) => "n");
                          selected[0] = 'y';
                        });
                      },
                      child: Text(
                        "1. Brahmanvel Farm, Dhule, Maharashtra",
                        style: TextStyle(
                          fontSize: 23.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Container(
                    width: width,
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color:
                          selected[1] == 'y' ? Colors.cyan : Color(0xFFF1728F),
                      onPressed: () {
                        setState(() {
                          selected = List<String>.generate(6, (index) => "n");
                          selected[1] = 'y';
                        });
                      },
                      child: Text(
                        "2. Dhalgaon Farm, Sangli, Maharashtra",
                        style: TextStyle(
                          fontSize: 23.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Container(
                    width: width,
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color:
                          selected[2] == 'y' ? Colors.cyan : Color(0xFFF1728F),
                      onPressed: () {
                        setState(() {
                          selected = List<String>.generate(6, (index) => "n");
                          selected[2] = 'y';
                        });
                      },
                      child: Text(
                        "3. Jaisalmer Farm, Jaisalmer, Rajasthan",
                        style: TextStyle(
                          fontSize: 23.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Container(
                    width: width,
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color:
                          selected[3] == 'y' ? Colors.cyan : Color(0xFFF1728F),
                      onPressed: () {
                        setState(() {
                          selected = List<String>.generate(6, (index) => "n");
                          selected[3] = 'y';
                        });
                      },
                      child: Text(
                        "4. Muppandal Farm, Kanyakumari, Tamil Nadu",
                        style: TextStyle(
                          fontSize: 23.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Container(
                    width: width,
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color:
                          selected[4] == 'y' ? Colors.cyan : Color(0xFFF1728F),
                      onPressed: () {
                        setState(() {
                          selected = List<String>.generate(6, (index) => "n");
                          selected[4] = 'y';
                        });
                      },
                      child: Text(
                        "5. Satara Farm, Satara, Maharashtra",
                        style: TextStyle(
                          fontSize: 23.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
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
