// allow profile to be set up

import 'package:flutter/material.dart';
import 'package:flutter_app3/DashboardScreens/Dashboard.dart';

import '../AppDefaults.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(DefaultVars.AppTitle),
      ),
      backgroundColor: DefaultVars.AppBackground,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          OutlinedButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              )
            },
            child: Text("        Login      "),
            style: ButtonStyle(
              side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(color: Colors.black)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(DefaultVars.BtnColor),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              textStyle:
                  MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 25)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () => {},
            child: Text("Not registered?"),
            style: ButtonStyle(
              side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(color: Colors.black)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(DefaultVars.BtnColor),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              textStyle:
                  MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 25)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
