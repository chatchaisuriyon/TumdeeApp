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
                children: [
                  Text(
                    "รายละเอียดความดีที่คุณได้ทำ",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  // children: [
                  Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          color: Colors.yellow[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: ListBody(
                        children: [
                          Text('${data['title']}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Text('${data['name']}',
                              style: TextStyle(fontSize: 17)),
                          SizedBox(
                            height: 10,
                          ),
                          Text('${data['date']}',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ))
                ],
              )),
        ));
  }
}
