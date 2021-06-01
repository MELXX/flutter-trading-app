import 'package:flutter/material.dart';

import 'DashboardScreens/Market.dart';

class DefaultVars{
  static const Color AppBackground = Colors.blueGrey;
  static const Color TextColor = Colors.white;
  static const Color BtnColor = Colors.amber;
  static const String AppTitle = "AI Trading app";
  static getBottom (int _selectedIndex, _onItemTapped) {
    return BottomNavigationBar(
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
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
      backgroundColor: Colors.amber,
      unselectedItemColor: Colors.amber,
    );;
  }

}