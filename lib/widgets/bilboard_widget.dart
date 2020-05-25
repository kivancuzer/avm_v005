import 'package:avmv005/Pages/home_page_deneme.dart';
import 'package:avmv005/Pages/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:avmv005/Pages/home_page.dart';

class Bilboards extends StatelessWidget {
  Future getPosts() async {
    var firestore = Firestore.instance;

    QuerySnapshot qs =
        await firestore.collection("Anasayfa_Avmler").getDocuments();

    return qs.documents;
  }

 @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Bilboards",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
              Text("See All",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ))
            ],
          ),
        ),
        Container(
            height: 550.0,
            width: 350.0,
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
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, index) {
                          //snapshot.data[index].data["name"]),
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                               MaterialPageRoute(
                                 builder: (context) => HomeScreen()));
                            },
                            child: Container(
                              margin: EdgeInsets.all(10.0),
                              width: 220,
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
                            ),
                          );
                        });
                  }
                })),
        SizedBox(height: 30.0),
      ],
    );
  }
}
