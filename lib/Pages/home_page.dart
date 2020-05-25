import 'package:avmv005/widgets/homepage_gridview.dart';
import 'package:avmv005/widgets/homepage_slideshow.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: <Widget>[
          HomePageSlideShow(),
          HomePageGridView(),
          
        ],
      ),
    ));
  }
}
