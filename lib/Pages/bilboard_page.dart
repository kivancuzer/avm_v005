import 'package:avmv005/main.dart';
import 'package:avmv005/widgets/bilboard_widget.dart';
import 'package:flutter/material.dart';

class BilboardScreen extends StatefulWidget {
  @override
  _BilboardScreenState createState() => _BilboardScreenState();
}

class _BilboardScreenState extends State<BilboardScreen> {
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
              Bilboards(),
            ],
          ),
        ));
  }
}

/*
body: SafeArea(
          child: ListView(
            children: <Widget>[
              Bilboards(),
            ],
          ),
        )
*/
