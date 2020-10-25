import 'package:five_level_one/Widgets/UIWidgets/Input.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectMDSBody extends StatefulWidget {
  String mdsCSV;
  String selection;
  IntCallBack onPressed;
  SelectMDSBody(this.mdsCSV, {this.onPressed});
  @override
  _SelectMDSBodyState createState() => _SelectMDSBodyState();
}

class _SelectMDSBodyState extends State<SelectMDSBody> {
  List<String> mdss;
  String selectedMDS;

  @override
  void initState() {
    mdss = this.widget.mdsCSV.split(',');
    selectedMDS = mdss.elementAt(0);
    this.widget.selection = mdss.elementAt(0);
    super.initState();
  }

  getMDS() {
    List<Widget> list = [];
    for (var s in mdss) {
      print(s);
      list.add(Padding(
          padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
          child: Text(
            s,
            style: TextStyle(color: Colors.white70, fontSize: 18),
          )));
    }
    return list;
  }

  mdsChanged(int i) {
    //setState(() {
    selectedMDS = mdss.elementAt(i);
    this.widget.selection = mdss.elementAt(i);
    //});
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: RowCenter(CupertinoPicker(
            children: getMDS(),
            onSelectedItemChanged: mdsChanged,
            itemExtent: 30,
          ))),
      Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: RowCenter(CustomButton(
            'Select',
            onPressed: () {
              this.widget.onPressed();
            },
          )))
    ]);
  }
}
