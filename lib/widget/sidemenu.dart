import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
// import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:labroute/screen/add_screen.dart';
// import 'package:labroute/home/BottomNav_home_screen.dart';
// import 'package:labroute/screen/profile3.dart';

class SideMenu extends StatefulWidget {
  final auth = FirebaseAuth.instance;
  final User user;
  SideMenu({this.user});
  @override
  _State createState() => _State();
}

class _State extends State<SideMenu> {
  GoogleSignIn googleSignIn = GoogleSignIn();

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
          _buildDrawerHeader(),
          

          ListTile(
            title: Text(
              'วิธีการใช้งานแอปพลิเคชัน',
              style: TextStyle(
                fontFamily: 'Mitr',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.grey[700],
              ),
            ),
            leading: Icon(Icons.list_alt),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              // Navigator.of(context).pushNamed('historypage');
            },
          ),

          ListTile(
            title: Text(
              'ข้อมูลแอปพลิเคชัน',
              style: TextStyle(
                fontFamily: 'Mitr',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.grey[700],
              ),
            ),
            leading: Icon(Icons.live_help_outlined),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pushNamed('HelpPage');
            },
          ),

        
          ListTile(
              title: Text(
                'ออกจากระบบ',
                style: TextStyle(
                  fontFamily: 'Mitr',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              leading: Icon(Icons.exit_to_app),
              trailing: Icon(Icons.arrow_right),
              onTap: () async {
                
                showDialog(
                    builder: (ctxt) {
                      return AlertDialog(
                        contentPadding:
                            const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
                        title: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 30,
                              // top: 26,
                            ),
                          ),
                          Icon(Icons.exit_to_app, size: 30),
                          Text(
                            ' ออกจากระบบ',
                            style: TextStyle(
                              fontFamily: 'Mitr',
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ]),
                        content: Text(
                          "คุณต้องการออกจากระบบใช่หรือไม่?",
                          style: TextStyle(
                            fontFamily: 'Mitr',
                            // fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  // primary: Colors.red,
                                  onPrimary: Colors.red,
                                  textStyle: const TextStyle(fontSize: 16),
                                ),
                                child: Text(
                                  "ยกเลิก",
                                  style: TextStyle(
                                    fontFamily: 'Mitr',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    // primary: Colors.green,
                                    onPrimary: Colors.white,
                                    textStyle: const TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  child: Text(
                                    "ตกลง",
                                    style: TextStyle(
                                      fontFamily: 'Mitr',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (await googleSignIn.isSignedIn()) {
                                      googleSignIn.signOut();
                                    }

                                    auth.signOut().then(
                                      (value) {
                                        print("sign out success");
                                        Navigator.of(context)
                                            .popUntil((route) => route.isFirst);
                                      },
                                    ).catchError(
                                      (e) {
                                        print(e);
                                      },
                                    );
                                  })
                            ],
                          ),
                        ],
                        // )
                      );
                    },
                    context: context);
              })
        ])
        );
  }

  Widget _buildDrawerHeader() {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        gradient:
            RadialGradient(colors: [Colors.white, Colors.yellow], radius: 0.6),
      ),
      child: UserAccountsDrawerHeader(
        margin: EdgeInsets.zero,
        accountName: Text(
          'ยินดีต้อนรับสู่แอปพลิเคชัน ทำดี ธรรมดี',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Mitr'),
        ),
        accountEmail: Text(
          auth.currentUser.displayName,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(auth.currentUser.photoURL)),

        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Center(
        //       child: Image(
        //         image: AssetImage('assets/images/logo_drawer.png'),
        //         // width: 100,
        //       ),
        //     ),

        //     Center(
        //       child: Image(
        //         image: AssetImage('assets/images/tumdee_drawer.png'),
        //         // height: 100,
        //       ),
        //     ),

        // Center(
        // child: Image(
        //   image: AssetImage('assets/images/tumdeelogo.png'),
        //   width: 100,
        // ),
        // ],
        // )
      ),
    );
  }
}
