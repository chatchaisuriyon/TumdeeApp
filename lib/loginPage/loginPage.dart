import 'package:flutter/material.dart';
import 'package:labroute/screen/login.dart';
import 'package:labroute/screen/register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final _formKey = GlobalKey<FormState>();
  // String username;
  // String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Container(
            //   height: 170,
            //   alignment: Alignment.center,
            //   child: Image.asset(
            //     'assets/images/tumdeelogo.png',
            //     fit: BoxFit.fitHeight,
            //   ),
            // ),
            // Center(
            //   child: Image(
            //     image: AssetImage('assets/images/tumdeelogo.png'),
            //     width: 200,
            //     height: 170,
            //   ),
            // ),

            // Center(
            //   child: Image(
            //     image: AssetImage('assets/images/tumdee.png'),
            //     width: 210,
            //   ),
            // ),
            // Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            // Center(
            //   child: Image(
            //     image: AssetImage('assets/images/tumdee2.png'),
            //     width: 285,
            //   ),
            // ),

            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.50,
            // ),
            buildLogo(),
            buildText1(),
            buildText2(),
            buildButton(),

            // Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            // SizedBox(
            //   width: 200,
            //   child: ElevatedButton.icon(
            //     style: ElevatedButton.styleFrom(
            //       primary: Colors.green, // background
            //       onPrimary: Colors.white, // foreground
            //     ),
            //     icon: Icon(Icons.login),
            //     label: Text("เข้าสู่ระบบ", style: TextStyle(fontSize: 20)),
            //     onPressed: () {
            //       Navigator.pushReplacement(context,
            //           MaterialPageRoute(builder: (context) {
            //         return LoginScreen();
            //       }));
            //     },
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //   decoration:
            //       BoxDecoration(borderRadius: BorderRadius.circular(20)),
            //   // color: Colors.white,
            // ),
            // SizedBox(
            //   width: 160,
            //   child: TextButton.icon(
            //     style: TextButton.styleFrom(
            //       primary: Colors.black45, // background
            //       onSurface: Colors.white, // foreground
            //     ),
            //     icon: Icon(Icons.add),
            //     label: Text("สร้างบัญชีผู้ใช้", style: TextStyle(fontSize: 16)),
            //     onPressed: () {
            //       Navigator.pushReplacement(context,
            //           MaterialPageRoute(builder: (context) {
            //         return RegisterScreen();
            //       }));
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Positioned buildLogo() {
    return Positioned(
      top: 180,
      left: 100,
      height: 170,
      // alignment: Alignment.center,
      child: Image.asset(
        'assets/images/tumdeelogo.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Positioned buildText1() {
    return Positioned(
      top: 340,
      left: 90,
      width: 210,
      // alignment: Alignment.center,
      child: Image.asset(
        'assets/images/tumdee.png',
      ),
    );
  }

  Positioned buildText2() {
    return Positioned(
      top: 400,
      left: 50,
      width: 285,
      // alignment: Alignment.center,
      child: Image.asset(
        'assets/images/tumdee2.png',
      ),
    );
  }

  Positioned buildButton() {
    return Positioned(
      right: 20,
      left: 20,
      bottom: 20,
      child: Container(
        height: 157,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // background
                  onPrimary: Colors.white, // foreground
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                icon: Icon(Icons.login),
                label: Text("เข้าสู่ระบบ", style: TextStyle(fontSize: 22)),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Text(
              'คุณยังไม่มีบัญชีผู้ใช้งานใช่หรือไม่ ?',
              style: TextStyle(color: Colors.black45),
            ),
            SizedBox(
              // width: 200,
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  primary: Colors.black54, // background
                  onSurface: Colors.white, // foreground
                ),
                icon: Icon(Icons.add),
                label: Text("สร้างบัญชีผู้ใช้",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return RegisterScreen();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//     return Scaffold(
//         backgroundColor: Colors.yellow,
//         body: Container(
//           decoration: BoxDecoration(
//               //   gradient: RadialGradient(
//               //       colors: [Colors.white, Colors.yellow], radius: 0.7),
//               ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Center(
//                 child: Image(
//                   image: AssetImage('assets/images/tumdeelogo.png'),
//                   width: 200,
//                   height: 170,
//                 ),
//               ),
//               Center(
//                 child: Image(
//                   image: AssetImage('assets/images/tumdee.png'),
//                   width: 250,
//                 ),
//               ),
//               Padding(padding: EdgeInsets.symmetric(vertical: 10)),
//               Center(
//                 child: Image(
//                   image: AssetImage('assets/images/tumdee2.png'),
//                   width: 285,
//                 ),
//               ),
//               Padding(padding: EdgeInsets.symmetric(vertical: 20)),
//               _createLoginForm(),
//             ],
//           ),
//         ));
//   }

//   Widget _createLoginForm() {
//     return Form(
//         key: _formKey,
//         child: Container(
//           margin: EdgeInsets.symmetric(horizontal: 50),
//           child: Column(
//             children: [
//               // _createUsernameTextfield(),
//               // Padding(padding: EdgeInsets.symmetric(vertical: 3)),
//               // _createPasswordTextfield(),
//               // Padding(padding: EdgeInsets.symmetric(vertical: 5)),
//               _createLoginButton()
//             ],
//           ),
//         ));
//   }

//   // Widget _createUsernameTextfield() {
//   //   return TextFormField(
//   //       decoration: InputDecoration(
//   //           border: OutlineInputBorder(),
//   //           labelText: 'ชื่อผู้ใช้',
//   //           labelStyle: TextStyle(color: Colors.grey[800]),
//   //           icon: Icon(Icons.person, color: Colors.black)),
//   //       validator: (value) {
//   //         if (value.isEmpty) {
//   //           return 'Please enter Username';
//   //         } else {
//   //           username = value;
//   //           return null;
//   //         }
//   //       });
//   // }

//   // Widget _createPasswordTextfield() {
//   //   return TextFormField(
//   //     decoration: InputDecoration(
//   //         border: OutlineInputBorder(),
//   //         labelText: 'รหัสผ่าน',
//   //         labelStyle: TextStyle(color: Colors.grey[800]),
//   //         icon: Icon(Icons.vpn_key, color: Colors.black)),
//   //     validator: (value) {
//   //       if (value.isEmpty) {
//   //         return 'Please enter Password';
//   //       } else {
//   //         password = value;
//   //         return null;
//   //       }
//   //     },
//   //   );
//   // }

//   Widget _createLoginButton() {
//     return RaisedButton(

//                 child: ElevatedButton.icon(
//                   icon: Icon(Icons.add),
//                   label:
//                       Text("สร้างบัญชีผู้ใช้", style: TextStyle(fontSize: 20)),
//                       onPressed: () {
//                       Navigator.of(context).pushReplacementNamed('HomePage');

//                       // Navigator.pushReplacement(context, MaterialPageRoute(
//                       //   builder: (context){
//                           return RegisterScreen();
//                       }
//                       )
//                     );
//                   // },
//                 // ),
//               // ),

//   //   return RaisedButton(
//   //       color: Colors.green,
//   //       onPressed: () {
//   //         // if (_formKey.currentState.validate()) {
//   //         //   Map<String, dynamic> useracc = {
//   //         //     'username': username,
//   //         //     'password': password
//   //         //   };
//   //         //   debugPrint('$useracc');
//   //         _login();
//   //         // }
//   //       },
//   //       child: Text(
//   //         'เข้าสู่ระบบ',
//   //         style: TextStyle(color: Colors.white),
//   //       ));
//   // }

//   // _login() {
//   //   // if (username == 'chatchai' && password == '1234') {
//   //   Navigator.of(context).pushReplacementNamed('HomePage');
//   // }
// }
// // }
//     // );
//   // }
// }
