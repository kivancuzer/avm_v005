import 'package:avmv005/main.dart';
import 'package:avmv005/widgets/gallery.dart';
import 'package:flutter/material.dart';


class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Gallery Page"),
        ),
        drawer: DrawerCodeOnly(),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Gallery(),
            ],
          ),
        )
        );
  }
}