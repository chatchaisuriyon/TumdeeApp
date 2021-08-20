import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:labroute/model/user.dart';

// ignore: must_be_immutable
class ProfileScreen3 extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  final users = FirebaseFirestore.instance.collection("users");
  final User user;
  Users profile = Users();
  ProfileScreen3({this.user});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Color gradientStart = Colors.white; //Change start gradient color here
  Color gradientEnd = Colors.yellow[500];
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  CollectionReference _studentCollection =
      FirebaseFirestore.instance.collection("Tumdee");
  CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("users");

  // final point = FirebaseFirestore.instance.collection("users").doc(user.uid).snapshots();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

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

        body: StreamBuilder(
            // stream: FirebaseFirestore.instance.collection("users").doc(user.uid).get().then((value.data["index"]),
            // .orderBy("date", descending: true) //จัดเรียงข้อมูล
            stream: FirebaseFirestore.instance
                .collection("users")
                .where("uid", isEqualTo: user.uid)
                // .orderBy("date", descending: true) //จัดเรียงข้อมูล
                .snapshots(),
            // .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var document = snapshot.data;
                return Container(
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
                          padding: EdgeInsets.only(left: 20, top: 10),
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
                                    "สวัสดี,",
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
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 20, top: 20, right: 20, bottom: 20),
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.pinkAccent,
                                  Colors.pink[400]
                                ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
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
                                    "คะแนน",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 42),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "ประวัติการทำความดีของคุณ",
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Mitr'),
                      ),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("Tumdee")
                              .where("uid", isEqualTo: user.uid)
                              .orderBy("date",
                                  descending: true) //จัดเรียงข้อมูล

                              .snapshots(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                        padding: EdgeInsets.symmetric(
                                            // horizontal: 5.0,
                                            vertical: 5.0),
                                        // height: MediaQuery.of(context).size.height * 0.12,
                                        // child: Card(
                                        //   color: Colors.yellow[100],
                                        //   elevation: 3,
                                        //   margin: const EdgeInsets.symmetric(
                                        //       vertical: 6, horizontal: 10),

                                        child: ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'assets/images/ic_launcher.png'),
                                              radius: 30,
                                              child: FittedBox(
                                                  // child: Text(document["score"]),
                                                  ),
                                            ),
                                            title: Text(document['fname']),
                                            // + document["lname"]
                                            // ),
                                            subtitle: Text(document["date"]),
                                            // trailing: Text(document["date"]),
                                            onTap: () {
                                              Navigator.of(context).pushNamed(
                                                  'historypage2',
                                                  arguments: {
                                                    'title':
                                                        (document["fname"]),
                                                    'name': (document["lname"]),
                                                    'date': (document["date"]),
                                                  });
                                            }),
                                      )
                                      // )
                                      );
                                }).toList(),
                              );
                            }
                          },
                        ),
                        //listwiew อันเดิม

                        // Expanded(
                        //   child: ListView.builder(
                        //     itemBuilder: (BuildContext context, int index) {

                        //       return Padding(
                        //         padding: EdgeInsets.only(
                        //             left: 20, right: 20, top: 10),
                        //         child: Container(
                        //           decoration: BoxDecoration(
                        //             borderRadius:
                        //                 BorderRadius.all(Radius.circular(10)),
                        //             color: Color.fromRGBO(55, 65, 104, 1),
                        //           ),
                        //           child: ListTile(
                        //             title: Text(
                        //               "Transaction $index",
                        //               style: TextStyle(
                        //                   fontWeight: FontWeight.bold,
                        //                   color: Colors.white),
                        //             ),
                        //             subtitle: Text(
                        //               "Some brief detail of transaction no $index",
                        //               style: TextStyle(color: Colors.white),
                        //             ),
                        //             contentPadding: EdgeInsets.only(
                        //                 left: 16, right: 16, top: 5, bottom: 5),
                        //             trailing: Text(
                        //               "DEBIT",
                        //               style: TextStyle(
                        //                   fontWeight: FontWeight.bold,
                        //                   color: Colors.greenAccent),
                        //             ),
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //   ),
                        // )
                      ))
                    ]));
              }
            }));
  }
}
