import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:labroute/model/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

// import '../../../constants.dart';
// import '../../../size_config.dart';

class Info extends StatelessWidget {
  const Info({
    Key key,
  }) : super(key: key);

  static const kPrimaryColor = Color(0xFFFAFA33);
  static const kTextColor = Color(0xFF202E2E);
  static const kTextLigntColor = Color(0xFF7286A5);
  @override
  Widget build(BuildContext context) {
    GoogleSignIn googleSignIn = GoogleSignIn();

    final auth = FirebaseAuth.instance;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true, // this is all you need
          flexibleSpace: Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    const Color(0xFFFAFA33),
                    const Color(0xFFFFFFFF),
                  ],
                  begin: const FractionalOffset(0.3, 0.0),
                  end: const FractionalOffset(1.5, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          title: Text(
            "อื่นๆ",
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Mitr'),
          ),
        ),
        body: Stack(children: <Widget>[
          ClipPath(
              clipper: CustomShape(),
              child: Container(
                height: 190, //150
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    colors: [
                      const Color(0xFFFAFA33),
                      const Color(0xFFFFFFFF),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(1),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(20, 2), // changes position of shadow
                    ),
                  ],
                ),
              )),
          Center(
            child: Column(
                //     mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    // alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 10), //10
                    height: 170, //140
                    width: 180,
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      // border: Border.all(
                      //   color: Colors.white60,
                      //   width: 4, //8
                      // ),
                      image: DecorationImage(
                        alignment: Alignment.center,
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/tumdeeSplash23.png'),
                        // image: NetworkImage(
                        //   auth.currentUser.photoURL,
                        // ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'บัญชีผู้ใช้ : ' + auth.currentUser.displayName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'อีเมลล์ : ' + auth.currentUser.email,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  SizedBox(height: 10),
                  itemmenu(context),
                  SizedBox(height: 20),
                  bottompage(),
                ]),
          ),
          // SizedBox(height: 500),
        ]));
  }

  Widget itemmenu(BuildContext context) {
    GoogleSignIn googleSignIn = GoogleSignIn();
    // double defaultSize = SizeConfig.;
    final auth = FirebaseAuth.instance;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          ListTile(
            tileColor: Colors.yellow[100],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
              Navigator.of(context).pushNamed('tutorial');
            },
          ),
          SizedBox(height: 5), //5
          ListTile(
            tileColor: Colors.yellow[100],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
          SizedBox(height: 5), //5
          ListTile(
            tileColor: Colors.yellow[100],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text(
              'ติดต่อเรา',
              style: TextStyle(
                fontFamily: 'Mitr',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.grey[700],
              ),
            ),
            leading: Icon(Icons.contact_support_outlined),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              launch('https://m.facebook.com/TumdeeApp');
            },
          ),
          SizedBox(height: 5), //5
          ListTile(
              tileColor: Colors.grey[100],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              title: Text(
                'ออกจากระบบ',
                style: TextStyle(
                  fontFamily: 'Mitr',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
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
              }),
        ],
      ),
    );
  }

  Positioned bottompage() {
    return Positioned(
      top: 320,

      // left: 52,
      height: 120,
      // width: 120,

      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'ทำดี ธรรมดี. © 2021\nSakonnakhon Rajabhat University. \nVersion 1.1.0',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
            Container(
              // padding: const EdgeInsets.only(top: 16),
              margin:
                  EdgeInsets.only(left: 140, right: 140, top: 8, bottom: 16),
              width: 100,
              height: 35,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300].withOpacity(1),
                      spreadRadius: 1.5,
                      blurRadius: 2,
                      offset: Offset(1, 1.2), // changes position of shadow
                    ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://eus-www.sway-cdn.com/s/1lXluYDa4tRr3PzF/images/BSJ5eF_kwT9opN?quality=640&allowAnimation=true'),
                    // fit: BoxFit.cover,
                  )),
              // Column(children: <Widget>[
            ),
          ]),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = 238;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
