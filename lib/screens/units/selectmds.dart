

import '../../widgets/input/buttonModalSpinner.dart';
import '../../backend/cont.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/customButton.dart';
import '../../widgets/layout/cards/ccard.dart';
import '../../widgets/layout/rows/row2.dart';
import '../../utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectMDSBody extends StatefulWidget {
  final String mdsCSV;
  final IntCallBack onPressed;
  SelectMDSBody(this.mdsCSV, {@required this.onPressed});
  @override
  _SelectMDSBodyState createState() => _SelectMDSBodyState();
}

class _SelectMDSBodyState extends State<SelectMDSBody> {
  List<String> mdss;
  String selectedMDS;
  ButtonModalSpinner mdsSpin;

  @override
  void initState() {
    mdss = this.widget.mdsCSV.split(',');
    mdsSpin = ButtonModalSpinner(
      stringList: getMDS(),
      onSpin: spin,
      );
    super.initState();
  }

  void spin(int x){

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
    return CCards('Aircraft',Column(children: [
      Row2(Tex('MDS'), mdsSpin),
          Divider(color: Const.divColor,thickness: Const.divThickness,),
      Row2(
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
          )
    ]));
  }
}
