import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Slide Show  FirestoreSlideshow(),
class FirestoreSlideshow extends StatefulWidget {
  createState() => FirestoreSlideshowState();
}

class FirestoreSlideshowState extends State<FirestoreSlideshow> {
  final PageController ctrl = PageController(viewportFraction: 0.8);
  final Firestore db = Firestore.instance;
  Stream slides;

  String activeTag = 'favorites';
  int currentPage = 0;

  @override
  void initState() {
    _queryDb();

    ctrl.addListener(() {
      int next = ctrl.page.round();

      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: slides,
        initialData: [],
        builder: (context, AsyncSnapshot snap) {
          List slideList = snap.data.toList();

          return PageView.builder(
              controller: ctrl,
              itemCount: slideList.length,
              itemBuilder: (context, int currentIdx) {
                if (slideList.length >= currentIdx || currentIdx == 0) {
                  //Active Page
                  bool active = currentIdx == currentPage;
                  return _buildStoryPage(slideList[currentIdx], active);
                }
              });
        });
  }

  @override
  BuildContext get context {}

  Stream _queryDb({String tag = 'favorites'}) {
    //Make a Query
    Query query = db.collection('Anasayfa_Ust');

    slides =
        query.snapshots().map((list) => list.documents.map((doc) => doc.data));

    setState(() {
      activeTag = tag;
    });
  }
}

_buildStoryPage(Map data, bool active) {
  final double blur = active ? 30 : 0;
  final double a = active ? 10 : 50;

  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    curve: Curves.easeOutQuint,
    margin: EdgeInsets.only(right: 10, bottom: 300, top: a),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(data['image']),
        ),
        boxShadow: [BoxShadow(color: Colors.black87, blurRadius: blur)]),
    child: Center(
        child: Text(data['name'],
            style: TextStyle(fontSize: 40, color: Colors.white))),
  );
}

_buildTagPage() {
  return Container(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [],
  ));
}
