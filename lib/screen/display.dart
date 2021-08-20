import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class DisplayScreen extends StatefulWidget {
  final User user;
  DisplayScreen({this.user});

  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade400,
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
        // title: Text(
        //   "หน้าหลัก บันทึกความดี",
        //   style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Mitr'),

        // )
        title: Image.asset('assets/images/tumdee.png'),
      ),
      // drawer: SideMenu(
      //   user: widget.user,
      // ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Tumdee")
            .where("uid", isEqualTo: widget.user.uid)
            .orderBy("date", descending: true) //จัดเรียงข้อมูล
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child:
                  CircularProgressIndicator(semanticsLabel: 'กำลังโหลดข้อมูล'),
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
                            backgroundImage:
                                AssetImage('assets/images/ic_launcher.png'),
                            radius: 30,
                            child: FittedBox(
                                // child: Text(document["score"]),
                                ),
                          ),
                          title: Text(document["fname"]
                              // + document["lname"]
                              ),
                          subtitle: Text(document["lname"]),
                          trailing: Text(document["date"]),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('historypage2', arguments: {
                              'title': (document["fname"]),
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
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => FormScreen2(
      //                 user: widget.user,
      //               )),
      //     );
      //   },
      //   label: Text('เพิ่มความดี', style: TextStyle(fontSize: 18)),
      //   icon: Icon(Icons.recommend),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
