import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:labroute/model/student.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:labroute/widget/BackHome.dart';

class FormScreen2 extends StatefulWidget {
  final User user;
  FormScreen2({this.user});
  @override
  _FormScreen2State createState() => _FormScreen2State();
}

class _FormScreen2State extends State<FormScreen2> {
  final formKey = GlobalKey<FormState>();
  Student myStudent = Student();
  //เตรียม firebase
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _studentCollection =
      FirebaseFirestore.instance.collection('Tumdee');
  CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');
  DateTime now = new DateTime.now();

  // DateTime _selectedDate;
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();

  // DateTime pickedDate;
  @override
  void initState() {
    super.initState();

    var formatter = DateFormat('วันที่ dd เดือน MMMM ปี yyyy', 'th');
    _textEditingController.text = formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              backgroundColor: Colors.yellow,
              appBar: AppBar(
                leading: BackHome(),
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              backgroundColor: Colors.yellow.shade300,
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
                centerTitle: true, // this is all you need
                leading: BackHome(),
                title: Text("เพิ่มบันทึกความดี",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Mitr')),
              ),
              body: Card(
                  elevation: 25,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: ListView(children: [
                        Container(
                            padding: EdgeInsets.all(20),
                            child: Form(
                                key: formKey,
                                child: SingleChildScrollView(
                                    child: Column(
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                      Text(
                                        "แบบฟอร์มเพิ่มบันทึกความดี",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Mitr',
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: _controller,
                                        style: TextStyle(fontSize: 18),
                                        decoration: new InputDecoration(
                                            labelText: "หัวข้อบันทึกความดี",
                                            labelStyle: TextStyle(
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Mitr',
                                                fontSize: 19),
                                            hintText:
                                                'กรอกหัวข้อทำความดีที่ตนเองได้ทำ',
                                            hintStyle: TextStyle(
                                                color: Colors.grey[800],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                            icon: Icon(
                                              Icons.info_outline,
                                              color: Colors.black,
                                              size: 25,
                                            ),
                                            suffixIcon: IconButton(
                                                icon: Icon(
                                                  Icons.clear,
                                                  size: 20,
                                                ),
                                                onPressed: () {
                                                  this.setState(() {
                                                    _controller.clear();
                                                  });
                                                })),
                                        validator: RequiredValidator(
                                            errorText:
                                                "กรอกข้อมูลความดีที่ตนเองได้ปฏิบัติด้วยนะครับ ^^"),
                                        onSaved: (String fname) {
                                          myStudent.fname = fname;
                                        },
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: _controller2,
                                        style: TextStyle(fontSize: 18),
                                        decoration: new InputDecoration(
                                            labelText: "รายละเอียดการทำความดี",
                                            labelStyle: TextStyle(
                                                color: Colors.grey[700],
                                                fontFamily: 'Mitr',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19),
                                            hintText:
                                                'กรอกรายละเอียดการทำความดีที่ตนเองได้ทำ',
                                            hintStyle: TextStyle(
                                                color: Colors.grey[800],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                            icon: Icon(
                                              Icons.notes,
                                              color: Colors.black,
                                              size: 25,
                                            ),
                                            suffixIcon: IconButton(
                                                icon: Icon(
                                                  Icons.clear,
                                                  size: 20,
                                                ),
                                                onPressed: () {
                                                  this.setState(() {
                                                    _controller2.clear();
                                                  });
                                                })),
                                        validator: RequiredValidator(
                                            errorText:
                                                "กรอกข้อมูลรายละเอียดเพิ่มเติมด้วยนะครับ ^^"),
                                        onSaved: (String lname) {
                                          myStudent.lname = lname;
                                        },
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        focusNode: AlwaysDisabledFocusNode(),
                                        controller: _textEditingController,
                                        onTap: () {
                                          _selectDate(context);
                                        },
                                        decoration: new InputDecoration(
                                          hintText:
                                              'โปรดระบุ วัน/เดือน/ปี ที่ได้ทำความดี',
                                          icon: Icon(
                                            Icons.calendar_today,
                                            color: Colors.black,
                                            size: 25,
                                          ),
                                        ),
                                        onSaved: (String date) {
                                          myStudent.date = date;
                                        },
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15)),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.green,
                                            ),
                                            label: Text(
                                              "บันทึกข้อมูล",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Mitr',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            icon: Icon(
                                              Icons.save,
                                              color: Colors.white,
                                            ),
                                            onPressed: () async {
                                              showDialog(
                                                  builder: (ctxt) {
                                                    return AlertDialog(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                24.0,
                                                                10.0,
                                                                24.0,
                                                                10.0),
                                                        title: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .only(
                                                                  left: 30,
                                                                  // top: 26,
                                                                ),
                                                              ),
                                                              Icon(
                                                                  Icons
                                                                      .notification_important,
                                                                  size: 30),
                                                              Text(
                                                                'คำเตือน ',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Mitr',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              )
                                                            ]),
                                                        content: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: <Widget>[
                                                              Text(
                                                                "กรุณาตรวจสอบข้อมูลให้ถูกต้อง!\n",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Mitr',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              Text(
                                                                  "หากผู้ใช้บันทึกความดีนี้แล้ว \nจะไม่สามารถ แก้ไขหรือลบข้อมูลนี้ได้",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Mitr',
                                                                    fontSize:
                                                                        14,
                                                                    // fontWeight:
                                                                    //     FontWeight
                                                                    //         .bold,
                                                                  )),
                                                            ]),
                                                        // Text(
                                                        //                                   "กรุณาตรวจสอบข้อมูลให้ถูกต้อง\n"
                                                        //                                   "หากผู้ใช้บันทึกความดีนี้แล้ว \nจะไม่สามารถ แก้ไขหรือลบข้อมูลได้!",
                                                        //                                   textAlign: TextAlign
                                                        //                                       .center,
                                                        //                                 ),
                                                        actions: <Widget>[
                                                          Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    primary: Colors
                                                                        .white,
                                                                    // primary: Colors.red,
                                                                    onPrimary:
                                                                        Colors
                                                                            .red,
                                                                    textStyle: const TextStyle(
                                                                        fontSize:
                                                                            16),
                                                                  ),
                                                                  child: Text(
                                                                    "ยกเลิก",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Mitr',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                                ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    // primary:
                                                                    //     Colors
                                                                    //         .red,
                                                                    primary: Colors
                                                                        .green,
                                                                    onPrimary:
                                                                        Colors
                                                                            .white,
                                                                    textStyle: const TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  child: Text(
                                                                    "ตกลง",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Mitr',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    if (formKey
                                                                        .currentState
                                                                        .validate()) {
                                                                      formKey
                                                                          .currentState
                                                                          .save();
                                                                      await _studentCollection
                                                                          .add({
                                                                        "fname":
                                                                            myStudent.fname,
                                                                        "lname":
                                                                            myStudent.lname,
                                                                        "date":
                                                                            myStudent.date,
                                                                        "uid": widget
                                                                            .user
                                                                            .uid,
                                                                      });
                                                                      formKey
                                                                          .currentState
                                                                          .reset();

                                                                      DocumentSnapshot<
                                                                          Map<String,
                                                                              dynamic>> doc = await _userCollection
                                                                          .doc(widget
                                                                              .user
                                                                              .uid)
                                                                          .get();

                                                                      int score =
                                                                          doc.data()[
                                                                              "score"];
                                                                      if (score ==
                                                                          null) {
                                                                        score =
                                                                            1;
                                                                      } else {
                                                                        score +=
                                                                            1;
                                                                      }

                                                                      _userCollection
                                                                          .doc(widget
                                                                              .user
                                                                              .uid)
                                                                          .update({
                                                                        "score":
                                                                            score
                                                                      });
                                                                      Navigator.popAndPushNamed(
                                                                          context,
                                                                          'historypage');

                                                                      Flushbar(
                                                                          title:
                                                                              'เพิ่มข้อมูลความดีเรียบร้อยแล้ว ✅ '
                                                                              '+1 ความดี',
                                                                          message:
                                                                              'โปรดกลับไปยังหน้าหลักและกลับมายังหน้านี้อีกครั้ง\nหากไม่พบข้อมูล',
                                                                          duration: Duration(
                                                                              seconds:
                                                                                  6),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.info_outline,
                                                                            color:
                                                                                Colors.yellow,
                                                                          ))
                                                                        ..show(
                                                                            context);
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                )
                                                              ])
                                                        ]);
                                                  },
                                                  context: context);
                                            }),
                                      ),
                                      SizedBox(
                                        height: 170,
                                      ),
                                      Column(children: <Widget>[
                                        Text(
                                          'ทำดี ธรรมดี. © 2021\nSakonnakhon Rajabhat University. ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black87),
                                        ),
                                        Container(
                                          // padding: const EdgeInsets.only(top: 16),
                                          margin: EdgeInsets.only(
                                              left: 120,
                                              right: 120,
                                              top: 8,
                                              bottom: 16),
                                          // width: 100,
                                          height: 30,

                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey[300]
                                                      .withOpacity(1),
                                                  spreadRadius: 1.5,
                                                  blurRadius: 2,
                                                  offset: Offset(1,
                                                      2), // changes position of shadow
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
                                    ]))))
                      ]))),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.yellow[500],
                primaryVariant: Colors.black,
                secondary: Colors.black,
                secondaryVariant: Colors.black,
                onPrimary: Colors.black,
                onSecondary: Colors.black,
                background: Colors.black,
                surface: Colors.blueGrey,
                onSurface: Colors.black,
                brightness: Brightness.light,
              ),
              dialogBackgroundColor: Colors.blue[300],
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      now = newSelectedDate;
      _textEditingController
        ..text = DateFormat('วันที่ dd เดือน MMMM ปี yyyy').format(now)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
