import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';

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
  String url = 'https://randomuser.me/api/?results=15';
  List data;
  Future<String> get makeRequest async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var extractdata = jsonDecode(response.body);
      data = extractdata["results"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    this.makeRequest;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Contact List'),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, i) {
          return new ListTile(
            title: new Text(data[i]["name"]["first"]),
            subtitle: new Text(data[i]["phone"]),
            leading: new CircleAvatar(
              backgroundImage:
                  new NetworkImage(data[i]["picture"]["thumbnail"]),
            ),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new SecondPage(data: data[i])),
              );
            },
          );
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key key, this.data}) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: new AppBar(
          title: new Text('Second Page'),
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                    color: Color(0xff7c94b6),
                    image: new DecorationImage(
                      image: new NetworkImage(data["picture"]["large"]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(75.0)),
                    border: new Border.all(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 8.0,
                ),
                child: new Text(
                  data["name"]["first"] + " " + data["name"]["last"],
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              new Text(
                data["email"],
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      );
}
