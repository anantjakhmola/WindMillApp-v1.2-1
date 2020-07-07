import 'package:flutter/material.dart';
import '../helpers/curvePainter.dart';
import '../helpers/colorGradient.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'jsonDataScreen.dart';

class FarmDetails extends StatefulWidget {
  final int i;
  FarmDetails(this.i);
  @override
  _FarmDetailsState createState() => _FarmDetailsState();
}

class _FarmDetailsState extends State<FarmDetails> {
  List<Color> colorPallete = [
    Colors.cyan,
    Colors.red,
    Colors.black,
    Colors.white,
    Colors.yellow,
  ];
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
                children: <Widget>[
                  Container(
                    child: Text(
                      "Details of Farm",
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
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    height: 320,
                    width: width,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              width: 2000.0,
                              child: SfCartesianChart(
                                primaryXAxis: CategoryAxis(),
                                primaryYAxis: NumericAxis(),
                                series: <LineSeries<JsonData, String>>[
                                  LineSeries<JsonData, String>(
                                    dataSource: getColumnData(widget.i),
                                    xValueMapper: (JsonData data, _) => data.x,
                                    yValueMapper: (JsonData data, _) => data.y,
                                    color: colorPallete[widget.i],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
