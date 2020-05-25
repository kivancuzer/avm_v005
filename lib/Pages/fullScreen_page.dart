import 'package:flutter/material.dart';

class fullScreenImage extends StatefulWidget {
  //final String avmName;
  final String imageUrl;

  //final String information;

  fullScreenImage({this.imageUrl});

  @override
  _fullScreenImageState createState() => _fullScreenImageState();
}

class _fullScreenImageState extends State<fullScreenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0),
                  ],
                ),
                
              ),
            ],
          )
        ],
      ),
    );
  }
}
