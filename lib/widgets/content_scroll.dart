import 'dart:async';
import 'package:avmv005/Pages/AvmScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContentScroll extends StatelessWidget {
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
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
              future: getPosts(),
              builder: (_, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("Loading..."),
                  );
                } else {
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AvmScreen(
                              avmName: snapshot.data[index].data["avm_name"],
                              imageUrl: snapshot.data[index].data["image"],
                              stars: snapshot.data[index].data["stars"],
                            ),
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10.0,
                          ),
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                offset: Offset(0.0, 0.4),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              image: NetworkImage(
                                snapshot.data[index].data['image'],
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
        ),
      ],
    );
  }
}

/*
GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (_) => MovieScreen(movie: snapshot.data[index].data["image"].toString()),
                      ),
                      ),
*/
