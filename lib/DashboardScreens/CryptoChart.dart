import 'package:flutter/material.dart';

import '../AppDefaults.dart';
import 'Dashboard.dart';
import 'Market.dart';

class CryptoChart extends StatefulWidget {
  @override
  _CryptoChartState createState() => _CryptoChartState();
}

class _CryptoChartState extends State<CryptoChart> {
  @override
  Widget build(BuildContext context) {
    var isSelected = [
      false,false,false
    ];
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        elevation: 10,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
          IconButton(
            icon: const Icon(Icons.star),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
          IconButton(
            icon: const Icon(Icons.dashboard),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),
      backgroundColor: DefaultVars.AppBackground,
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("373.66\n3336"),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.30),
                child: Text("High\n3000.60"),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.10),
                  child: Text("Low\n55000000.60"),
                ),
              ),
            ],
          ),
          ToggleButtons(
            children: <Widget>[
              Icon(Icons.ac_unit),
              Icon(Icons.call),
              Icon(Icons.cake),
            ],
            onPressed: (int index) {
              setState(() {
                isSelected[index] = !isSelected[index];
              });
            },
            isSelected: isSelected,
          ),
          ToggleButtons(
            children: <Widget>[
              Icon(Icons.ac_unit),
              Icon(Icons.call),
              Icon(Icons.cake),
            ],
            onPressed: (int index) {
              setState(() {
                isSelected[index] = !isSelected[index];
              });
            },
            isSelected: isSelected,
          ),
        ],
      ),
      bottomNavigationBar: DefaultVars.getBottom(1, (int index) {
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
