import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  String inputStr = "";
  final TextCtrl = new TextEditingController();
  bool enabled = false;
  bool expanded = false;
  bool checked = false;
  String radioValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Input Widget"),
      ),
      body: new Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(hintText: "write something"),
                onChanged: (String textInput) {
                  setState(() {
                    inputStr = TextCtrl.text.length.toString();
                  });
                },
                controller: TextCtrl,
              ),
              new Text(inputStr),
              new Switch(
                onChanged: (bool val) {
                  setState(() {
                    enabled = val;
                    print(enabled);
                  });
                },
                activeColor: Colors.green,
                activeTrackColor: Colors.lightGreen,
                value: enabled,
              ),
              new ExpansionPanelList(
                expansionCallback: (i, bool val) {
                  setState(() {
                    expanded = !val;
                  });
                },
                children: [
                  new ExpansionPanel(
                    body: new Container(
                      padding: const EdgeInsets.all(20.0),
                      child: new Text("Hello"),
                    ),
                    headerBuilder: (BuildContext context, bool val) {
                      return new Center(
                        child: new Text(
                          "tap on me",
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                      );
                    },
                    isExpanded: expanded,
                  ),
                ],
              ),
              new Checkbox(
                onChanged: (bool val) {
                  setState(() {
                    checked = val;
                  });
                },
                value: checked,
                activeColor: Colors.purple,
              ),
              new Row(
                children: <Widget>[
                  new Radio(
                    onChanged: (String value) {
                      setState(() {
                        setRadioValue(value);
                      });
                    },
                    groupValue: radioValue,
                    value: "red",
                    activeColor: Colors.red,
                  ),
                  new Radio(
                    onChanged: (String value) {
                      setState(() {
                        setRadioValue(value);
                      });
                    },
                    groupValue: radioValue,
                    value: "yellow",
                    activeColor: Colors.yellow,
                  ),
                  new Radio(
                    onChanged: (String value) {
                      setState(() {
                        setRadioValue(value);
                      });
                    },
                    groupValue: radioValue,
                    value: "green",
                    activeColor: Colors.green,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  setRadioValue(String value) {
    setState(() {
      radioValue = value;
      print(radioValue);
    });
  }
}
