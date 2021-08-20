import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:labroute/home/historyPage.dart';
import 'package:labroute/home/helpPage.dart';
import 'package:labroute/home/historyPage2.dart';
import 'package:labroute/loginPage/loginPage_Google.dart';
import 'package:labroute/provider/google_signin.dart';
import 'package:labroute/screen/Profile.dart';
import 'package:labroute/screen/display.dart';
import 'package:labroute/screen/formscreen.dart';
import 'package:labroute/screen/profile2.dart';
import 'package:labroute/screen/home_screen.dart';
import 'package:animated_splash/animated_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'screen/profile3.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();

  // Function duringSplash = () {
  //   print('Something background process');
  //   return 1;
  // };

  Map<int, Widget> op = {1: MyApp()};

  runApp(MaterialApp(
    home: AnimatedSplash(
      imagePath: 'assets/images/tumdeelogo.png',
      home: MyApp(),
      // customFunction: duringSplash,
      duration: 3000,
      type: AnimatedSplashType.BackgroundProcess,
      outputAndHome: op,
    ),
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'ทำดี ธรรมดี';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: title,
        theme: ThemeData(primarySwatch: Colors.yellow, fontFamily: 'Ekkamai'),
        home: Pagecontoller(),
        // home: HomePage(),
        initialRoute: '/',
        routes: {
          'HomePagelogin': (context) => LoginPage2(),
          // 'HomePage': (context) => HomePage(),
          'HomePage': (context) => DisplayScreen(),

          'historypage': (context) => HistoryPage(),
          'HelpPage': (context) => HelpPage(),
          'historypage2': (context) => HistoryPage2(),
          // 'bottom': (context) => FormScreen(),
          'addtumdee': (context) => FormScreen2(),
          'profile': (context) => ProfileScreen(),
          'profile2': (context) => Profile(),
          'profile3': (context) => TransactionsScreen(),
        },
      ));

  // return materialApp;
}
// }

class Pagecontoller extends StatefulWidget {
  @override
  _PagecontollerState createState() => _PagecontollerState();
}

class _PagecontollerState extends State<Pagecontoller> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User> snap) {
          if (snap.data != null) {
            String uid = snap.data.uid;

            return FutureBuilder(
              future:
                  FirebaseFirestore.instance.collection("users").doc(uid).get(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> doc) {
                if (doc.hasData) {
                  return Home(user: snap.data);
                } else {
                  FirebaseFirestore.instance.collection("users").doc(uid).set({
                    "uid": snap.data.uid,
                    "username": snap.data.displayName,
                    "email": snap.data.email,
                    "photoUrl": snap.data.photoURL,
                    "score": snap.data.reload(),
                  });

                  // return DisplayScreen(user: snap.data);
                  return Home(user: snap.data);
                }
              },
            );
          } else {
            return LoginPage2();
          }
        });
  }
}