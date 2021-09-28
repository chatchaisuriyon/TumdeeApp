import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:labroute/model/user.dart';

// ignore: must_be_immutable
class ProfileScreen3 extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  // final users = FirebaseFirestore.instance.collection("users");
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  // final String;
  final User user;
  Users profile = Users();
  ProfileScreen3({this.user});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Color gradientStart = Colors.white; //Change start gradient color here
  Color gradientEnd = Colors.yellow[500];
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final String uid = auth.currentUser.uid;
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
            "ข้อมูลส่วนตัว",
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Mitr'),
          ),
          // actions: <Widget>[
          //   IconButton(
          //     icon: const Icon(
          //       AntDesign.arrowleft,
          //       color: Colors.black,
          //     ),
          //     tooltip: 'กลับไปยังหน้า ก่อนหน้านี้',
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          // ],
        ),
        // drawer: SideMenu(),

        body: Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [gradientStart, gradientEnd],
                  begin: const FractionalOffset(0.5, 0.0),
                  end: const FractionalOffset(0.0, 0.5),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Column(children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 20, top: 15),
                  child: Row(
                    children: <Widget>[
                      ClipOval(
                        // width: 80,
                        // height: 80,
                        child: Image.network(
                          auth.currentUser.photoURL,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "สวัสดี 🙏",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            auth.currentUser.displayName,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      )
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      // height: 100,
                      left: 20,
                      top: 15,
                      right: 20,
                      bottom: 20),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.pinkAccent, Colors.pink[400]]),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "คะแนนความดีสะสมของคุณทั้งหมด",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                          Text(
                            "null คะแนน ",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  )),
              Text(
                "🏆 อันดับผู้ใช้งานที่มีคะแนนความดีสูงสุด 🏆",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    fontSize: 18,
                    fontFamily: 'Mitr'),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .where("score")
                      .orderBy("score", descending: true) //จัดเรียงข้อมูล

                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView(
                        children: snapshot.data.docs.map((document) {
                          return Card(
                              elevation: 3,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5.0),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: ListTile(
                                  leading: CircleAvatar(
                                      radius: 23,
                                      // backgroundImage: AssetImage(
                                      //     'assets/images/ic_launcher.png'),
                                      // backgroundImage: NetworkImage(
                                      child:
                                          Image.network(document["photoUrl"])),
                                  title: Text(document["username"],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(8, 8, 8, 50),
                                          fontFamily: 'Mitr')),
                                  // ),
                                  trailing: Text(
                                      document['score'].toString() + ' ความดี',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(8, 8, 8, 85),
                                          fontFamily: 'Mitr')),
                                  // onTap: () {
                                  //   Navigator.of(context).pushNamed(
                                  //       'historypage2',
                                  //       // arguments: {
                                  //       //   'title':
                                  //       //       (document["fname"]),
                                  //       //   'name': (document["lname"]),
                                  //       //   'date': (document["date"]),
                                  //       // }
                                  //       );
                                  // }
                                ),
                              )
                              // )
                              );
                        }).toList(),
                      );
                    }
                  },
                ),
              )),
            ])));
  }
}

// var name;
// Future<void> getName() async {
//   DocumentSnapshot<Map<String, dynamic>> ds =
//       await FirebaseFirestore.instance.collection('users').doc('uid').get();
//   name = ds.get('score');
// }

// String name;
// final firestore = FirebaseFirestore.instance;   //
// FirebaseAuth auth = FirebaseAuth.instance;
// Future<void> getName() async {
//   final String uid = auth.currentUser.uid;
//   DocumentSnapshot document = await FirebaseFirestore.instance.collection('users').doc(uid).get();
// name = document.get('score')
// }

// StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection('YOUR COLLECTION NAME')
//               .doc(id) //ID OF DOCUMENT
//               .snapshots(),
//         builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return new CircularProgressIndicator();
//         }
//         var document = snapshot.data;
//         return new Text(document["name"]);
//      }
//   );
// }

