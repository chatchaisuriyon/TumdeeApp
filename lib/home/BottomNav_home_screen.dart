import 'package:flutter/material.dart';
import 'package:labroute/home/helpPage.dart';
import 'package:labroute/home/historyPage.dart';
import 'package:labroute/model/user.dart';
import 'package:labroute/home/Home_Page.dart';
import 'package:labroute/screen/add_screen.dart';
import 'package:labroute/screen/info.dart';

import 'package:labroute/widget/sidemenu.dart';

import 'package:labroute/screen/profile3.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

@immutable
// ignore: must_be_immutable
class BottomNavHome extends StatefulWidget {
  final auth = FirebaseAuth.instance;
  final users = FirebaseFirestore.instance.collection("users");
  // final users = FirebaseAuth.instance.currentUser;
  final User user;
  Users profile = Users();
  BottomNavHome({this.user});

  @override
  _BottomNavHomeState createState() => _BottomNavHomeState();
}

class _BottomNavHomeState extends State<BottomNavHome> {
  // Properties & Variables needed
  User user;
  @override
  // ignore: must_call_super
  void initState() {
    user = widget.user;
  }

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    HomePage(),
    HistoryPage(),
    ProfileScreen3(),
    HelpPage(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();

  // Widget currentScreen = DisplayScreen(); // Our first view in viewport
  Widget currentScreen = HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FormScreen2(
                      user: widget.user,
                    )),
          );
        },
        // label: Text('เพิ่มความดี'),
        child: Icon(Icons.add), tooltip: 'กดปุ่ม เพื่อเพิ่มบันทึกความดี',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        elevation: 50,
        notchMargin: 6,
        child: Container(
          height: 67,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // SizedBox(
                  //   width: 4,
                  // ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = HomePage(
                            user: widget
                                .user); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Icon(
                          Icons.home_outlined,
                          // size: ,
                          color:
                              currentTab == 0 ? Colors.blue : Colors.grey[600],
                        ),
                        Text(
                          'หน้าแรก',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Mitr',
                            // fontWeight: FontWeight.bold,
                            color: currentTab == 0
                                ? Colors.blue
                                : Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = HistoryPage(
                            user: widget
                                .user); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.history,
                          color:
                              currentTab == 1 ? Colors.blue : Colors.grey[600],
                        ),
                        Text(
                          'ประวัติ',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Mitr',
                            // fontWeight: FontWeight.bold,
                            color: currentTab == 1
                                ? Colors.blue
                                : Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                      padding: EdgeInsets.only(
                        left: 1,
                        top: 24,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            '   เพิ่มความดี',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Mitr',
                              // fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ))
                  // ),
                ],
              ),
              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     left: 17,
                  //     // top: 26,
                  //   ),
                  // child: SizedBox(
                  //   width: 0,
                  // ),
                  // ),
                  // Padding(padding: EdgeInsets.only(left: 50)),
                  MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        currentScreen = ProfileScreen3(
                            user: widget
                                .user); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.account_box_outlined,
                          color:
                              currentTab == 2 ? Colors.blue : Colors.grey[600],
                        ),
                        Text(
                          'โปรไฟล์',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Mitr',
                            // fontWeight: FontWeight.bold,
                            color: currentTab == 2
                                ? Colors.blue
                                : Colors.grey[800],
                          ),
                        ),
                        //
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        currentScreen = Info();
                        // user: widget
                        //     .user); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.menu_rounded,
                          color:
                              currentTab == 3 ? Colors.blue : Colors.grey[600],
                        ),
                        Text(
                          ' อื่นๆ ',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Mitr',
                            color: currentTab == 3
                                ? Colors.blue
                                : Colors.grey[800],
                            // fontWeight: FontWeight.bold,
                            // fontFamily: 'Mitr'
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 20,
                            // top: 26,
                          ),
                          child: SizedBox(
                            width: 0,
                          ),
                        ),
                        // SizedBox(
                        //   width: 35,
                        // ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
