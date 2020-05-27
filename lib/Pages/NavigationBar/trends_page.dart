import 'package:avmv005/main.dart';
import 'package:avmv005/widgets/trends_widget.dart';
import 'package:flutter/material.dart';

class TrendsScreen extends StatefulWidget {
  @override
  _TrendsScreenState createState() => _TrendsScreenState();
}

class _TrendsScreenState extends State<TrendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Trends Page"),
        ),
        drawer: DrawerCodeOnly(),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Trends(),
            ],
          ),
        )
        );
  }
}