//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:user_profile_example/Screens/SignUPScreen.dart';
import 'package:user_profile_example/components/home/home.dart';
//import 'package:user_profile_example/home.dart';
//import 'package:user_profile_example/home.dart';
import 'Screens/SignInScreen.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:user_profile_example/models/authentification.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    //  MultiProvider(
    //   providers: [
    //     // ChangeNotifierProvider.value(
    //     //   value: Authentificaton(),
    //     //   )
    //     Provider<AuthService>(
    //       create: (_)=> AuthService(FirebaseAuth.instance),
    //       ),
    //       StreamProvider(
    //         create: (context)=>context.read<AuthService>().authStateChanges, initialData: null,
    //         ),
    //   ],
      MaterialApp(
        title: 'Sign Up Screen',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        initialRoute: 'SignIn',
        routes: {
          'SignIn':(context)=>SignInScreen(),
           'SignUp':(context)=>SignUpScreen(),
           'Home':(context)=>Home(),
        },
        //home: SignInScreen(),
    //  ),
    );
  }
}

// class AuthWrapper extends StatefulWidget {
//   const AuthWrapper({ Key? key }) : super(key: key);

//   @override
//   _AuthWrapperState createState() => _AuthWrapperState();
// }

// class _AuthWrapperState extends State<AuthWrapper> { 
//   @override
//   Widget build(BuildContext context) {
//      final user = context.watch<User>();
//      // ignore: unnecessary_null_comparison
//      if(user != null){
//        return FirstPage();
//      }
//      return SignInScreen();
//   }
// }
// class Welcome extends StatelessWidget {
//   const Welcome({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Welcome'),
//         ),
//      );
//   }
// }