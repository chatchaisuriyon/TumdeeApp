import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labroute/widget/BackHome.dart';

class KamkomPage extends StatefulWidget {
  @override
  _KamkomPageState createState() => _KamkomPageState();
}

class _KamkomPageState extends State<KamkomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "คำคมธรรมะ",
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Mitr'),
        ),
        leading: BackHome(),
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
      // drawer: BackHome(),
      body: getKamkom(),
    );
  }

  Widget getKamkom({User user}) {
    var size = MediaQuery.of(context).size;
    return ListView(physics: ClampingScrollPhysics(), children: <Widget>[
      Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 14,
        ),
        child: Text(
          'คำคมธรรมะ - คติสอนใจ',
          textAlign: TextAlign.center,
          style: TextStyle(
            // shadows: [
            //   BoxShadow(
            //     color: Colors.grey[300].withOpacity(0.6),
            //     spreadRadius: 1,
            //     blurRadius: 1,
            //     offset: Offset(1, 2), // changes position of shadow
            //   ),
            // ],
            // fontFamily: 'Mitr',
            // fontWeight: FontWeight.bold,
            fontSize: 18,
            // color: Colors.black87
          ),
        ),
      ),
      // Container(
      //   padding: const EdgeInsets.only(top: 16),
      //   margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      //   width: size.width - 30,
      //   height: 160,
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(10),
      //       boxShadow: [
      //         BoxShadow(
      //           color: Colors.grey[300].withOpacity(1),
      //           spreadRadius: 1.5,
      //           blurRadius: 2,
      //           offset: Offset(2, 4), // changes position of shadow
      //         ),
      //       ],
      //       image: DecorationImage(
      //         fit: BoxFit.cover,
      //         image: NetworkImage(
      //             'https://scontent.fbkk5-3.fna.fbcdn.net/v/t1.6435-9/226534254_104178655313452_7822950744357451989_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=e3f864&_nc_eui2=AeEcAUK19go9GxWIBtphYoOVx_t8XCpoudTH-3xcKmi51FgBw2BhSykmz98cv3F2N4SM8fkt_OX1HE-vEBn8owKI&_nc_ohc=rYJjTrcAyf4AX_Vo_qt&_nc_ht=scontent.fbkk5-3.fna&oh=8097829f3b2317e008cc60b10a57d07d&oe=613FD809'),
      //         // fit: BoxFit.cover,
      //       )),
      // ),
      Container(
        padding: const EdgeInsets.only(top: 16),
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        width: size.width - 30,
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300].withOpacity(1),
                spreadRadius: 1.5,
                blurRadius: 2,
                offset: Offset(2, 4), // changes position of shadow
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/slide_3.jpg'),
              // fit: BoxFit.cover,
            )),
      ),
      Container(
        padding: const EdgeInsets.only(top: 16),
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        width: size.width - 30,
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300].withOpacity(1),
                spreadRadius: 1.5,
                blurRadius: 2,
                offset: Offset(2, 4), // changes position of shadow
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/slide_4.jpg'),
              // fit: BoxFit.cover,
            )),
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
                color: Colors.grey[300].withOpacity(1),
                spreadRadius: 1.5,
                blurRadius: 2,
                offset: Offset(2, 4), // changes position of shadow
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/slide_2.jpg'),
              // fit: BoxFit.cover,
            )),
      ),
      Container(
        padding: const EdgeInsets.only(top: 16),
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        width: size.width - 30,
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300].withOpacity(1),
                spreadRadius: 1.5,
                blurRadius: 2,
                offset: Offset(2, 4), // changes position of shadow
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/slide_1.jpg.png'),
              // fit: BoxFit.cover,
            )),
      ),
      // Padding(
      //   padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      //   child: Text(
      //     'รกฺเขยฺย อตฺตโน สาธุํ ลวณํ โลณตํ ยถา',
      //     textAlign: TextAlign.center,
      //     style: TextStyle(

      //         // fontFamily: 'Mitr',
      //         fontWeight: FontWeight.bold,
      //         color: Colors.black45),
      //   ),
      // ),
      // Padding(
      //   padding: EdgeInsets.only(
      //     left: 16,
      //     right: 16,
      //   ),
      //   child: Text(
      //     '" พึงรักษาความดีของตนไว้ ดังเกลือรักษาความเค็ม "',
      //     textAlign: TextAlign.center,
      //     style: TextStyle(

      //         // fontFamily: 'Mitr',
      //         fontWeight: FontWeight.bold,
      //         color: Colors.black45),
      //   ),
      // ),
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
            margin: EdgeInsets.only(left: 140, right: 140, top: 8, bottom: 16),
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
    ]);
  }
}
