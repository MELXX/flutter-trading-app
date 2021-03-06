import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app3/CustomWidgets/Chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../AppDefaults.dart';
import 'Dashboard.dart';
import 'Market.dart';

class CryptoChart extends StatefulWidget {
  @override
  _CryptoChartState createState() => _CryptoChartState();
}

class _CryptoChartState extends State<CryptoChart> {
  var isSelectedIndicator = [false, false, false, false, false, false, false];
  var isSelectedTime = [false, false, false, false, false, false];

  late List<ChartData> _sampleData = [];

  @override
  void initState() {
    HttpClient client = new HttpClient();
    var v = client
        .getUrl(Uri.parse(
            "https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=1h&startTime=1223944113110&endTime=1723944113110&limit=100"))
        .then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      response.transform(utf8.decoder).listen((contents) {
        List<dynamic> data = jsonDecode(contents);
        data.forEach((element) {
          DateTime date =
              DateTime.fromMillisecondsSinceEpoch(element[6] * 1000);
          _sampleData.add(new ChartData(
            x: date,
            high: num.parse(element[2]),
            low: num.parse(element[3]),
            open: num.parse(element[1]),
            close: num.parse(element[4]),
          ));
        });
      });
    });
    super.initState();
  }

  List<ChartData>? getData() {
    return null;
  }

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
      body: ListView(
        children: <Widget>[
          Card(
            color: Colors.white,
            elevation: 10.0,
            child: Column(
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
                  borderRadius: BorderRadius.circular(30),
                  children: <Widget>[
                    Text("1m"),
                    Text("5m"),
                    Text("10m"),
                    Text("15m"),
                    Text("30m"),
                    Text("1h"),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      isSelectedTime[index] = !isSelectedTime[index];
                    });
                  },
                  isSelected: isSelectedTime,
                ),
                SfCartesianChart(
                  zoomPanBehavior: ZoomPanBehavior(
                    enablePinching: true,
                    zoomMode: ZoomMode.x,
                    enablePanning: true,
                  ),
                  series: <ChartSeries>[
                    // Renders CandleSeries
                    CandleSeries<ChartData, DateTime>(
                      name: 'coin-price-data',
                      dataSource: _sampleData,
                      xValueMapper: (ChartData data, _) => data.x,
                      lowValueMapper: (ChartData data, _) => data.low,
                      highValueMapper: (ChartData data, _) => data.high,
                      openValueMapper: (ChartData data, _) => data.open,
                      closeValueMapper: (ChartData data, _) => data.close,
                      trendlines: <Trendline>[
                        if (isSelectedIndicator[0])
                          Trendline(
                              type: TrendlineType.movingAverage,
                              color: Colors.blue),
                      ],
                    ),
                  ],
                  primaryXAxis: DateTimeAxis(),
                  indicators: <TechnicalIndicators<ChartData, DateTime>>[
                    BollingerBandIndicator<ChartData, DateTime>(
                        period: 3,
                        seriesName:  'coin-price-data',
                      dataSource: _sampleData,
                      xValueMapper: (ChartData data, _) => data.x,
                      closeValueMapper: (ChartData data, _) => data.close,
                      isVisible: isSelectedIndicator[2],
                    ),
                      EmaIndicator<ChartData, DateTime>(
                        seriesName: 'coin-price-data',
                        valueField: 'high',
                        isVisible: isSelectedIndicator[1],
                        dataSource: _sampleData,
                        xValueMapper: (ChartData data, _) => data.x,
                        lowValueMapper: (ChartData data, _) => data.low,
                        highValueMapper: (ChartData data, _) => data.high,
                        openValueMapper: (ChartData data, _) => data.open,
                        closeValueMapper: (ChartData data, _) => data.close,
                      ),
                    RsiIndicator<ChartData, DateTime>(
                        period: 3,
                        overbought: 70,
                        oversold: 30,
                        isVisible: isSelectedIndicator[4],
                        dataSource: _sampleData,
                        closeValueMapper: (ChartData data, _) => data.close,
                        xValueMapper: (ChartData data, _) => data.x,
                        seriesName: 'coin-price-data'
                    ),
                      MacdIndicator<ChartData, DateTime>(
                          longPeriod: 5,
                          shortPeriod: 2,
                          dataSource: _sampleData,
                          isVisible: isSelectedIndicator[5],
                          closeValueMapper: (ChartData data, _) => data.close,
                          xValueMapper: (ChartData data, _) => data.x,
                          seriesName: 'coin-price-data')
                  ],
                ),
                isSelectedIndicator[0]
                    ? Container(
                        child: Card(),
                      )
                    : Container(),
                ToggleButtons(
                  borderRadius: BorderRadius.circular(30),
                  children: <Widget>[
                    Text("MA"), //--
                    Text("EMA"), //--
                    Text("BOL"), //
                    Text("VOL"),
                    Text("RSI"), //--
                    Text("MACD"), //--
                    Text("KDJ"),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      isSelectedIndicator[index] = !isSelectedIndicator[index];
                    });
                  },
                  isSelected: isSelectedIndicator,
                ),
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
      bottomNavigationBar: DefaultVars.getBottom(2, (int index) {
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
