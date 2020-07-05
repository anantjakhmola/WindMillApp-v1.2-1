import 'package:flutter/material.dart';
import '../helpers/curvePainter.dart';
import '../screens/jsonDataScreen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../helpers/colorGradient.dart';
import 'graphOutputs.dart';

class AllGraphOutput extends StatefulWidget {
  @override
  _AllGraphOutputState createState() => _AllGraphOutputState();
}

class _AllGraphOutputState extends State<AllGraphOutput> {
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
                      "Output",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = linearGradient,
                      ),
                      textScaleFactor: 1.5,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Rotate Screen",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 10.0)),
                        Icon(
                          Icons.crop_rotate,
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    height: 357.0,
                    width: width,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 7.0),
                          child: SfCartesianChart(
                            legend: Legend(
                              position: LegendPosition.bottom,
                              overflowMode: LegendItemOverflowMode.wrap,
                              isVisible: true,
                            ),
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(),
                            series: <LineSeries<JsonData, String>>[
                              LineSeries<JsonData, String>(
                                dataSource: getColumnData(0),
                                xValueMapper: (JsonData data, _) => data.x,
                                yValueMapper: (JsonData data, _) => data.y,
                                color: Colors.cyan,
                              ),
                              //Multi graph
                              LineSeries<JsonData, String>(
                                dataSource: getColumnData(1),
                                xValueMapper: (JsonData data, _) => data.x,
                                yValueMapper: (JsonData data, _) => data.y,
                                color: Colors.red,
                              ),
                              LineSeries<JsonData, String>(
                                dataSource: getColumnData(2),
                                xValueMapper: (JsonData data, _) => data.x,
                                yValueMapper: (JsonData data, _) => data.y,
                                color: Colors.black,
                              ),
                              LineSeries<JsonData, String>(
                                dataSource: getColumnData(3),
                                xValueMapper: (JsonData data, _) => data.x,
                                yValueMapper: (JsonData data, _) => data.y,
                                color: Colors.white,
                              ),
                              LineSeries<JsonData, String>(
                                dataSource: getColumnData(4),
                                xValueMapper: (JsonData data, _) => data.x,
                                yValueMapper: (JsonData data, _) => data.y,
                                color: Colors.yellow,
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
                                    builder: (context) => GraphOutputs(),
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
        ),
      ],
    );
  }
}
