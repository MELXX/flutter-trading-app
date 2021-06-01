import 'package:flutter/material.dart';

import '../AppDefaults.dart';
import 'Dashboard.dart';

class Market extends StatefulWidget {
  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  var _selectedIndex =1;
  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
      switch(index){
        case 0:
        // do something
          break;
        case 1:
        // do something else
          break;
        case 2:
        // do something
          break;
        case 3:
        // do something else
          break;
        case 4:
        // do something else
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(DefaultVars.AppTitle),
      ),
      backgroundColor: DefaultVars.AppBackground,
      body: Container(

      ),
      bottomNavigationBar: DefaultVars.getBottom(1,(int index) {
        print(index);
        setState(() {
          _selectedIndex = index;

          switch(index){
            case 0:
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard()));
              break;
            case 1:
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Market()));
              break;
            case 2:
            // do something
              break;
            case 3:
            // do something else
              break;
            case 4:
            // do something else
              break;
          }
        });
      }),
    );
  }
}
