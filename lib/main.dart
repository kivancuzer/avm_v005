import 'dart:async';

import 'package:avmv005/Pages/bilboard_page.dart';
import 'package:avmv005/Pages/home_page_deneme.dart';
import 'package:avmv005/scaffold.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main(){
  runApp(MaterialApp(
    
    initialRoute: "/",
    
    routes:{
      "/": (context) => ScaffoldOgesi(),
      

  }
  ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avm+',
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Color(0xFFFEF9EB),
         ),
        home: ScaffoldOgesi(),
        
     );
  }
}
class DrawerCodeOnly extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return new Drawer(
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 120.0,
              width: double.maxFinite,
              color: Color.fromRGBO(101, 99, 250, 100),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Align(
                child:FlutterLogo(
                  size:40.0,
                  colors: Colors.amber,
                ),
                alignment: Alignment.bottomLeft,
              ),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text("Homepage"),
                    trailing: Icon(Icons.arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, "/");
                    },
                  ),
                  ListTile(
                    title: Text("Discounts"),
                    trailing: Icon(Icons.arrow_right),
                    
                  ),
                  ListTile(
                    title: Text("Trends"),
                    trailing: Icon(Icons.arrow_right),
                    onTap: () 
                    {
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new BilboardScreen()));
                    }
                  ),
                  ListTile(
                    title: Text("Events"),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    title: Text("Gallery"),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  // Aralık vermek için kullanılır
                  // Divider(
                  //   height: 2.0,
                  //   color: Colors.blue,
                  // ),
                  // Açılabilir bir item
                  // ExpansionTile(
                  //   leading: Icon(Icons.adjust),
                  //   title: Text("Hakkimizda"),
                  //   trailing: Icon(Icons.arrow_right),
                  //   children: <Widget>[
                  //   ],
                  // ),
                  ListTile(
                    title: Text("Bilboard"),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    title: Text("Settings"),
                    trailing: Icon(Icons.arrow_right),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

}

