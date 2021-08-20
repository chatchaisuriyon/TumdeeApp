import 'package:flutter/material.dart';
import 'package:labroute/home/helpPage.dart';
import 'package:labroute/home/historyPage.dart';
import 'package:labroute/model/user.dart';
import 'package:labroute/screen/Home_Page.dart';
import 'package:labroute/screen/formscreen.dart';

import 'package:labroute/widget/sidemenu.dart';


import 'profile3.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



@immutable
// ignore: must_be_immutable
class Home extends StatefulWidget {
  final auth = FirebaseAuth.instance;
  final users = FirebaseFirestore.instance.collection("users");
  // final users = FirebaseAuth.instance.currentUser;
  final User user;
  Users profile = Users();
  Home({this.user});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    TransactionsScreen(),
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
        notchMargin: 6,
        child: Container(
          height: 67,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 20,
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
                      children: <Widget>[
                        Icon(
                          Icons.home_outlined,
                          color:
                              currentTab == 0 ? Colors.blue : Colors.grey[600],
                        ),
                        Text(
                          'หน้าแรก',
                          style: TextStyle(
                            fontFamily: 'Mitr',
                            fontWeight: FontWeight.bold,
                            color: currentTab == 0
                                ? Colors.blue
                                : Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 20,
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
                            fontFamily: 'Mitr',
                            fontWeight: FontWeight.bold,
                            color: currentTab == 1
                                ? Colors.blue
                                : Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                      padding: EdgeInsets.only(left: 17, top: 26),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Icon(
                          //   Icons.history,
                          //   color: currentTab == 1 ? Colors.blue : Colors.grey,
                          // ),
                          Text(
                            'เพิ่มความดี',
                            style: TextStyle(
                              fontFamily: 'Mitr',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
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
                  MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        currentScreen = TransactionsScreen(
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
                            fontFamily: 'Mitr',
                            fontWeight: FontWeight.bold,
                            color: currentTab == 2
                                ? Colors.blue
                                : Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = SideMenu(
                            user: widget
                                .user); // if user taps on this dashboard tab will be active
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
                            fontFamily: 'Mitr',
                            color: currentTab == 3
                                ? Colors.blue
                                : Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            // fontFamily: 'Mitr'
                          ),
                        ),
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
