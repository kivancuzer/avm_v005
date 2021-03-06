import 'package:avmv005/Pages/NavigationBar/new_home_page.dart';
import 'package:avmv005/main.dart';
import 'package:flutter/material.dart';
import 'Pages/Drawer/search.dart';
import 'Pages/landing_page.dart';


class ScaffoldOgesi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScaffoldState();
}

class ScaffoldState extends State<ScaffoldOgesi> {
  int aktifOge = 0;

  gecerliSayfa(int aktif) {
    switch (aktif) {
      case 0:
        return HomeScreenNew();
        break;

      case 1:
        return SearchListExample();
        break;

      case 2:
        return HomeScreenNew();
        break;

      case 3:
        return HomeScreenNew();
        break;

      case 4:
        return LandingPage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: gecerliSayfa(aktifOge),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: aktifOge,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.videocam),
              title: Text('Cinema'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              title: Text('Location'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            ),
          ],
          selectedItemColor: Color.fromRGBO(101, 99, 250, 100),
          unselectedItemColor: Color.fromRGBO(191, 191, 211, 100),
          onTap: (int i) {
            aktifOge = i;
            setState(() {});
          }),
      drawer: new DrawerCodeOnly(),
    );
  }
}
