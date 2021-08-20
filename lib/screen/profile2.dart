//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile extends StatefulWidget {
  final auth = FirebaseAuth.instance;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GoogleSignIn googleSignIn = GoogleSignIn();

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Scaffold(
          //   Container(
          //     width: 60,
          //     height: 60,
          //     child: Icon(
          //       Icons.add
          //     ),
          //     decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         gradient: LinearGradient(
          //           colors: [Colors.deepPurple[800],Colors.deepPurpleAccent],)),
          //   ),
          // ),
          body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  // .where("uid", isEqualTo: widget.user.uid)
                  // .orderBy("date", descending: true) //จัดเรียงข้อมูล
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  AntDesign.arrowleft,
                                  color: Colors.black,
                                ),
                                tooltip: 'กลับไปยังหน้า ก่อนหน้านี้',
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.deepPurple[800],
                                    Colors.deepPurpleAccent
                                  ],
                                ),
                              ),
                              child: Column(children: [
                                SizedBox(
                                  height: 110.0,
                                ),
                                CircleAvatar(
                                  radius: 65.0,
                                  backgroundImage:
                                      NetworkImage(auth.currentUser.photoURL),
                                  backgroundColor: Colors.white,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('Erza Scarlet',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    )),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'S Class Mage',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                )
                              ]),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              color: Colors.grey[200],
                              child: Center(
                                  child: Card(
                                      margin: EdgeInsets.fromLTRB(
                                          0.0, 45.0, 0.0, 0.0),
                                      child: Container(
                                          width: 310.0,
                                          height: 290.0,
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Information",
                                                  style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                                Divider(
                                                  color: Colors.grey[300],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.home,
                                                      color: Colors
                                                          .blueAccent[400],
                                                      size: 35,
                                                    ),
                                                    SizedBox(
                                                      width: 20.0,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Guild",
                                                          style: TextStyle(
                                                            fontSize: 15.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          "FairyTail, Magnolia",
                                                          style: TextStyle(
                                                            fontSize: 12.0,
                                                            color: Colors
                                                                .grey[400],
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.auto_awesome,
                                                      color: Colors
                                                          .yellowAccent[400],
                                                      size: 35,
                                                    ),
                                                    SizedBox(
                                                      width: 20.0,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Magic",
                                                          style: TextStyle(
                                                            fontSize: 15.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Spatial & Sword Magic, Telekinesis",
                                                          style: TextStyle(
                                                            fontSize: 12.0,
                                                            color: Colors
                                                                .grey[400],
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.favorite,
                                                      color: Colors
                                                          .pinkAccent[400],
                                                      size: 35,
                                                    ),
                                                    SizedBox(
                                                      width: 20.0,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Loves",
                                                          style: TextStyle(
                                                            fontSize: 15.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Eating cakes",
                                                          style: TextStyle(
                                                            fontSize: 12.0,
                                                            color: Colors
                                                                .grey[400],
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.people,
                                                      color: Colors
                                                          .lightGreen[400],
                                                      size: 35,
                                                    ),
                                                    SizedBox(
                                                      width: 20.0,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Team",
                                                          style: TextStyle(
                                                            fontSize: 15.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Team Natsu",
                                                          style: TextStyle(
                                                            fontSize: 12.0,
                                                            color: Colors
                                                                .grey[400],
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )))),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                          top: MediaQuery.of(context).size.height * 0.45,
                          left: 20.0,
                          right: 20.0,
                          child: Card(
                              child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    child: Column(
                                  children: [
                                    Text(
                                      'Battles',
                                      style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 14.0),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "ee",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    )
                                  ],
                                )),
                                Container(
                                  child: Column(children: [
                                    Text(
                                      'Birthday',
                                      style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 14.0),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      'April 7th',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    )
                                  ]),
                                ),
                                Container(
                                    child: Column(
                                  children: [
                                    Text(
                                      'Age',
                                      style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 14.0),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      '19 yrs',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    )
                                  ],
                                )),
                              ],
                            ),
                          )))
                    ],
                  );
                }
              }))
    ]);
  }
}
