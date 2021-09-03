//import 'package:user_profile_example/components/home/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:user_profile_example/components/home/screens/home_page.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff053F5E),
      ),
      home: HomePage(),
    );
  }
}
