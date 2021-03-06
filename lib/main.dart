import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:labroute/home/historyPage.dart';
import 'package:labroute/home/helpPage.dart';
import 'package:labroute/home/historyPage2.dart';
import 'package:labroute/loginPage/loginPage_Google.dart';
import 'package:labroute/provider/google_signin.dart';
import 'package:labroute/screen/Profile.dart';
import 'package:labroute/screen/display.dart';
import 'package:labroute/screen/add_screen.dart';
import 'package:labroute/home/BottomNav_home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:labroute/screen/tutorial.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl_standalone.dart';

import 'screen/profile3.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await findSystemLocale();

  Intl.defaultLocale = 'th';
  initializeDateFormatting();

  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  static final String title = 'ทำดี ธรรมดี';
  final String score = '0';
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  // CollectionReference _userCollection =
  //     FirebaseFirestore.instance.collection('users');
  DateTime now = new DateTime.now();

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
          'profile3': (context) => ProfileScreen3(),
          'tutorial': (context) => VideoList2(),
        },
      ));
}

class Pagecontoller extends StatefulWidget {
  @override
  _PagecontollerState createState() => _PagecontollerState();
}

class _PagecontollerState extends State<Pagecontoller> {
  // get _userCollection => FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User> snap) {
          if (snap.data != null) {
            String uid = snap.data.uid;

            return FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection("users")
                    .doc(uid)
                    .get(),
                builder: (context,
                    AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> doc) {
                  if (doc.hasData) {
                    return BottomNavHome(user: snap.data);
                  } else {
                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(uid)
                        .set({
                      "uid": snap.data.uid,
                      "username": snap.data.displayName,
                      "email": snap.data.email,
                      "photoUrl": snap.data.photoURL,
                      "score": 0,
                      'LastLogin': DateTime.now(),
                    });
                    return BottomNavHome(user: snap.data);
                  }
                });
          } else {
            return LoginPage2();
          }
        });
  }
}
