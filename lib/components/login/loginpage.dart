import 'package:flutter/material.dart';
import 'package:user_profile_example/components/login/screens/login_screen.dart';
import 'package:user_profile_example/components/login/screens/signup_screen.dart';

void main() =>
  runApp(MyApp());
   

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primaryColor: Colors.blue),
        home: SignupScreen(),
        routes: {
         SignupScreen.routeName: (ctx)=>SignupScreen(),
         LoginScreen.routeName: (ctx)=>LoginScreen(),
       //  HomeScreen.routeName: (ctx)=>HomeScreen(),
        },
    );
  }
}