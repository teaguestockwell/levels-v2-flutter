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
