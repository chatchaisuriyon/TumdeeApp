import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labroute/screen/display.dart';

import 'loginPage_Google.dart';

class Errorpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          ////////////////////////
          print("########");
          print(snapshot.hasData);
          
          ////////////////////////
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else if (snapshot.hasData) {
            return DisplayScreen();
          } else if (snapshot.hasError) {
            return Center(child: Text('มีบางอย่างผิดปกติ'));
          } else {
            return LoginPage2();
          }
        },
      ));
}
