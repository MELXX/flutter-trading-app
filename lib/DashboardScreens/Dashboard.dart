import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import '../AppDefaults.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  List<Widget> v = <Widget>[
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text("He'd have you all unravel at the"),
      color: Colors.teal[100],
    ),
  ];
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("hgjhjh");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(DefaultVars.AppTitle),
      ),
      backgroundColor: DefaultVars.AppBackground,
      body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: v),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_saver_off),
            label: 'Trades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Long/Short',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        fixedColor: Colors.amber,
        backgroundColor: Colors.amber,
        unselectedItemColor: Colors.amber,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          v.add(
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text("ADDED NOW"),
              color: Colors.teal[100],
            ),
          );
          setState(() {});
          HttpClient client = new HttpClient();
          var vv = client
              .getUrl(Uri.parse(
                  "https://api.binance.com/api/v3/ticker/price?symbol=XRPUSDT"))
              .then((HttpClientRequest request) {
            // Optionally set up headers...
            // Optionally write to the request object...
            // Then call close.

            return request.close();
          }).then((HttpClientResponse response) {
            response.transform(utf8.decoder).listen((contents) {
              // handle data
              print(contents);
            });
          });
        },
        child: const Icon(Icons.add_outlined),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
