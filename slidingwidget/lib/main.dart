import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slidingwidget/app_state.dart';
import 'package:slidingwidget/category.dart';
import 'package:slidingwidget/category_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => AppState(),
        child: SafeArea(
          child: Consumer<AppState>(
            builder: (context, appState, _) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  for (final category in categories)
                    CategoryWidget(
                      category: category,
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
