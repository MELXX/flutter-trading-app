import 'package:flutter/material.dart';

import 'AuthScreens/Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'RobotoMono',
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'AI Trading Bot'),
    );
  }
}




