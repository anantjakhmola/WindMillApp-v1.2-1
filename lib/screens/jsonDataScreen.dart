import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'allGraphOutput.dart';
import '../helpers/fetchedjsondata.dart';
import 'farmDetails.dart';

class JsonDataScreen extends StatefulWidget {
  final String requestFrom;
  final int val;
  JsonDataScreen(
    this.requestFrom,
    this.val,
  );
  @override
  _JsonDataScreenState createState() => _JsonDataScreenState();
}

class _JsonDataScreenState extends State<JsonDataScreen> {
  final List<String> url = [
    "https://ab-api-flutter.herokuapp.com/data?file=Brahmanvel_Farm",
    "https://ab-api-flutter.herokuapp.com/data?file=Dhallgaon_Farm",
    "https://ab-api-flutter.herokuapp.com/data?file=Jaisalmer",
    "https://ab-api-flutter.herokuapp.com/data?file=Muppandal_Farm",
    "https://ab-api-flutter.herokuapp.com/data?file=Satara_Farm",
  ];

  List<List<String>> finaluserData = new List.generate(noOfFarms, (i) => []);

  int i = 0;

  @override
  void initState() {
    super.initState();
    this.getJSONdata();
  }

  Future getJSONdata() async {
    for (int i = 0; i < noOfFarms; i++) {
      var response = await http.get(
        Uri.encodeFull(url[i]),
      );
      var data = json.decode(response.body);
      data.forEach((key, value) {
        finaluserData[i].add("$key, $value");
        dateTime[i].add("$key");
        values[i].add("$value");
      });
    }

    setState(() {
      if (finaluserData != null) {
        isLoaded = true;
        this.moveToGraphOutputs();
        // getColumnData();
      }
    });
  }

  moveToGraphOutputs() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (widget.requestFrom == "howCanWeHelpYou") {
            return AllGraphOutput();
          } else if (widget.requestFrom == "selectTheWindFarm") {
            return FarmDetails(widget.val);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class JsonData {
  String x;
  double y;

  JsonData(this.x, this.y);
}

dynamic getColumnData(int i) {
  List<JsonData> columnData = [];

  int len = dateTime[i].length;
  print(len);
  for (int j = 0; j < len; j++) {
    columnData.add(JsonData(
        "${dateTime[i][j].substring(0, 10)}\n${dateTime[i][j].substring(11)}",
        double.parse(values[i][j])));
  }

  return columnData;
}
