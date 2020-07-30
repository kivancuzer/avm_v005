import 'package:flutter/material.dart';

import '../../login_islemleri.dart';
import '../../main.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: DrawerCodeOnly(),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            LoginIslemleri(),
          ],
        ),
      ),
    );


  }
}
