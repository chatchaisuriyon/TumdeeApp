import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:labroute/screen/add_screen.dart';
import 'package:labroute/home/BottomNav_home_screen.dart';
import 'package:labroute/screen/profile3.dart';

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
          // ListTile(
          //   title: Text('หน้าแรก'),
          //   leading: Icon(Icons.home_outlined),
          //   trailing: Icon(Icons.arrow_right),
          //   onTap: () {
          //     // Navigator.of(context).pushNamed('HomePage');
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             // builder: (context) => DisplayScreen(user: widget.user)));
          //             builder: (context) => BottomNavHome(user: widget.user)));
          //   },
          // ),
          // ListTile(
          //   title: Text('คะแนนความดี'),
          //   leading: Icon(Icons.recommend),
          //   trailing: Icon(Icons.arrow_right),
          //   onTap: () {
          //     Navigator.of(context).pushReplacementNamed('HomePage');
          //   },
          // ),

          // ListTile(
          //   title: Text('เพิ่มบันทึกความดี'),
          //   leading: Icon(Icons.add_outlined),
          //   trailing: Icon(Icons.arrow_right),
          //   onTap: () {
          //     // Navigator.of(context).pushNamed('addtumdee');
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => FormScreen2(user: widget.user)));
          //   },
          // ),

          // ListTile(
          //   title: Text('ประวัติบันทึกความดี'),
          //   leading: Icon(Icons.list_alt),
          //   trailing: Icon(Icons.arrow_right),
          //   onTap: () {
          //     Navigator.of(context).pushNamed('historypage');
          //   },
          // ),

          ListTile(
            title: Text('ข้อมูลแอปพลิเคชัน'),
            leading: Icon(Icons.live_help_outlined),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pushNamed('HelpPage');
            },
          ),

          // ListTile(
          //   title: Text('ข้อมูลส่วนตัว'),
          //   leading: Icon(Icons.account_box_outlined),
          //   trailing: Icon(Icons.arrow_right),
          //   onTap: () {
          //     // Navigator.of(context).pushNamed('profile3');
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) =>
          //                 ProfileScreen3(user: widget.user)));
          //   },
          // ),

          // ListTile(
          //   title: Text('หน้าแรก2'),
          //   leading: Icon(Icons.account_box_outlined),
          //   trailing: Icon(Icons.arrow_right),
          //   onTap: () {
          //     // Navigator.of(context).pushNamed('profile3');
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => Home(user: widget.user)));
          //   },
          // ),

          ListTile(
              title: Text('ออกจากระบบ'),
              leading: Icon(Icons.exit_to_app),
              trailing: Icon(Icons.arrow_right),
              onTap: () async {
                if (await googleSignIn.isSignedIn()) {
                  googleSignIn.signOut();
                }

                auth.signOut().then(
                  (value) {
                    print("sign out success");
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                ).catchError((e) {
                  print(e);
                });
              }),
        ],
      ),
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

      // accountName: Text('ชัชชัย สุริยนต์'),
      // accountEmail: Text('Chatchai.su61@snru.ac.th'),
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
