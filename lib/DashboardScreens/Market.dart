import 'package:flutter/material.dart';
import 'package:flutter_app3/DashboardScreens/CryptoChart.dart';
import '../AppDefaults.dart';
import 'Dashboard.dart';

class Market extends StatefulWidget {
  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
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
          Card(
            color: Colors.white,
            elevation: 10.0,
            //** use fl charts **
            child: Container(
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.width * 0.45,
              padding: EdgeInsets.all(5),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: ImageIcon(
                  AssetImage('Assets/btc.png'),
                ),
                title: Text("Bitcoin\nBTC"),
                trailing: Text("Current Price\n\$35000,60"),
                onTap: () {},
              ),
            ),
          ),
          Card(
            color: Colors.white,
            elevation: 10.0,
            //** use fl charts **
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(5),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: ImageIcon(AssetImage('Assets/ripple_xrp.png')),
                title: Text("Ripple\nXRP"),
                trailing: Text("Current Price\n\$0,90"),
                onTap: () {},
              ),
            ),
          ),
          Card(
            color: Colors.white,
            elevation: 10.0,
            //** use fl charts **
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(5),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: ImageIcon(AssetImage('Assets/doge.png')),
                title: Text("Dogecoin\nDODGE"),
                trailing: Text("Current Price\n\$0,60"),
                onTap: () {},
              ),
            ),
          ),
          Card(
            color: Colors.white,
            elevation: 10.0,
            //** use fl charts **
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(5),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: ImageIcon(
                  AssetImage('Assets/eth.png'),
                ),
                title: Text("Etherum\nETH"),
                trailing: Text("Current Price\n\$1000"),
                onTap: () {},
              ),
            ),
          ),
          Card(
            color: Colors.white,
            elevation: 10.0,
            //** use fl charts **
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(5),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: ImageIcon(AssetImage('Assets/ltc.png')),
                title: Text("Litecoin\nLTC"),
                trailing: Text("Current Price\n\$1000,60"),
                onTap: () {},
              ),
            ),
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
