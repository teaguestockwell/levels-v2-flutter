// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'widgets.dart';

// class Screen0 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(child: Text("Screen 1")),
//     );
//   }
// }

// class Screen1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(child: Text("Screen 2")),
//     );
//   }
// }

// class Screen2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(child: Text("Screen 3")),
//     );
//   }
// }

// class Screen3 extends StatefulWidget {
//   @override
//   _Screen4State createState() => _Screen4State();
// }

// class _Screen4State extends State<Screen3> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CCard(<Widget>[RowTitleCenterText('hello'), RowCenter(Text('hello ther friend')),RowTwo(ButtonCustom('hello'),Text('row 3')
//         ),RowLeft(Text('hello ehrehrser')), RowOneLeft(ButtonCustom('asdasd'))])
//       ],
//     );
//   }
// }

//Cupertino picker implementation below

// class _InspBodyState extends State<InspBody> {
//   String expire = '?';
//   DateTime picked = DateTime.now();
//   num number = 48;

//   clicked() {
//     print('click');
//   }

//   get1to48() {
//     List<Widget> list = [];

//     for (int i = 48; i > 0; i--) {
//       list.add(Padding(
//           padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//           child: Text(i.toString(),style: TextStyle(color: Colors.white60),)));
//     }
//     return list;
//   }

//   getExpire() {
//     setState(() {
//       expire = DateFormat('yyyy MM dd HH:mm')
//           .format(picked.add(Duration(hours: number)))
//           .toString();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//             padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
//             child: Row(children: <Widget>[
//               Expanded(
//                   child: CupertinoPicker(
//                 children: get1to48(),
//                 onSelectedItemChanged: (i) {
//                   number = i-1;
//                   print(number);
//                 },
//                 itemExtent: 50,
//               ))
//             ])),
//         Row(
//           children: [
//             Expanded(
//                 child: SizedBox(
//                     height: 100,
//                     child: CupertinoDatePicker(

//                       use24hFormat: true,
//                       onDateTimeChanged: (DateTime value) {
//                         picked = value;
//                         print(picked);
//                       },
//                     )))
//           ],
//         ),
//         Padding(
//             padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
//             child: RowTwo(
//                 CustomButton('Expires @', onPressed: () => getExpire()),
//                 Text(expire))),
//       ],
//     );
//   }
// }
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'widgets.dart';
// import 'services.dart';
// import 'model.dart';

// class Screen3 extends StatefulWidget {
//   @override
//   _Screen3State createState() => _Screen3State();
// }

// class _Screen3State extends State<Screen3> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<List<Glossary>>.value(
//     value: DatabaseService().glossary,
//     child: GlossaryList());
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'model.dart';

// class DatabaseService{
//   // collection reference
//   final CollectionReference glossaryCollection = FirebaseFirestore.instance.collection('glossary');
//   final CollectionReference aircraftCollection = FirebaseFirestore.instance.collection('mds');
//   final CollectionReference glossaryall = FirebaseFirestore.instance.collection('glossaryall');
//   final DocumentReference generalDoc = FirebaseFirestore.instance.collection('general').doc('general');

//   // brew list from snapshot
//   List<Glossary> _glossarylistFromSnapshot(QuerySnapshot snapshot) {
//     return snapshot.docs.map((doc){
//       //print(doc.data);
//       return Glossary(doc.get('title'), doc.get('body'));
//     }).toList();
//   }

//   // get brews stream
//   Stream<List<Glossary>> get glossary {
//     return glossaryCollection.snapshots()
//         .map(_glossarylistFromSnapshot);
//   }

//   copyDoc(){
// // get the data from 'name@xxx.com'
// glossaryall.doc('C-17A-ER').get().then((doc) {
//     if (doc.exists) {
//         var data = doc.data();
//         // saves the data to 'name'
//         glossaryall.doc("C-17A-NON-ER").set(data);
//     }
// });
//   }
// }



// import 'package:five_level_one/Backend/cont.dart';
// import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class YYYYMMDDLookup extends StatefulWidget {
//   @override
//   _YYYYMMDDLookupState createState() => _YYYYMMDDLookupState();
// }

// class _YYYYMMDDLookupState extends State<YYYYMMDDLookup> {
//   var year = 2060;
//   var jjj = 366;
//   var dfYMD = DateFormat('yyyy MM dd');
//   var outYMD = DateTime(2060, 12, 31, 12, 00);
//   int daysInyea = 366;

//   getYear() {
//     List<Widget> list = [];
//     for (int i = 2060; i > 2000; i--) {
//       list.add(Padding(
//           padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
//           child: Text(
//             i.toString(),
//             style: TextStyle(color: Colors.white70, fontSize: 18),
//           )));
//     }
//     return list;
//   }

//   getDays() {
//     List<Widget> list = [];
//     for (int i = daysInyea; i > 0; i--) {
//       list.add(Padding(
//           padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
//           child: Text(
//             i.toString(),
//             style: TextStyle(color: Colors.white70, fontSize: 18),
//           )));
//     }
//     return list;
//   }

//   yearChange(var newyear) {
//     //Complicated logic that handles leap years based on previous state
//     setState(() {
//       year = 2060 - newyear;
//       var boy = DateTime(2060 - newyear, 1, 1, 12, 00);
//       if (newyear % 4 == 0) {
//         print('is leap');
//         outYMD = boy.add(Duration(days: jjj));
//         jjj += 1;
//         daysInyea = 366;
//       } else {
//         print('is not leap');
//         if (daysInyea == 366) {
//           outYMD = boy.add(Duration(days: jjj - 2));
//           jjj -= 1;
//         } else {
//           outYMD = boy.add(Duration(days: jjj - 1));
//         }
//         daysInyea = 365;
//       }
//     });
//   }

//   dayChange(var newjjj) {
//     setState(() {
//       jjj = daysInyea - newjjj;
//       print(jjj);
//       var boy = DateTime(year, 1, 1, 12, 00);
//       outYMD = boy.add(Duration(days: jjj - 1));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row2.padding(
//             0,
//             5,
//             0,
//             0,
//             Text('YYYY'),
//             Row(children: <Widget>[
//               Padding(
//                   padding: EdgeInsets.all(0),
//                   child: Container(
//                       width: Const.pickerWidth,
//                       height: 30,
//                       child: CupertinoPicker(
//                         children: getYear(),
//                         onSelectedItemChanged: yearChange,
//                         itemExtent: 30,
//                       )))
//             ])),
//         Divider(thickness: Const.divThickness,),
//         Row2(
//             Text('Julian Day'),
//             Row(children: <Widget>[
//               Padding(
//                   padding: EdgeInsets.all(0),
//                   child: Container(
//                       width: Const.pickerWidth,
//                       height: 30,
//                       child: CupertinoPicker(
//                         children: getDays(),
//                         onSelectedItemChanged: dayChange,
//                         itemExtent: 30,
//                       )))
//             ])),
//         Divider(thickness: Const.divThickness,),
//         Row2.padding(
//             0, 0, 0, 5.0, Text('YYYY MM DD'), ConstText(dfYMD.format(outYMD)))
//       ],
//     );
//   }
// }