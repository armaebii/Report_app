import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_profile_example/components/home/home.dart';


AppBar buildAppBar(BuildContext context) {
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    leading: BackButton(
       onPressed: () {
  Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),);
},
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
    
    ],
  );
}
