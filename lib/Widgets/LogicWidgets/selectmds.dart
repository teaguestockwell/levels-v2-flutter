import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Widgets/UIWidgets/Input.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectMDSBody extends StatefulWidget {
  String mdsCSV;
  IntCallBack onPressed;
  CustomButtomSpinnerModalString mdsSpin;
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
    this.widget.mdsSpin = CustomButtomSpinnerModalString(getMDS());
    super.initState();
  }

  getMDS() {
    List<String> list = [];
    for (String s in mdss) {
      print(s);
      list.add(s);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Row2(Text('MDS'), this.widget.mdsSpin)),
          Divider(thickness: Const.divThickness,),
      Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: Row2(
            CustomButton(
              'I Accept',
              onPressed: () {
                this.widget.onPressed();
              },
            ),
            CustomButton(
              'Help',
              onPressed: () {
                print('help');
              },
            ),
          ))
    ]);
  }
}
