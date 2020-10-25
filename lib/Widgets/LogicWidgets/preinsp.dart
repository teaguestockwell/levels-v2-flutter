import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Widgets/UIWidgets/Input.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class PreInsp extends StatefulWidget {
  @override
  _PreInspState createState() => _PreInspState();
}

class _PreInspState extends State<PreInsp> {
  var f = DateFormat('yyyy MM dd HH:mm');
  var number = 48;
  var acompDate = DateTime.now().subtract(Duration(hours: 48));
  var acomp = DateFormat('yyyy MM dd HH:mm')
      .format(DateTime.now().subtract(Duration(hours: 48)))
      .toString();
  var expireAt =
      DateFormat('yyyy MM dd HH:mm').format(DateTime.now()).toString();

  timeChange(var date) {
    setState(() {
      acompDate = date;
      acomp = f.format(acompDate).toString();
      expireAt = f.format(acompDate.add(Duration(hours: number))).toString();
      print(
          '\n duration change: \n achompDate: $acompDate \n expireAt: $expireAt \n acomp: $acomp \n duration: $number');
    });
  }

  lenChange(var n) {
    print(n);
    setState(() {
      number = 48 - n;
      expireAt = f.format(acompDate.add(Duration(hours: number))).toString();
      print(
          '\n duration change: \n achompDate: $acompDate \n expireAt: $expireAt \n acomp: $acomp \n duration: $number');
    });
  }

  get1to48() {
    List<Widget> list = [];
    for (int i = 48; i > 0; i--) {
      list.add(Padding(
          padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
          child: Text(
            i.toString(),
            style: TextStyle(color: Colors.white70, fontSize: 18),
          )));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row2.padding(
            0,
            5.0,
            0,
            0,
            Text('Acomplished At'),
            CustomButton(
              acomp,
              onPressed: () {
                DatePicker.showDateTimePicker(context,
                    showTitleActions: false,
                    theme: DatePickerTheme(
                        backgroundColor: Colors.black,
                        itemStyle: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        doneStyle:
                            TextStyle(color: Colors.white60, fontSize: 18)),
                    onChanged: timeChange,
                    currentTime: acompDate,
                    locale: LocaleType.en);
              },
            )),
        Divider(),
        Row2(
            Text('Hours Until Expire'),
            Row(children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                      width: Const.pickerWidth,
                      height: 30,
                      child: CupertinoPicker(
                        children: get1to48(),
                        onSelectedItemChanged: lenChange,
                        itemExtent: 30,
                      )))
            ])),
        Divider(),
        Row2.padding(0, 0, 0, 5.0, Text('Expires At'), Text(expireAt))
      ],
    );
  }
}
