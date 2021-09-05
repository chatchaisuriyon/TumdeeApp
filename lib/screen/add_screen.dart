import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:labroute/model/student.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:labroute/widget/BackHome.dart';
// import 'package:buddhist_datetime_dateformat/buddhist_datetime_dateformat.dart';

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
  TextEditingController _textEditingController = TextEditingController();

  // DateTime pickedDate;
  @override
  void initState() {
    super.initState();
    // _textEditingController.text =
    // DateFormat('yyyy/MM/dd – kk:mm').format(DateTime.now());
    // DateFormat('dd/MMMM/yyyy').format(DateTime.now());
    var formatter = DateFormat('วันที่ dd เดือนMMMM ปี yyyy', 'th');
    _textEditingController.text = formatter.format(now);
    // var onlyBuddhistYear = now.yearInBuddhistCalendar;

    // pickedDate = DateTime.now();
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
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      style: TextStyle(fontSize: 18),
                                      decoration: new InputDecoration(
                                        labelText: "หัวข้อบันทีกความดี",
                                        labelStyle: TextStyle(
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.bold,
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
                                      ),
                                      validator: RequiredValidator(
                                          errorText:
                                              "กรอกข้อมูลความดีที่ตนเองได้ปฏิบัติด้วยครับ ^^"),
                                      onSaved: (String fname) {
                                        myStudent.fname = fname;
                                      },
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      style: TextStyle(fontSize: 18),
                                      decoration: new InputDecoration(
                                        labelText: "รายละเอียดการทำความดี",
                                        labelStyle: TextStyle(
                                            color: Colors.grey[800],
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
                                      ),
                                      validator: RequiredValidator(
                                          errorText:
                                              "กรุณาป้อนรายละเอียดการทำความดีเพิ่มเติมด้วยครับ ^^"),
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
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15)),
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
                                              fontSize: 18,
                                            ),
                                          ),
                                          icon: Icon(
                                            Icons.save,
                                            color: Colors.white,
                                          ),
                                          onPressed: () async {
                                            if (formKey.currentState
                                                .validate()) {
                                              formKey.currentState.save();
                                              await _studentCollection.add({
                                                "fname": myStudent.fname,
                                                "lname": myStudent.lname,
                                                "date": myStudent.date,
                                                "uid": widget.user.uid,
                                              });
                                              formKey.currentState.reset();

                                              DocumentSnapshot<
                                                      Map<String, dynamic>>
                                                  doc = await _userCollection
                                                      .doc(widget.user.uid)
                                                      .get();

                                              int score = doc.data()["score"];
                                              if (score == null) {
                                                score = 1;
                                              } else {
                                                score += 1;
                                              }

                                              _userCollection
                                                  .doc(widget.user.uid)
                                                  .update({"score": score});

                                              Navigator.pop(context);
                                            }
                                          }),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]))));
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
