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
          top: 12,
        ),
        child: Text(
          'คำคมธรรมะ - กระตุกจิต กระชากใจ',
          textAlign: TextAlign.center,
          style: TextStyle(
              shadows: [
                BoxShadow(
                  color: Colors.grey[300].withOpacity(0.8),
                  spreadRadius: 1,
                  blurRadius: 1.5,
                  offset: Offset(1, 2), // changes position of shadow
                ),
              ],
              fontFamily: 'Mitr',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87),
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
              image: NetworkImage(
                  'https://scontent.fbkk5-3.fna.fbcdn.net/v/t1.6435-9/117801227_370503207676746_6454075342437766793_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=8bfeb9&_nc_eui2=AeGWU17yG-DOLb8EmWKpkB-TlB8MMl9uhf6UHwwyX26F_tS7xUwBPFhsGtC7cBHqn3ZFiqceoxzVi2uk-_s9-5q0&_nc_ohc=0xHUA_rh-y0AX-loGH7&_nc_ht=scontent.fbkk5-3.fna&oh=b59a64ad9f0d6f58bf6ce121bd50325f&oe=6143189D'),
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
              image: NetworkImage(
                  'https://scontent.fbkk5-8.fna.fbcdn.net/v/t1.6435-9/117773281_370503244343409_4873316124359941648_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=8bfeb9&_nc_eui2=AeGW-Wabe8nuZQ24iau_9CIFgglFAl5xD16CCUUCXnEPXuv8ZtVFbUIwcJ_HvGPTVip5N95RxJy1NUKHvUZ5CW2e&_nc_ohc=E0go5PbPVJQAX9Z5Is6&_nc_ht=scontent.fbkk5-8.fna&oh=2566d5b6b19e9080b72d60fa16a57dc6&oe=6142440F'),
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
              image: NetworkImage(
                  'https://scontent.fbkk5-8.fna.fbcdn.net/v/t1.6435-9/118194685_370503104343423_2351743297617774153_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=8bfeb9&_nc_eui2=AeH9d77K0v7sCrmFKIlmldsLfD7BNQWfelN8PsE1BZ96UyWXiJraS5OlOl9L9bcwFcWou2e3WHXUUqIWrwBLlW5_&_nc_ohc=IhKLzggYwCEAX-dr41m&_nc_ht=scontent.fbkk5-8.fna&oh=83b1f2193eb734c1c3da132187bade46&oe=6140DA19'),
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
            'KENGKAJORN. © 2021\nSakonnakhon Rajabhat University. ',
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
