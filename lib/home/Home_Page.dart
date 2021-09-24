import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:labroute/screen/Video_scren.dart';
import 'package:labroute/widget/custom_slider.dart';
import 'package:labroute/screen/add_screen.dart';
import 'package:labroute/screen/kamkomPage.dart';
import 'package:labroute/screen/profile3.dart';
import 'package:labroute/screen/yt_Playlist.dart';

class HomePage extends StatefulWidget {
  final auth = FirebaseAuth.instance;
  // final users = FirebaseFirestore.instance.collection("users");
  // final users = FirebaseAuth.instance.currentUser;
  final User user;
  HomePage({this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/tumdee-appbar3.png', width: 220),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.grey,
            ),
            tooltip: 'ออกจากแอปพลิเคชัน',
            onPressed: () => exit(0),
            // ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(content: Text('This is a snackbar')));
          ),
        ],
        // leading: Icon(Icons.exit_to_app),

        // elevation: 0,
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
      ),
      body: getBody(user: widget.user),
    );
  }

  Widget getBody({User user}) {
    var size = MediaQuery.of(context).size;
    return ListView(
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Text(
            'สวัสดี 🙏 ยินดีต้อนรับเข้าสู่แอปพลิเคชัน "ทำดี ธรรมดี"',
            textAlign: TextAlign.center,
            style: TextStyle(

                // fontFamily: 'Mitr',
                fontWeight: FontWeight.bold,
                color: Colors.black45),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
          child: Text(
            'เมนูการใช้งาน',
            style: TextStyle(
                shadows: [
                  BoxShadow(
                    color: Colors.grey[300].withOpacity(0.8),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(1, 2), // changes position of shadow
                  ),
                ],
                fontFamily: 'Mitr',
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),

        Container(
          height: 144,
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pushNamed('addtumdee');

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormScreen2(
                                    user: widget.user,
                                  )),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 6),
                        padding: EdgeInsets.only(
                          left: 14,
                        ),
                        height: 64,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300].withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset:
                                  Offset(1, 5), // changes position of shadow
                            ),
                          ],
                          // border: Border.all(color: Colors.black26, width: 0.5),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.post_add_rounded,
                              // fit: BoxFit.contain,
                              color: Colors.black,
                              // height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'เพิ่มบันทึกความดี',
                                    style: TextStyle(
                                        fontFamily: 'Mitr',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  ),
                                  Text(
                                    'บันทึกการทำดีของคุณ',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pushNamed('addtumdee');

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen3(
                                  user: widget.user,
                                )),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 8),
                      padding: EdgeInsets.only(left: 16),
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300].withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(1, 5), // changes position of shadow
                          ),
                        ],
                        // border: Border.all(color: Colors.black26, width: 0.5),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            // fit: BoxFit.contain,
                            color: Colors.black,
                            // height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'โปรไฟล์',
                                  style: TextStyle(
                                      fontFamily: 'Mitr',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                                Text(
                                  'ดูโปรไฟล์ของตนเอง',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pushNamed('addtumdee');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KamkomPage()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 6),
                      padding: EdgeInsets.only(left: 16),
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300].withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(1, 5), // changes position of shadow
                          ),
                        ],
                        // border: Border.all(color: Colors.black26, width: 0.5),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.photo_library_outlined,
                            // fit: BoxFit.contain,
                            color: Colors.black,
                            // height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'คำคมธรรมมะ',
                                  style: TextStyle(
                                      fontFamily: 'Mitr',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                                Text(
                                  'ดูรูปคำคม-สอนใจ',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pushNamed('addtumdee');
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Playlist(
                      //             url:
                      //                 "https://flutter-youtube-tumdee.herokuapp.com/",
                      //             title: "Flutter")));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => VideoPage()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 8),
                      padding: EdgeInsets.only(left: 16),
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300].withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(1, 5), // changes position of shadow
                          ),
                        ],
                        // border: Border.all(color: Colors.black26, width: 0.5),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.video_collection_outlined,
                            // fit: BoxFit.contain,
                            color: Colors.black,
                            // height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'ฟังธรรม',
                                  style: TextStyle(
                                      fontFamily: 'Mitr',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                                Text(
                                  'รับฟังธรรมมะดีๆ',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              )
            ],
          ),
        ),

        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     SizedBox(
        //       height: 15,
        //     )
        //   ],
        // ),
        SizedBox(
          height: 15,
        ),
        CustomSliderWidget(
          items: [
            "assets/images/slide_3.jpg",
            "assets/images/slide_4.jpg",
            "assets/images/slide_1.jpg.png",
            "assets/images/slide_2.jpg",
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
          ),
          child: Text(
            'ประชาสัมพันธ์',
            style: TextStyle(
                shadows: [
                  BoxShadow(
                    color: Colors.grey[300].withOpacity(0.8),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(1, 2), // changes position of shadow
                  ),
                ],
                fontFamily: 'Mitr',
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
        Container(
            padding: const EdgeInsets.only(top: 16),
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            width: size.width - 30,
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300].withOpacity(0.8),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(1, 4), // changes position of shadow
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://scontent.fbkk5-5.fna.fbcdn.net/v/t1.6435-9/235493939_104144595316858_1747477014279677145_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=e3f864&_nc_eui2=AeGYSOkIxXDmN8JrdwuVKJ1yGmkeUJDHfHsaaR5QkMd8e11vdoZGk1wJ5wFXtobksUFmh7rLJPK_WC9t-J6ikASq&_nc_ohc=_idwOUS-KIQAX9xr8jp&_nc_ht=scontent.fbkk5-5.fna&oh=0e86a97d76423aadafd96537fdf12a3a&oe=617192E7'),
                  // fit: BoxFit.cover,
                ))),
        Container(
            padding: const EdgeInsets.only(top: 16),
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            width: size.width - 30,
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300].withOpacity(0.8),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(1, 4), // changes position of shadow
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://scontent.fbkk5-5.fna.fbcdn.net/v/t39.30808-6/242610354_1829272697275637_3455910038477677124_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=730e14&_nc_eui2=AeEV7Lg4S4ejaD61Juhx5cHQH9-75AHUebof37vkAdR5us8SpBXpn186YeEKxSiZI9DKeLO6CFD5tMC3Itj0yge9&_nc_ohc=AXB5JO-jtk0AX9ikq8w&tn=jdtvU9trbGifRpud&_nc_ht=scontent.fbkk5-5.fna&oh=9f9de0e737ed5d90abe11b4ca9705073&oe=61520BE1'),
                  // fit: BoxFit.cover,
                ))),

        Container(
            padding: const EdgeInsets.only(top: 16),
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            width: size.width - 30,
            height: size.height / 1.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300].withOpacity(0.8),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(1, 4), // changes position of shadow
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://scontent.fbkk5-5.fna.fbcdn.net/v/t1.6435-9/242262919_3022049524742270_2926032353966387856_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=730e14&_nc_eui2=AeEWTSbfFEfUx4tMSeqb0QzimozbSrHnDHSajNtKsecMdKl7EqqrvnO06DoTU1hhfhwuPRMtnt0JZmo637201zh1&_nc_ohc=pq4KIIVuVMYAX_UdO0Z&_nc_ht=scontent.fbkk5-5.fna&oh=78a5eaffd51e7321c08dcb710996bf91&oe=6171E9F7'),
                  // fit: BoxFit.cover,
                ))),
        Container(
            padding: const EdgeInsets.only(top: 16),
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            width: size.width - 30,
            height: size.height / 2.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300].withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(1, 5), // changes position of shadow
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://scontent.fbkk5-4.fna.fbcdn.net/v/t1.6435-9/242274875_857346528280065_443640045813603257_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=730e14&_nc_eui2=AeGlCkHOixC9tuExgR4RxQEdm865tVLxuGSbzrm1UvG4ZH0iQYRruYQ0cw9CDW1MLcRyVaTvqTNE7wO7Apy9TcrT&_nc_ohc=VSUl67ZYPCMAX9mW8i4&_nc_ht=scontent.fbkk5-4.fna&oh=1c6055d33de0fb05ca9d04c488de0ec3&oe=6173B2B9'),
                  // fit: BoxFit.cover,
                ))),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(children: <Widget>[
            Text(
              'ทำดี ธรรมดี. © 2021\nSakonnakhon Rajabhat University. ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
            Container(
              // padding: const EdgeInsets.only(top: 16),
              margin:
                  EdgeInsets.only(left: 140, right: 140, top: 8, bottom: 16),
              // width: 100,
              height: 40,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300].withOpacity(1),
                      spreadRadius: 1.5,
                      blurRadius: 2,
                      offset: Offset(2, 4), // changes position of shadow
                    ),
                  ],
                  image: DecorationImage(
                    // fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://eus-www.sway-cdn.com/s/1lXluYDa4tRr3PzF/images/BSJ5eF_kwT9opN?quality=640&allowAnimation=true'),
                    // fit: BoxFit.cover,
                  )),
              // Column(children: <Widget>[
            ),
          ]),
        )
        // ),
        // ),
        // Container(
        //   width: size.width,
        //   decoration: BoxDecoration(color: textFieldColor),
        //   child: Padding(
        //     padding: EdgeInsets.only(top: 10, bottom: 10),
        //     child: Container(
        //       decoration: BoxDecoration(color: white),
        //       child: Padding(
        //         padding: const EdgeInsets.only(
        //           top: 15,
        //           bottom: 15,
        //         ),
        //         child: SingleChildScrollView(
        //           scrollDirection: Axis.horizontal,
        //           child: Container(
        //             margin: EdgeInsets.only(left: 30),
        //             child: Row(
        //                 children: List.generate(categories.length, (index) {
        //               return Padding(
        //                 padding: const EdgeInsets.only(right: 35),
        //                 child: Column(
        //                   children: [
        //                     SvgPicture.asset(
        //                       categories[index]['img'],
        //                       width: 40,
        //                     ),
        //                     SizedBox(
        //                       height: 15,
        //                     ),
        //                     Text(
        //                       categories[index]['name'],
        //                       style: customParagraph,
        //                     )
        //                   ],
        //                 ),
        //               );
        //             })),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // SizedBox(
        //   height: 15,
        // ),
      ],
    );
  }
}
