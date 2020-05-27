import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AvmScreen extends StatefulWidget {
  final String avmName;
  final String imageUrl;
  final String stars;

  AvmScreen({this.avmName, this.imageUrl,this.stars});

  @override
  _AvmScreenState createState() => _AvmScreenState();
}

class _AvmScreenState extends State<AvmScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    transform: Matrix4.translationValues(20.0, 50.0, 0.0),
                    child: Hero(
                      tag: widget.imageUrl,
                      child: Image(
                          height: 120,
                          width: 120,
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            widget.imageUrl,
                          )),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    transform: Matrix4.translationValues(40.0, 40.0, 0.0),
                    child: Text(
                      widget.avmName.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(40.0, 40.0, 0.0),
                    color: Colors.red,
                    height: 100,
                    width: 100,
                    child: Text("⭐"+widget.stars.toString()),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
/*
transform: Matrix4.translationValues(10.0, 0.0, 0.0),
                    child: Text(
                      "⭐",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w600),
                    ),
*/
