import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HelloYou(),
    );
  }
}

class HelloYou extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HelloYouState();
  }
}

class _HelloYouState extends State<HelloYou> {
  final _currencies = ["Dollars", "Euro", "Pounds"];
  String _currency = "Dollars";
  final double _formDistance = 5.0;
  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(top: _formDistance, bottom: _formDistance),
              child: TextField(
                controller: distanceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "e.g. 123",
                    labelText: "Distance",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: _formDistance, bottom: _formDistance),
              child: TextField(
                controller: avgController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "e.g. 17",
                    labelText: "Distance per Unit",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
                padding:
                    EdgeInsets.only(top: _formDistance, bottom: _formDistance),
                child: Row(children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "e.g. 1.65",
                          labelText: "Price",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  Container(width: _formDistance * 5),
                  Expanded(
                    child: DropdownButton<String>(
                      items: _currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _currency,
                      onChanged: (value) {
                        _onDropdownChanged(value);
                      },
                    ),
                  ),
                ])),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        result = _calculate();
                      });
                    },
                    child: Text(
                      "Submit",
                      textScaleFactor: 1.5,
                    ),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    color: Colors.yellowAccent,
                    textColor: Colors.black,
                    onPressed: () {
                      setState(() {
                        _reset();
                      });
                    },
                    child: Text(
                      "Reset",
                      textScaleFactor: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            Text(result)
          ],
        ),
      ),
    );
  }

  void _onDropdownChanged(String value) {
    _currency = value;
  }

  String _calculate() {
    double _distance = double.parse(distanceController.text);
    double _fuelCost = double.parse(priceController.text);
    double _consumption = double.parse(avgController.text);

    double _totalCost = _distance / _consumption * _fuelCost;
    String _result =
        "The total cost of your trip is ${_totalCost.toStringAsFixed(2)} $_currency";
    return _result;
  }

  void _reset() {
    distanceController.text = "";
    avgController.text = "";
    priceController.text = "";
    setState(() {
      result = "";
    });
  }
}
