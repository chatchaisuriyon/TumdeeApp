import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  final User user;
  ProfileScreen({this.user});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              // .where("uid", isEqualTo: widget.user.uid)
              .orderBy("date", descending: true) //จัดเรียงข้อมูล
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 73),
                      child: Column(children: <Widget>[
                        Expanded(
                            child: Stack(fit: StackFit.expand, children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.white, Colors.yellow],
                                begin: FractionalOffset.bottomCenter,
                                end: FractionalOffset.center,
                              ),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: IconButton(
                                  icon: const Icon(
                                    AntDesign.arrowleft,
                                    color: Colors.black,
                                  ),
                                  tooltip: 'กลับไปยังหน้า ก่อนหน้านี้',
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'ข้อมูลส่วนตัว',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 34,
                              fontFamily: 'Mitr',
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),

                          //ดึงรูป display จาก firebase
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                child: Image.network(
                                  auth.currentUser.photoURL,
                                  width: width * 0.40,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          Container(
                            height: height * 0.40,
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                double innerHeight = constraints.maxHeight;
                                double innerWidth = constraints.maxWidth;
                                return Stack(
                                  fit: StackFit.expand,
                                  children: <Widget>[
                                    Expanded(
                                      child: Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          height: innerHeight * 0.72,
                                          width: innerWidth,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 3,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    6), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: <Widget>[
                                              SizedBox(
                                                height: 40,
                                              ),

                                              //ดึงค่า email จาก firestore
                                              Text(
                                                auth.currentUser.displayName,
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      39, 105, 171, 1),
                                                  fontFamily: 'Ekkamai',
                                                  fontSize: 37,
                                                ),
                                              ),

                                              //ดึงค่า email จาก firestore
                                              Text(
                                                auth.currentUser.email,
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      39, 105, 171, 1),
                                                  fontFamily: 'Ekkamai',
                                                  fontSize: 20,
                                                ),
                                              ),

                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Column(
                                                    children: <Widget>[
                                                      Expanded(
                                                        child: Text(
                                                          "คะแนนความดีของคุณ",
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[700],
                                                            fontFamily:
                                                                'Nunito',
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 25,
                                                        vertical: 8,
                                                      ),
                                                      child: Container(
                                                        height: 3,
                                                        width: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    children: <Widget>[
                                                      Expanded(
                                                        child: Text(
                                                          '10',
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    39,
                                                                    105,
                                                                    171,
                                                                    1),
                                                            fontFamily:
                                                                'Nunito',
                                                            fontSize: 25,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      //icon ฟันเฟือง
                                      // Positioned(
                                      //   top: 110,
                                      //   right: 20,
                                      //   child: Icon(
                                      //     AntDesign.setting,
                                      //     color: Colors.grey[700],
                                      //     size: 30,
                                      //   ),
                                      // ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // Container(
                          //   height: height * 0.5,
                          //   width: width,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(30),
                          //     color: Colors.white,
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.symmetric(horizontal: 15),
                          //     child: Column(
                          //       children: [
                          //         SizedBox(
                          //           height: 20,
                          //         ),
                          //         Text(
                          //           'My Orders',
                          //           style: TextStyle(
                          //             color: Color.fromRGBO(39, 105, 171, 1),
                          //             fontSize: 27,
                          //             fontFamily: 'Nunito',
                          //           ),
                          //         ),
                          //         Divider(
                          //           thickness: 2.5,
                          //         ),
                          //         SizedBox(
                          //           height: 10,
                          //         ),
                          //         Container(
                          //           height: height * 0.15,
                          //           decoration: BoxDecoration(
                          //             color: Colors.grey,
                          //             borderRadius: BorderRadius.circular(30),
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           height: 10,
                          //         ),
                          //         Container(
                          //           height: height * 0.15,
                          //           decoration: BoxDecoration(
                          //             color: Colors.grey,
                          //             borderRadius: BorderRadius.circular(30),
                          //           ),
                          //         ),
                          // ],
                          // ),
                          //   ),
                          // )
                        ]))
                      ])));
            }
          }),
    );
  }
}
