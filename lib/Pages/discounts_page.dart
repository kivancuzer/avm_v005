import 'package:avmv005/widgets/discounts_slide.dart';
import 'package:avmv005/widgets/discounts_special.dart';
import 'package:avmv005/widgets/homepage_gridview.dart';
import 'package:avmv005/widgets/homepage_slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DiscountsScreen extends StatefulWidget {
  @override
  _DiscountsScreen createState() => _DiscountsScreen();
}

class _DiscountsScreen extends State<DiscountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
