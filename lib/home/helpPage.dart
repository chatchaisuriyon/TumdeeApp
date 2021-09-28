import 'package:flutter/material.dart';
import 'package:labroute/widget/BackHome.dart';
// import 'package:labroute/widget/sidemenu.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
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
          leading: BackHome(),
          centerTitle: true,
          title: Text(
            "ข้อมูลแอปพลิเคชัน",
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Mitr'),
          ),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Center(
              // child:
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(top: 16),
                          margin:
                              EdgeInsets.only(left: 60, top: 13, bottom: 10),
                          width: size.width - 280,
                          height: size.width - 255,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[300].withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 3,
                                  offset: Offset(
                                      1, 1), // changes position of shadow
                                ),
                              ],
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/images/Snrulogo.png'),
                                // fit: BoxFit.cover,
                              ))),
                      Container(
                          padding: const EdgeInsets.only(top: 16),
                          margin:
                              EdgeInsets.only(left: 35, top: 13, bottom: 10),
                          width: size.width - 260,
                          height: size.width - 260,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[300].withOpacity(0.8),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: Offset(
                                      1, 4), // changes position of shadow
                                ),
                              ],
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://scontent.fbkk5-6.fna.fbcdn.net/v/t1.18169-9/26907662_172995773317193_7296074054818918322_n.png?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeES0Ru_AMj9Tj8YCy-SHQ2GQItHx9nQ2axAi0fH2dDZrKVNAp51wf74V7UB4MZvOdxkAayO2LHaUShUlqbLEdB2&_nc_ohc=D6v2v2YVC0gAX8Y_V7a&_nc_ht=scontent.fbkk5-6.fna&oh=33092222fda49b692960d48116bb2f17&oe=6178A87A'),
                                // fit: BoxFit.cover,
                              ))),
                    ],
                    // ),
                    //
                    //
                  )),
              Text("แอปพลิเคชันนี้",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Mitr',
                      fontStyle: FontStyle.italic)),
              Text(
                  "เป็นส่วนหนึ่งของรายวิชา โครงงานคอมพิวเตอร์\nมหาวิทยาลัยราชภัฏสกลนคร",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Mitr',
                      fontStyle: FontStyle.italic)),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Text("ผู้พัฒนาแอปพลิเคชัน",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Mitr',
                    fontWeight: FontWeight.bold,
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                      padding: const EdgeInsets.only(top: 16),
                      margin: EdgeInsets.only(
                          left: 80, right: 80, top: 13, bottom: 13),
                      // width: size.width - 30,
                      height: 240,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300].withOpacity(0.8),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset:
                                  Offset(1, 4), // changes position of shadow
                            ),
                          ],
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                'https://lh3.googleusercontent.com/uQjNB4TxQd1eEniqWjr_olCz4O-IbDNdlcZmyE9Q5a8qbWzh1z7w29vIDoe9owK1oIZKHvzx3UGv5fc-RerQvIDfytkvw-jFBzX-2ObIa6q3PLTDGiEq-5n09wSzyXmAVDxHk_kPU9jDzR4cjJhwUxGSGaH3OIdr2cMhLvcow2act1gj1iwkppBf9thIZlYZyjLsJK3TB7lUeMY7IwdlpVHU18lLGWq-HC4TimhsfI0aH5dBCDHTloDmjJ3GwmQU3EfwBI4r8bRFjMRaptQcQN5aJPZ7ViRuYjN8XrGCz5pVdy6ba9DeKQX67qn8xhKtXG0OcoGnLqvQGx0579EM3YLGjmFfbzLDM5jL68U7ElWLWIiXEOFbaHsOClf-qMr88iFPpbTfOI7s5iOU3DQBkma-O2XUHK3Obx9IMP_57BPyHLnJ9VzstA6XAqmtYzf7fSclNR6MCO_3hluUJ_Q0SRJoPbfUKgrBvkvyq71EblvzKpL_2RF4wXZG7jExatijq9mtxntNYCozo9N1auY66vy_Blrv7rw5DMzdlIt5TgaaTPBB4awePMi7i9FweVnCoEvnAFxVmHBnbV7VcEsE-zeBrs5exWA7Pe_KveQccPFwaBLh9cpSMJlV_N6vMne-z4IbT9EvPgCt3unymTdgCtGDLarWly7zRwtUyAXvGReiqY3tzKbcO29zu9LpTrVbsc832B6XGE-C9VOWSOzaIUVxjQ=s614-no?authuser=0'),
                            // fit: BoxFit.cover,
                          )))),
              Text("นาย ชัชชัย สุริยนต์",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Mitr',
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 10,
              ),
              Text("รหัสนักศึกษา 61102105102",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Mitr',
                    // fontWeight: FontWeight.bold,
                  )),
              Text(
                  "สาขาวิชา วิทยาการคอมพิวเตอร์\nอาจารย์ที่ปรึกษา อาจารย์สุรสิทธิ์  อุ้ยปัดฌาวงศ์",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Mitr',
                    // fontWeight: FontWeight.bold,
                  )),

              // Text("แอปพลิเคชันนี้",
              //     style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              // Text("เป็นส่วนหนึ่งของรายวิชา โครงงานคอมพิวเตอร์.",
              //     style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              // Text(s, style: TextStyle(fontSize: 22)),
            ]));
  }
}
