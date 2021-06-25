import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app3/DashboardScreens/CryptoChart.dart';
import 'package:flutter_app3/DashboardScreens/trade.dart';
import '../AppDefaults.dart';
import 'Market.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  //HttpClient client = new HttpClient();
  List<Widget> v = <Widget>[
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text("He'd have you all unravel at the"),
      color: Colors.teal[100],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    //client = new HttpClient();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(DefaultVars.AppTitle),
      ),
      backgroundColor: DefaultVars.AppBackground,
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(5),
            child: Card(
              color: Colors.white,
              elevation: 10.0,


              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                    'Hello,\nMr XXXXXXXXXX',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(5),
            child: Card(
              color: Colors.white,
              elevation: 10.0,
              //** use fl charts **
              child: Container(
                padding: EdgeInsets.all(10),
                child: Image(
                  image: AssetImage('Assets/pie chart.png'),
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.width * 0.45,
                ),
              ),
            ),
          ),
        ],
      ),
      /*FutureBuilder<HttpClientResponse>(
        future: client
            .getUrl(Uri.parse(
            "https://api.binance.com/api/v3/ticker/price?symbol=XRPUSDT"))
            .then((HttpClientRequest request) {
          // Optionally set up headers...
          // Optionally write to the request object...
          // Then call close.

          return request.close();
        }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {


              snapshot.data?.transform(utf8.decoder).listen((contents) {
                // handle data
                DefaultVars.priceData.add(contents);
                print(contents);
                v.add(Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(contents),
                  color: Colors.teal[100],
                ),);
              });
            return GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: v
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),*/
      bottomNavigationBar: DefaultVars.getBottom(0 ,(int index) {
        print(index);
        setState(() {
          _selectedIndex = index;

          switch(index){
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          v.add(
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text("ADDED NOW"),
              color: Colors.teal[100],
            ),
          );
          setState(() {

          });
        },
        child: const Icon(Icons.add_outlined),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
