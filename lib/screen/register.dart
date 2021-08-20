import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:labroute/model/profile.dart';
import 'package:labroute/screen/display.dart';
import 'package:labroute/widget/BackLogin.dart';

// import 'home.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                appBar: AppBar(
                  leading: BackLogin(),
                  title: Text("สร้างบัญชีผู้ใช้"),
                ),
                body: Card(
                    elevation: 25,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Form(
                              key: formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("อีเมล",
                                        style: TextStyle(fontSize: 20)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      decoration: new InputDecoration(
                                        focusColor: Colors.white,
                                        hoverColor: Colors.white,
                                        border: OutlineInputBorder(),
                                        icon: Icon(
                                          Icons.email_outlined,
                                          color: Colors.black,
                                          size: 25,
                                        ),
                                      ),
                                      validator: MultiValidator([
                                        RequiredValidator(
                                            errorText:
                                                "กรุณาป้อนอีเมลด้วยครับ"),
                                        EmailValidator(
                                            errorText: "รูปแบบอีเมลไม่ถูกต้อง")
                                      ]),
                                      keyboardType: TextInputType.emailAddress,
                                      onSaved: (String email) {
                                        profile.email = email;
                                      },
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text("รหัสผ่าน",
                                        style: TextStyle(fontSize: 20)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      decoration: new InputDecoration(
                                        focusColor: Colors.white,
                                        hoverColor: Colors.white,
                                        border: OutlineInputBorder(),
                                        icon: Icon(
                                          Icons.vpn_key_outlined,
                                          color: Colors.black,
                                          size: 25,
                                        ),
                                      ),
                                      validator: RequiredValidator(
                                          errorText:
                                              "กรุณาป้อนรหัสผ่านด้วยครับ"),
                                      obscureText: true,
                                      onSaved: (String password) {
                                        profile.password = password;
                                      },
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15)),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        child: Text("ลงทะเบียน",
                                            style: TextStyle(fontSize: 20)),
                                        onPressed: () async {
                                          if (formKey.currentState.validate()) {
                                            formKey.currentState.save();
                                            try {
                                              await FirebaseAuth.instance
                                                  .createUserWithEmailAndPassword(
                                                      email: profile.email,
                                                      password:
                                                          profile.password)
                                                  .then((value) {
                                                formKey.currentState.reset();
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "สร้างบัญชีผู้ใช้เรียบร้อยแล้ว",
                                                    gravity: ToastGravity.TOP);
                                                Navigator.pushReplacement(
                                                    context, MaterialPageRoute(
                                                        builder: (context) {
                                                  return DisplayScreen();
                                                }));
                                              });
                                            } on FirebaseAuthException catch (e) {
                                              print(e.code);
                                              String message;
                                              if (e.code ==
                                                  'email-already-in-use') {
                                                message =
                                                    "มีอีเมลนี้ในระบบแล้วครับ โปรดใช้อีเมลอื่นแทน";
                                              } else if (e.code ==
                                                  'weak-password') {
                                                message =
                                                    "รหัสผ่านต้องมีความยาว 6 ตัวอักษรขึ้นไป";
                                              } else {
                                                message = e.message;
                                              }
                                              Fluttertoast.showToast(
                                                  msg: message,
                                                  gravity: ToastGravity.CENTER);
                                            }
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // ),
                          // ]
                        ))));
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
