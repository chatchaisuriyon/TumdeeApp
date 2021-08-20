import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:labroute/home/BottomNav_home_screen.dart';


class LoginPage2 extends StatefulWidget {
  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //
            buildLogo(),
            buildText1(),
            buildText2(),
            buildButton(),
          ],
        ),
      ),
    );
  }

  Positioned buildLogo() {
    return Positioned(
      top: 180,
      left: 100,
      height: 170,
      // alignment: Alignment.center,
      child: Image.asset(
        'assets/images/tumdeelogo.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Positioned buildText1() {
    return Positioned(
      top: 340,
      left: 90,
      width: 210,
      // alignment: Alignment.center,
      child: Image.asset(
        'assets/images/tumdee.png',
      ),
    );
  }

  Positioned buildText2() {
    return Positioned(
      top: 400,
      left: 50,
      width: 285,
      // alignment: Alignment.center,
      child: Image.asset(
        'assets/images/tumdee2.png',
      ),
    );
  }

  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount _user;

  GoogleSignInAccount get user => _user;

  Future<User> googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return null;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user;
  }

  Positioned buildButton() {
    return Positioned(
      right: 20,
      left: 20,
      bottom: 100,
      child: Container(
        height: 120,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            // SizedBox(
            // height: 50,
            // width: double.infinity,
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                // primary: Colors.white, // background
                // onPrimary: Colors.black, // foreground
                minimumSize: Size(double.infinity, 50),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              icon:
                  // ImageIcon(
                  //   AssetImage("assets/images/Google_icon.png"),
                  //   size: 60,
                  //   color: Color(0xFF3A5A98),
                  // ),

                  FaIcon(
                FontAwesomeIcons.google,
                // color: Colors.red,
              ),
              label: Text("เข้าสู่ระบบด้วยบัญชี Google",
                  style: TextStyle(fontSize: 18)),
              onPressed: () async {
                await googleLogin().then((user) {
                  print("success");
                  print(user.uid);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder: (context) => DisplayScreen(
                        builder: (context) => BottomNavHome(
                          user: user,
                        ),
                      ));
                  //Navigator.pushNamed(context, 'HomePage');
                }).catchError((e) {
                  print('$e');
                });
              },
            ),
            // ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Text(
              'หากไม่มีบัญชี Google จะไม่สามารถเข้าสู่ระบบได้',
              style: TextStyle(color: Colors.black45),
            ),
            //
          ],
        ),
      ),
    );
  }
}
