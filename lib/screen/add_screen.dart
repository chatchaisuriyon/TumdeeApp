// import 'package:flutter/material.dart';
// // import 'package:labroute/model/TumdeeAdd.dart';
// // import 'package:flutter_database/models/Transactions.dart';
// // import 'package:flutter_database/providers/transaction_provider.dart';
// // import 'package:flutter_database/screens/home_screen.dart';
// // import 'package:provider/provider.dart';
// import 'package:labroute/widget/BackHome.dart';

// import 'home_screen.dart';

// class FormScreen extends StatefulWidget {
//   @override
//   _FormScreenState createState() => _FormScreenState();
// }

// class _FormScreenState extends State<StatefulWidget> {
//   final formKey = GlobalKey<FormState>();
//   TumdeeAdd tumdeeAdd = TumdeeAdd();

//   // controller

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: BackHome(),
//           title: Text("เพิ่มรายการความดี"),
//         ),
//         body: Card(
//             elevation: 25,
//             margin: const EdgeInsets.symmetric(horizontal: 15),
//             child: Padding(
//                 padding: const EdgeInsets.all(0.0),
//                 child: ListView(children: [
//                   Container(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
//                     child: SingleChildScrollView(
//                       key: formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           TextFormField(
//                             style: TextStyle(height: 2, fontSize: 18),
//                             decoration: new InputDecoration(
//                               labelText: "บันทีกความดี",
//                               labelStyle: TextStyle(
//                                   color: Colors.grey[800],
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 17),
//                               helperText: 'กรอกข้อมูลความดีที่ตนเองได้ปฏิบัติ',
//                               icon: Icon(
//                                 Icons.info_outline,
//                                 color: Colors.black,
//                                 size: 25,
//                               ),
//                             ),
//                             autofocus: false,
//                             validator: (String str) {
//                               //ชื่อรายการเป็นค่าว่าง
//                               if (str.isEmpty) {
//                                 return "กรุณาป้อนข้อมูลรายละเอียด";
//                               }
//                               return null;
//                             },
//                             onSaved: (String title) {
//                               tumdeeAdd.title = title;
//                             },
//                           ),
//                           // TextFormField(
//                           //   decoration: new InputDecoration(labelText: "คะแนนความดี"),
//                           //   keyboardType:TextInputType.number,
//                           //   controller: amountController,
//                           //   validator: (String str){
//                           //     if(str.isEmpty){
//                           //           return "กรุณาป้อนคะแนนความดี";
//                           //     }
//                           //     if(double.parse(str)<=0){
//                           //           return "กรุณาป้อนตัวเลขมากกว่า 0";
//                           //     }
//                           //     return null;
//                           //   },
//                           // ),

//                           TextFormField(
//                             style: TextStyle(height: 2, fontSize: 18),
//                             decoration: new InputDecoration(
//                                 labelText: "รายละเอียดการทำความดีเพิ่มเติม",
//                                 labelStyle: TextStyle(
//                                     color: Colors.grey[800],
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 17),
//                                 icon: Icon(
//                                   Icons.notes,
//                                   color: Colors.black,
//                                   size: 25,
//                                 )),
//                             validator: (String str) {
//                               if (str.isEmpty) {
//                                 return "กรุณาป้อนรายละเอียดการทำความดีเพิ่มเติม";
//                               }
//                               return null;
//                             },
//                             onSaved: (String information) {
//                               tumdeeAdd.information = information;
//                             },
//                           ),

//                           Padding(padding: EdgeInsets.symmetric(vertical: 15)),
//                           SizedBox(
//                               width: double.maxFinite,
//                               child: ElevatedButton.icon(
//                                 style: ElevatedButton.styleFrom(
//                                   primary: Colors.green,
//                                 ),
//                                 label: Text(
//                                   "บันทึกข้อมูล",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 icon: Icon(
//                                   Icons.save,
//                                   color: Colors.white,
//                                 ),
//                                 onPressed: () {
//                                   // formKey.currentState.save();
//                                   print("${tumdeeAdd.title}");
//                                   print("${tumdeeAdd.information}");
//                                   // print("${tumdeeAdd.date}");
//                                   // if(formKey.currentState.validate()){
//                                   //     var title = titleController.text;
//                                   //     var amount = amountController.text;
//                                   //     //เตรียมข้อมูล
//                                   //     Transactions statement = Transactions(
//                                   //       title: title,
//                                   //       amount: double.parse(amount),
//                                   //       date:DateTime.now()
//                                   //     );//object

//                                   //เรียก Provider
//                                   // var provider = Provider.of<TransactionProvider>(context,listen:false);
//                                   // provider.addTransaction(statement);
//                                   // Navigator.push(
//                                   //     context,
//                                   //     MaterialPageRoute(
//                                   //         fullscreenDialog: true,
//                                   //         builder: (context) {
//                                   //           return HomeScreen();
//                                   //         }));
//                                   // }
//                                 },
//                               ))
//                         ],
//                       ),
//                     ),
//                   )
//                 ]))));
//   }
// }
