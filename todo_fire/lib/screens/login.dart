import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_fire/screens/sign_up.dart';
import 'package:todo_fire/utils/constants.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Email",
                suffixIcon: Icon(Icons.supervised_user_circle),
              ),
            ),
            SizedBox(height: kPadding),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: kPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {},
                  child: Text("Login"),
                ),
                SizedBox(width: kPadding / 2),
                Text("or"),
                FlatButton(
                  child: Text("Sign up"),
                  onPressed: () {
                    Get.to(SignUp());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
