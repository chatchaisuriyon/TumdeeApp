import 'dart:ui';

import 'package:flutter/material.dart';

class HistoryPage2 extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<StatefulWidget> {
  Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
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
          centerTitle: true, // thi
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back)),

          title: Text('รายละเอียดประวัติบันทึกความดี',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Mitr')),
        ),
        body: Card(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 10, bottom: 14),
                    child: Text(
                      "รายละเอียดความดีที่คุณได้ทำ",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // children: [
                  Container(
                      padding: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                          color: Colors.yellow[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: ListBody(
                        children: [
                          Text('หัวข้อบันทึกความดี',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Padding(
                              padding:
                                  EdgeInsets.only(left: 16, right: 16, top: 4),
                              child: Text('${data['title']}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Mitr'))),
                          SizedBox(
                            height: 18,
                          ),
                          Text('รายละเอียดเพิ่มเติม'),
                          Padding(
                              padding:
                                  EdgeInsets.only(left: 16, right: 16, top: 4),
                              child: Text('${data['name']}',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Mitr'))),
                          SizedBox(
                            height: 18,
                          ),
                          Text('วันที่บันทึกข้อมูล'),
                          Padding(
                              padding:
                                  EdgeInsets.only(left: 16, right: 16, top: 4),
                              child: Text('${data['date']}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Mitr'))),
                        ],
                      ))
                ],
              )),
        ));
  }
}
