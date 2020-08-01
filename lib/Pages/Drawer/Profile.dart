import 'package:avmv005/Model/user_model.dart';
import 'package:avmv005/Services/auth_base.dart';
import "package:flutter/material.dart";

import '../../main.dart';

class ProfilePage extends StatelessWidget {
  final AuthBase authService;
  final VoidCallback onSignOut;
  final User user;

  ProfilePage(
      {Key key,
      @required this.authService,
      @required this.user,
      @required this.onSignOut})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(80, 77, 229, 100),
        actions: <Widget>[
          FlatButton(
            onPressed: _cikisYap,
            child: Text(
              "Çıkış Yap",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        )),
        title: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(73, 70, 218, 100),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      drawer: DrawerCodeOnly(),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Text("Hoşgeldininiz ${user.userID}"),
          ],
        ),
      ),
    );
  }

  Future<bool> _cikisYap() async {
    bool result = await authService.signOut();
    onSignOut();
    return result;
  }
}
