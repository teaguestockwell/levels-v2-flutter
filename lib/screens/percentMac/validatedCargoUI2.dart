import 'dart:collection';

import 'package:five_level_one/Widgets/input/customButton.dart';
import 'package:five_level_one/Widgets/input/validatedText.dart';
import 'package:five_level_one/Widgets/layout/rows/row1.dart';
import 'package:five_level_one/Widgets/layout/rows/row2.dart';
import 'package:five_level_one/backend/cont.dart';
import 'package:five_level_one/backend/model.dart';
import 'package:five_level_one/utils.dart';
import 'package:five_level_one/widgets/display/text.dart';
import 'package:five_level_one/widgets/layout/cards/ccard.dart';
import 'package:five_level_one/widgets/layout/div.dart';
import 'package:flutter/material.dart';

class ValidatedCargoUI2 extends StatefulWidget {
  /////determines to get caculated or non caculated fs
  final String fs0, fs1, cargomaxweight;
  final NameWeightFS nwf;
  final IntCallBackIntPara onPressed;
  final Key key;
  final NotifyCargoValid notifyValid;
  final IntCallBack reDrawParent;

  ValidatedCargoUI2(
      {@required this.fs0,
      @required this.reDrawParent, 
      @required this.fs1,
      @required this.cargomaxweight,
      @required this.nwf,
      @required this.onPressed,
      @required this.key,
      @required this.notifyValid})
      : super(key: key);

  @override
  _ValidatedCargoUI2State createState() => _ValidatedCargoUI2State();
}

class _ValidatedCargoUI2State extends State<ValidatedCargoUI2> {
  bool valid = false;
  List<Widget> children;
  var childValid = LinkedHashMap<int, bool>();

  @override
  initState() {
    super.initState();

    children = [
      RowCenterOne(ValidatedText(
        initText: this.widget.nwf.name,
        inputType: 2,
        onChange: changeName,
        maxChars: 30,
        validateText: validateName,
        width: double.infinity,
      )),
      Div(),
      Row2(
          Tex('Weight'),
          ValidatedText(
            initText: this.widget.nwf.weight,
            inputType: 1,
            onChange: changeWeight,
            maxChars: 8,
            validateText: validateWeight,
          )),
      Div(),
      Row2(
          Tex('Fuselage Station'),
          ValidatedText(
            initText: _getNWFfs(),
            inputType: 1,
            onChange: changeFS,
            maxChars: 8,
            validateText: validateFS,
          )),
      Div(),
      Row2(
          Tex('Qty'),
          ValidatedText(
            initText: this.widget.nwf.qty,
            inputType: 1,
            onChange: changeQty,
            maxChars: 8,
            validateText: validateQty,
          )),
      Div(),
      RowCenterOne(CustomButton(
        'Remove',
        onPressed: () {
          this.widget.onPressed(this.widget.nwf.id);
        },
      )),
    ];
  }

  void updateValid(int id, bool val) {
    // put new valid into map
    childValid[id] = val;

    // are all children valid?
    var ret = true;
    childValid.forEach((_, value) {
      if (!value) {
        ret = false;
      }
    });

    //if valid has chaged:
    if (this.valid != ret) {
      //notify parent: cargocard
      this.widget.notifyValid(this.widget.nwf.id, ret);

      setState(() {
        this.valid = ret;
      });
    }
  }

  bool validateName(String x) {
    if (x.length >= 1) {
      updateValid(0, true);
      return true;
    }
    updateValid(0, false);
    return false;
  }

  bool validateWeight(String x) {
    if (double.tryParse(x) != null &&
        double.parse(x) > 0 &&
        double.parse(x) <= double.parse(this.widget.cargomaxweight)) {
      updateValid(1, true);
      return true;
    }
    updateValid(1, false);
    return false;
  }

  bool validateFS(String x) {
    if (double.tryParse(x) != null &&
        double.parse(x) >= double.parse(this.widget.fs0) &&
        double.parse(x) <= double.parse(this.widget.fs1)) {
      updateValid(2, true);
      return true;
    }
    updateValid(2, false);
    return false;
  }

  bool validateQty(String x) {
    if (int.tryParse(x) != null && int.parse(x) > 0) {
      updateValid(3, true);
      return true;
    }
    updateValid(3, false);
    return false;
  }

  void changeName(String x) {
    this.widget.nwf.name = x;
    setState(() {});
  }

  void changeWeight(String x) {
    this.widget.nwf.weight = x;
    //setState(() {});
  }

  void changeFS(String x) {
    this.widget.nwf.fs = x;
    //setState(() {});
  }

  void changeQty(String x) {
    this.widget.nwf.qty = x;
    setState(() {});
  }

  ///determines to get caculated or non caculated fs
  String _getNWFfs() {
    if (this.widget.nwf.mom.isNotEmpty && this.widget.nwf.fs.isEmpty) {
      return this.widget.nwf.getFS();
    }
    return this.widget.nwf.fs;
  }

  Color getColor(bool valid) {
    if (valid) {
      return Const.nonfocusedBoderColors;
    }
    return Const.nonfocusedErrorBoderColor;
  }

  @override
  Widget build(_) {
    return CCard(
      callBack: () {
        setState(() {});
      },
      initOpen: false,
      title: this.widget.nwf.name,
      color: getColor(valid),
      children: [],
    );
  }
}
