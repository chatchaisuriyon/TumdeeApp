import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labroute/widget/BackHome.dart';
import 'package:url_launcher/url_launcher.dart';

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
              image: AssetImage('assets/images/slide_1.jpg.png'),
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
              image: AssetImage('assets/images/slide_3.jpg'),
              // fit: BoxFit.cover,
            )),
      ),
      Container(
          child: GestureDetector(
              onTap: () {
                launch('https://m.facebook.com/TumdeeApp');
              },
              child: Container(
                  padding: const EdgeInsets.only(top: 16),
                  margin: EdgeInsets.only(left: 16, right: 16, top: 13),
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
                      ))))),
      Container(
          padding: const EdgeInsets.only(top: 16),
          margin: EdgeInsets.only(left: 16, right: 16, top: 13),
          width: size.width - 100,
          height: size.height - 400,
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
                    'https://scontent.fbkk5-5.fna.fbcdn.net/v/t39.30808-6/240527997_1092772091550565_7791115714283321049_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=825194&_nc_eui2=AeEm4SGpcYqchjodZ-7zJkivC20pXKBzqGkLbSlcoHOoaQ-YE0n9KZ0RYGedquTqYdFkKfQg9K_X28AFRG6zwrB-&_nc_ohc=LWrJ09sosNAAX9wbuPh&tn=jdtvU9trbGifRpud&_nc_ht=scontent.fbkk5-5.fna&oh=056b52a385e59af381d50e8e56a34132&oe=61593247'),
                // fit: BoxFit.cover,
              ))),
      Container(
          padding: const EdgeInsets.only(top: 16),
          margin: EdgeInsets.only(left: 16, right: 16, top: 13),
          width: size.width - 100,
          height: size.height - 400,
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
                    'https://scontent.fbkk5-3.fna.fbcdn.net/v/t39.30808-6/242828940_1090439388450502_2969371707672085096_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=825194&_nc_eui2=AeFw0y9JlUv4p82nHesk5mHuqO0M6IhpYTWo7QzoiGlhNZnFhp98KtbokCH8bGYPZT7QMPnaZeHvP1KGw-aQV0Vk&_nc_ohc=zCc6wBMT7U0AX9Gv53d&_nc_ht=scontent.fbkk5-3.fna&oh=e3d6686807a1689753bb942ecdbd8b5c&oe=61583DF3'),
                // fit: BoxFit.cover,
              ))),
      Container(
          padding: const EdgeInsets.only(top: 16),
          margin: EdgeInsets.only(left: 16, right: 16, top: 13),
          width: size.width - 100,
          height: size.height - 400,
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
                    'https://scontent.fbkk5-6.fna.fbcdn.net/v/t39.30808-6/240061787_1089042228590218_4639964706037782783_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=825194&_nc_eui2=AeGjOtj45fuZoNywkNrZJ_BmQi0A1QF7S_9CLQDVAXtL_1SGANpb1AtPeREbURw-2CE9VWLvipm5XuIQwdPR5SEa&_nc_ohc=nEhhxO4WS9wAX8LAm5n&_nc_ht=scontent.fbkk5-6.fna&oh=1841fa60da07e97f30834eb262e2e97e&oe=6157D574'),
                // fit: BoxFit.cover,
              ))),
      Container(
          padding: const EdgeInsets.only(top: 16),
          margin: EdgeInsets.only(left: 16, right: 16, top: 13),
          width: size.width - 100,
          height: size.height - 400,
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
                    'https://scontent.fbkk5-5.fna.fbcdn.net/v/t39.30808-6/242441967_167655895491084_4548041745717907829_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=8bfeb9&_nc_eui2=AeG9WDJis0YmYu8PFcV1WLj9XLUyUmkxMiZctTJSaTEyJjwQIlTIyIQ8_QBugHErv86cqVvQR3wBFgTHDcg_Nmjz&_nc_ohc=hxlru2mf9-MAX8vJC6J&tn=jdtvU9trbGifRpud&_nc_ht=scontent.fbkk5-5.fna&oh=ac0d889873262fe323ee3b029505ac0b&oe=615786D1'),
                // fit: BoxFit.cover,
              ))),
      Container(
          padding: const EdgeInsets.only(top: 16),
          margin: EdgeInsets.only(left: 16, right: 16, top: 13),
          width: size.width - 100,
          height: size.height - 400,
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
                    'https://scontent.fbkk5-8.fna.fbcdn.net/v/t1.6435-9/242198940_544542196634575_8656586792589042172_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=825194&_nc_eui2=AeEX5GS8ej5YhFh3MZmSnGm4sMHcmK9MPzOwwdyYr0w_M5EsE9i0BtlD3h8B4r7krFf9a6wDefpY2rjKGiIX7W_x&_nc_ohc=fukYwjWI9gMAX_rKdPG&_nc_ht=scontent.fbkk5-8.fna&oh=f12742599bbf201d26dad0e295348a3c&oe=6179525B'),
                // fit: BoxFit.cover,
              ))),

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
