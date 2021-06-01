import 'package:flutter/material.dart';

import '../AppDefaults.dart';
import 'Dashboard.dart';

class Market extends StatefulWidget {
  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  var _selectedIndex = 1;
  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
      switch (index) {
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
    String dropdownValue = 'XRPUSD';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(DefaultVars.AppTitle),
      ),
      backgroundColor: DefaultVars.AppBackground,
      body: Column(
        children: <Widget>[
           Row(
              children: <Widget>[

                ElevatedButton(
                  onPressed: () {},
                  child: Text("ALL", style: TextStyle(fontSize: 25)),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(DefaultVars.BtnColor),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("FAV", style: TextStyle(fontSize: 25)),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(DefaultVars.BtnColor),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("MARKET", style: TextStyle(fontSize: 25)),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(DefaultVars.BtnColor),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
              ],
            ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(DefaultVars.BtnColor),
              foregroundColor:
              MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: (){},
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.black),

              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['XRPUSD', 'DOGEUSD', 'ETHUSD', 'XLMUSD']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Card(
            child: Row(
              
            ),
          ),
          Card(),
          Card(),
          Card(),
        ],
      ),
      bottomNavigationBar: DefaultVars.getBottom(1, (int index) {
        print(index);
        setState(() {
          _selectedIndex = index;

          switch (index) {
            case 0:
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Dashboard()));
              break;
            case 1:
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Market()));
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
