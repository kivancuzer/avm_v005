
import 'package:avmv005/Pages/fullScreen_page.dart';
import 'package:avmv005/Pages/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePageGridView extends StatelessWidget {
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
        Container(
          height: 500,
          width: 300,
          child: FutureBuilder(
            future: getPosts(),
            builder: (_, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("Loading..."),
                );
              } else {
                return GridView.builder(
                    primary: false,
                    itemCount: snapshot.data.length,
                    padding: const EdgeInsets.all(20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => fullScreenImage(),
                          ),
                        ),
                        child: Container(
                            width: 100,
                            height: 150,
                            child: Stack(
                              children: <Widget>[
                                Container(
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
                                )
                              ],
                            )),
                      );
                    });
              }
            },
          ),
        )
      ],
    );
  }
}
