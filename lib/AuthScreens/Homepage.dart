import 'package:flutter/material.dart';

import '../AppDefaults.dart';
import 'Register.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title),
      ),
      backgroundColor: DefaultVars.AppBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Image(
                image: AssetImage('Assets/coin-exchange-2427.png'),
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.width * 0.45,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Welcome to AI Trading Bot",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            OutlinedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                )
              },
              child: Text("Get started!"),
              style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(color: Colors.black)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(DefaultVars.BtnColor),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(fontSize: 25)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
