import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class FullScreenImage extends StatefulWidget {
  final String avmName;

  //final String information;

  FullScreenImage(this.avmName);

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {


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
                  Text(""),
            ],
          )
        ],
      ),
    );
  }
}
