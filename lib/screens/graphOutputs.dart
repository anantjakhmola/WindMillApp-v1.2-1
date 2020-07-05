import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../helpers/curvePainter.dart';
import '../helpers/colorGradient.dart';
import 'jsonDataScreen.dart';
import 'farmDetails.dart';

class GraphOutputs extends StatefulWidget {
  @override
  _GraphOutputsState createState() => _GraphOutputsState();
}

class _GraphOutputsState extends State<GraphOutputs> {
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
          body: Container(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 10.0),
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: height / 4.5),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Output of multiple farms",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = linearGradient,
                      ),
                      textScaleFactor: 1.5,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  Text(
                    "1. Brahmanvel Farm",
                    style: TextStyle(
                      fontSize: 23.0,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    height: 345,
                    width: width,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 7.0),
                          child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(),
                            series: <LineSeries<JsonData, String>>[
                              LineSeries<JsonData, String>(
                                dataSource: getColumnData(0),
                                xValueMapper: (JsonData data, _) => data.x,
                                yValueMapper: (JsonData data, _) => data.y,
                                color: Colors.cyan,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FarmDetails(0),
                                  ));
                            },
                            child: Text(
                              "Click here to expand",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.cyanAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  Text(
                    "2. Dhalgaon Farm",
                    style: TextStyle(
                      fontSize: 23.0,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    height: 345,
                    width: width,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 7.0),
                          child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(),
                            series: <LineSeries<JsonData, String>>[
                              LineSeries<JsonData, String>(
                                dataSource: getColumnData(1),
                                xValueMapper: (JsonData data, _) => data.x,
                                yValueMapper: (JsonData data, _) => data.y,
                                color: Colors.cyan,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FarmDetails(1),
                                  ));
                            },
                            child: Text(
                              "Click here to expand",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.cyanAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  Text(
                    "3. Jaisalmer Farm",
                    style: TextStyle(
                      fontSize: 23.0,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    height: 345,
                    width: width,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 7.0),
                          child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(),
                            series: <LineSeries<JsonData, String>>[
                              LineSeries<JsonData, String>(
                                dataSource: getColumnData(2),
                                xValueMapper: (JsonData data, _) => data.x,
                                yValueMapper: (JsonData data, _) => data.y,
                                color: Colors.cyan,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FarmDetails(2),
                                  ));
                            },
                            child: Text(
                              "Click here to expand",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.cyanAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  Text(
                    "4. Muppandal Farm",
                    style: TextStyle(
                      fontSize: 23.0,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    height: 345,
                    width: width,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 7.0),
                          child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(),
                            series: <LineSeries<JsonData, String>>[
                              LineSeries<JsonData, String>(
                                dataSource: getColumnData(3),
                                xValueMapper: (JsonData data, _) => data.x,
                                yValueMapper: (JsonData data, _) => data.y,
                                color: Colors.cyan,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FarmDetails(3),
                                  ));
                            },
                            child: Text(
                              "Click here to expand",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.cyanAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  Text(
                    "5. Satara Farm",
                    style: TextStyle(
                      fontSize: 23.0,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    height: 345,
                    width: width,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 7.0),
                          child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(),
                            series: <LineSeries<JsonData, String>>[
                              LineSeries<JsonData, String>(
                                dataSource: getColumnData(4),
                                xValueMapper: (JsonData data, _) => data.x,
                                yValueMapper: (JsonData data, _) => data.y,
                                color: Colors.cyan,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FarmDetails(4),
                                  ));
                            },
                            child: Text(
                              "Click here to expand",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.cyanAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
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
