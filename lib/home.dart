//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_profile_example/components/home/home.dart';
import 'package:user_profile_example/components/messages/message.dart';
// ignore: unused_import
import 'package:user_profile_example/components/profile/profile.dart';
//import 'package:user_profile_example/components/report/Home.dart';

 //import 'package:firebase_auth/firebase_auth.dart';                                                                                                                                                                                                                                                                             
 
 class FirstPage extends StatelessWidget{

   @override
   Widget build(BuildContext context){
     return CupertinoApp(
       debugShowCheckedModeBanner: false,
       title: 'Persistent Navbar',
       home: MyHomePage(),
     );
   }
 }

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
  
}


class _MyHomePageState extends State<MyHomePage> {
//SignOut
// @override
// void initState(){
//   super.initState();
//   FirebaseAuth.instance.signOut();
//}

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),),
                 // BottomNavigationBarItem(icon: Icon(Icons.business_center_outlined),),
                  BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_rounded,),),
                  BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),),

              ],), tabBuilder: (BuildContext context, int index) {  
                switch(index){
                  case 0: 
                  return CupertinoTabView(builder: (context){
                    return CupertinoPageScaffold(child: Home(),);
                  },);
                  // case 1: 
                  // return CupertinoTabView(builder: (context){
                  //   return CupertinoPageScaffold(child: ReportHome(),);
                  // },);
                  case 1: 
                  return CupertinoTabView(builder: (context){ 
                    return CupertinoPageScaffold(child: Message(),);
                  },);
                  case 2: 
                  return CupertinoTabView(builder: (context){
                    return CupertinoPageScaffold(child: ProfileMain(),);
                  },);
                   default: 
                  return CupertinoTabView(builder: (context){
                    return CupertinoPageScaffold(child: Home(),);
                  },);
                }
              },
    );
  }
}
 
//  class Page2 extends StatefulWidget {
 
//    @override
//    _Page2State createState() => _Page2State();
//  }
 
//  class _Page2State extends State<Page2> {
//    @override
//    Widget build(BuildContext context) {
//      return SafeArea(
//        child: CupertinoButton(
//          child: Text('Press me'),
//          onPressed: (){
//            Navigator.push(context, CupertinoPageRoute(builder: (context) => Page2()));
//          },),
//      );
//    }
//  }
