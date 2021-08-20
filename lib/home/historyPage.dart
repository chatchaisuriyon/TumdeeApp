import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HistoryPage extends StatefulWidget {
  final User user;
  HistoryPage({this.user});
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        // leading: BackHome(),
        title: Text("ประวัติบันทึกความดี",
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Mitr')),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Tumdee")
            // .where("uid", isEqualTo: widget.user.uid)
            .orderBy("date", descending: true) //จัดเรียงข้อมูล
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
                    elevation: 2.5,
                    margin:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    child: ListTile(
                      title: Text(document["fname"]),
                      subtitle: Text(document["date"]),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/ic_launcher.png'),
                        radius: 25,
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('historypage2', arguments: {
                          'title': (document["fname"]),
                          'name': (document["lname"]),
                          'date': (document["date"]),
                        });
                      },
                      // )
                      // ],
                    ));
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
