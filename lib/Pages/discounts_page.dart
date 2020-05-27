import 'package:avmv005/widgets/discounts_slide.dart';
import 'package:avmv005/widgets/discounts_special.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class DiscountsScreen extends StatefulWidget {
  @override
  _DiscountsScreen createState() => _DiscountsScreen();
}

class _DiscountsScreen extends State<DiscountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text("Discounts Page"),
        ),
        drawer: DrawerCodeOnly(),
        body: SafeArea(
      child: ListView(
        children: <Widget>[
          DiscountPageSlide(),
          DiscountPageSpecials(),
          
        ],
      ),
    )
    );
    
  }
}
