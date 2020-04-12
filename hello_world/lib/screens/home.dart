import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepPurple,
      child: Center(
        child: Text(
          sayHello(),
          style: TextStyle(color: Colors.white, fontSize: 36.0),
        ),
      ),
    );
  }

  String sayHello() {
    var greeting;
    var now = new DateTime.now();

    var hour = now.hour;
    var minute = now.minute;

    if (hour < 12) {
      greeting = "Good morning";
    }
    else if (hour < 18) {
      greeting = "Good afternoon";
    }
    else {
      greeting = "Good evening";
    }

    var minutes = minute < 10 ? "0$minute" : minute;

    return "It's now $hour:$minutes\n$greeting";
  }
}
