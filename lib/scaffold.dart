import 'package:avmv005/Pages/NavigationBar/new_home_page.dart';
import 'package:avmv005/main.dart';
import 'package:flutter/material.dart';
import 'Pages/Drawer/search.dart';


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
        return SearchBar();
        break;

      case 2:
        return HomeScreenNew();
        break;

      case 3:
        return HomeScreenNew();
        break;

      case 4:
        return HomeScreenNew();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(80, 77, 229, 100),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        )),
        title: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(73, 70, 218, 100),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                icon: Icon(
                  Icons.search,
                  color: Colors.white.withOpacity(0.5),
                )),
          ),
        ),
      ),
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
