import 'package:flutter/material.dart';
import '../helpers/jsoncities.dart';
import '../helpers/curvePainter.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

GlobalKey<AutoCompleteTextFieldState<Cities>> key = new GlobalKey();

class RequestYourReportScreen extends StatefulWidget {
  @override
  _RequestYourReportScreenState createState() =>
      _RequestYourReportScreenState();
}

class _RequestYourReportScreenState extends State<RequestYourReportScreen> {
  AutoCompleteTextField<Cities> searchTextField;

  @override
  Widget build(BuildContext context) {
    void _loadData() async {
      await CitiesViewModel.loadPlayers();
    }

    @override
    void initState() {
      _loadData();
      super.initState();
    }

    TextEditingController controller = new TextEditingController();
    String email, state, city, numberOfWindmills, radius, powerCoefficient;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        // Backgeound Design
        CustomPaint(
          painter: CurvePainter(),
          size: Size.infinite,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: height / 5),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Request Your Report",
                      style: TextStyle(
                        color: Colors.cyan[200],
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  Container(
                    height: 80.0,
                    padding: EdgeInsets.all(10.0),
                    child: searchTextField = AutoCompleteTextField<Cities>(
                      key: key,
                      style: new TextStyle(color: Colors.white, fontSize: 16.0),
                      decoration: new InputDecoration(
                          suffixIcon: Container(
                            width: 85.0,
                            height: 40.0,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                          filled: true,
                          hintText: 'Search City By Name',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          )),
                      itemBuilder: (context, item) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              item.city,
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15.0),
                            ),
                            Text(
                              item.city,
                            )
                          ],
                        );
                      },
                      itemFilter: (item, query) {
                        return item.city
                            .toLowerCase()
                            .startsWith(query.toLowerCase());
                      },
                      itemSorter: (a, b) {
                        return a.city.compareTo(b.city);
                      },
                      itemSubmitted: (item) {
                        setState(() => searchTextField
                            .textField.controller.text = item.city);
                      },
                      suggestions: CitiesViewModel.cities,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
