import 'package:flutter/material.dart';
import 'package:flutter_app3/AppDefaults.dart';
import 'package:flutter_app3/DashboardScreens/CryptoChart.dart';
import 'package:flutter_app3/DashboardScreens/Dashboard.dart';
import 'package:flutter_app3/DashboardScreens/Market.dart';

class Trade extends StatefulWidget {
  @override
  _TradeState createState() => _TradeState();
}

class _TradeState extends State<Trade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        elevation: 10,
        actions: <Widget>[
        ],
      ),
      backgroundColor: DefaultVars.AppBackground,
      body: ListView(
        children: <Widget>[
          Card(
            color: Colors.white,
            elevation: 10.0,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('LONG'),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('SHORT'),
                      ),
                    ),
                  ],
                ),
                Table()
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: DefaultVars.getBottom(3, (int index) {
        print(index);
        setState(() {
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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CryptoChart()));
              break;
            case 3:
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Trade()));
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
