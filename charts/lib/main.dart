import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stopwatch watch = new Stopwatch();
  Timer timer;
  String elapsedTime = '';

  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();
  final _chartSize = new Size(250.0, 250.0);
  Color labelColor = Colors.blue;

  List<CircularStackEntry> _generateChartData(int min, int second) {
    double temp = second * 0.6;
    double adjustedSeconds = second + temp;

    double tempmin = min * 0.6;
    double adjustedMinutes = min + tempmin;

    Color dialColor = Colors.blue;
    labelColor = dialColor;
    List<CircularStackEntry> data = [
      new CircularStackEntry([
        new CircularSegmentEntry(adjustedSeconds, dialColor),
      ])
    ];

    if (min > 0) {
      labelColor = Colors.green;
      data.removeAt(0);
      data.add(new CircularStackEntry([
        new CircularSegmentEntry(adjustedSeconds, dialColor),
      ]));
      data.add(new CircularStackEntry([
        new CircularSegmentEntry(adjustedMinutes, labelColor),
      ]));
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _labelStyle = Theme.of(context)
        .textTheme
        .title
        .merge(new TextStyle(color: labelColor));
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("StopWatch"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          children: <Widget>[
            // new Text(
            //   elapsedTime,
            //   style: new TextStyle(
            //     fontSize: 25.0,
            //   ),
            // ),
            new AnimatedCircularChart(
              key: _chartKey,
              size: _chartSize,
              initialChartData: _generateChartData(0, 0),
              chartType: CircularChartType.Radial,
              edgeStyle: SegmentEdgeStyle.round,
              percentageValues: true,
              holeLabel: elapsedTime,
              labelStyle: _labelStyle,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: startWatch,
                  child: new Icon(Icons.play_arrow),
                ),
                SizedBox(
                  width: 20.0,
                ),
                new FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: stopWatch,
                  child: new Icon(Icons.stop),
                ),
                SizedBox(
                  width: 20.0,
                ),
                new FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: resetWatch,
                  child: new Icon(Icons.refresh),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  updateTimer(Timer timer) {
    if (watch.isRunning) {
      var milliSecond = watch.elapsedMilliseconds;
      int hundreds = (milliSecond / 10).truncate();
      int seconds = (hundreds / 100).truncate();
      int minutes = (seconds / 60).truncate();
      setState(() {
        elapsedTime = transformMilliSecond(watch.elapsedMilliseconds);
        if (seconds > 59) {
          seconds = seconds - (59 * minutes);
          seconds = seconds - minutes;
        }
        List<CircularStackEntry> data = _generateChartData(minutes, seconds);
        _chartKey.currentState.updateData(data);
      });
    }
  }

  startWatch() {
    watch.start();
    timer = new Timer.periodic(new Duration(milliseconds: 100), updateTimer);
  }

  stopWatch() {
    watch.stop();
    setTimer();
  }

  resetWatch() {
    watch.reset();
    setTimer();
  }

  setTimer() {
    var timerSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSecond(timerSoFar);
      List<CircularStackEntry> data = _generateChartData(0, 0);
      _chartKey.currentState.updateData(data);
    });
  }

  transformMilliSecond(int milliSecond) {
    int hundreds = (milliSecond / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr:$hundredsStr";
  }
}
