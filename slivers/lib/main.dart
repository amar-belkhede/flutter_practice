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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: new Text("Sliver Theme"),
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              background: new Image.network("https://placeimg.com/640/480/any"),
            ),
          ),
          SliverList(
            delegate: new SliverChildBuilderDelegate(
              (contect, index) => new Card(
                child: new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: new NetworkImage(
                            "https://placeimg.com/640/480/any"),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text("Card Content ")
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
