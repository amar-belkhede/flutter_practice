import 'package:flutter/material.dart';
import 'package:slidemenu/about.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Slide Menu"),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("amar"),
              accountEmail: new Text("amar@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage("https://i.pravatar.cc/300"),
              ),
            ),
            new ListTile(
              title: new Text("About Page"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new AboutPage(),
                  ),
                );
              },
            ),
            new Divider(
              thickness: 1.0,
            ),
            new ListTile(
              title: new Text("About Page"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new AboutPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
