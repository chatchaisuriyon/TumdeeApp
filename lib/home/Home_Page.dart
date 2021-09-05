import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Playlist(
                                  url:
                                      "https://flutter-youtube-tumdee.herokuapp.com/",
                                  title: "Flutter")));
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
                      'https://scontent.fbkk5-3.fna.fbcdn.net/v/t1.6435-9/226534254_104178655313452_7822950744357451989_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=e3f864&_nc_eui2=AeEcAUK19go9GxWIBtphYoOVx_t8XCpoudTH-3xcKmi51FgBw2BhSykmz98cv3F2N4SM8fkt_OX1HE-vEBn8owKI&_nc_ohc=rYJjTrcAyf4AX_Vo_qt&_nc_ht=scontent.fbkk5-3.fna&oh=8097829f3b2317e008cc60b10a57d07d&oe=613FD809'),
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
                      'https://scontent.fbkk5-4.fna.fbcdn.net/v/t1.6435-9/211087840_859056268044470_2864318519352900926_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=730e14&_nc_eui2=AeFknjFCheyLGJqoxQxIb4w51jcQxm9qFxTWNxDGb2oXFI9CPRnzTPyUb8MUgQlN5Wj5PcwPbInVgg2ZlcfpD5m7&_nc_ohc=GH0b8oCz-GEAX_JUpbq&tn=SQfD8uecItUX4IYs&_nc_ht=scontent.fbkk5-4.fna&oh=0773a2ea7eff3663b19ae81774b5f8d4&oe=6140D5C3'),
                  // fit: BoxFit.cover,
                ))),

        Container(
            padding: const EdgeInsets.only(top: 16),
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            width: size.width - 30,
            height: size.height / 2.3,
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
                      'https://scontent.fbkk5-1.fna.fbcdn.net/v/t1.6435-9/233600464_832967007384684_7382334395645421642_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=730e14&_nc_eui2=AeFxr3GSz0VoeMPx13d5W4m626WvbEQXHHzbpa9sRBccfAcrU27bRqTrFHzakM6auUIbY8lTkoKzvH-vEHhaswxC&_nc_ohc=RJs1ZTLeK98AX-TFYAc&_nc_ht=scontent.fbkk5-1.fna&oh=9130cda44924a8019847090139614c1f&oe=61412AD7'),
                  // fit: BoxFit.cover,
                ))),
        Container(
            padding: const EdgeInsets.only(top: 16),
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            width: size.width - 30,
            height: 150,
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
                      'https://scontent.fbkk5-6.fna.fbcdn.net/v/t1.6435-9/225096071_832047080810010_9155465596947951832_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=730e14&_nc_eui2=AeGKfWnVVPz5xmFAOlTVQsvF_TmQy94Fld39OZDL3gWV3XWFMJaaUlNzSCqF6VHMJd04MrDiDGu3NALpkrsEg74e&_nc_ohc=osfbN8wbgMUAX_TGh6w&_nc_ht=scontent.fbkk5-6.fna&oh=3ae0898610a949637e54a89bcf703078&oe=614203DC'),
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
