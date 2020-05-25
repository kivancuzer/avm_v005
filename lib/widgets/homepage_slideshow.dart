import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePageSlideShow extends StatelessWidget {
  

  Future getPosts() async {
    var firestore = Firestore.instance;

    QuerySnapshot qs =
        await firestore.collection("Anasayfa_Ust").getDocuments();

    return qs.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 200.0,
            width: 320.0,
            color: Colors.white,
            child: FutureBuilder(
                future: getPosts(),
                builder: (_, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Text("Loading..."),
                    );
                  } else {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, index) {
                          //snapshot.data[index].data["name"]),
                          return Container(
                            margin: EdgeInsets.all(10.0),
                            width: 300,
                            child: Stack(
                              children: <Widget>[
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeOutQuint,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          snapshot.data[index].data['image'],
                                        )),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black87,
                                      )
                                    ],
                                  ),
                                  height: 400,
                                  width: 300,
                                )
                              ],
                            ),
                          );
                        });
                  }
                }))
      ],
    );
  }
}

