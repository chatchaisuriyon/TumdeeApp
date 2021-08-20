import 'package:flutter/material.dart';
import 'package:labroute/widget/BackHome.dart';
// import 'package:labroute/widget/sidemenu.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<StatefulWidget> {
  bool chk = true;
  String s = "";
  void loadbool() {
    setState(() {
      if (chk) {
        s = 'เก่ง ขจร.';
      } else {
        s = '';
      }
      chk = !chk;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text(
          "แนะนำวิธีการใช้งานแอปพลิเคชัน",
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Mitr'),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("ขณะนี้แอปพลิเคชัน ",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic)),
          Text("อยู่ในระหว่างการพัฒนา",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic)),
          Padding(padding: EdgeInsets.symmetric(vertical: 30)),
          Text("ผู้พัฒนาแอปพลิเคชัน",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
          Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          Text("นาย ชัชชัย สุริยนต์", style: TextStyle(fontSize: 18)),
          Text("รหัสนักศึกษา 61102105102", style: TextStyle(fontSize: 18)),
          Text("สาขาวิชา วิทยาการคอมพิวเตอร์\n",
              style: TextStyle(fontSize: 18)),
          Text("แอปพลิเคชันนี้",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
          Text("เป็นส่วนหนึ่งของรายวิชา โครงงานคอมพิวเตอร์.",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
          Text(s, style: TextStyle(fontSize: 22)),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: loadbool,
        child: Icon(Icons.navigation),
        backgroundColor: Colors.yellow,
      ),
      //drawer: SideMenu(),
    );
  }
}
