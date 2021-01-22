import 'dart:collection';

import 'package:flutter/material.dart';

import '../../backend/const.dart';
import '../../backend/models/name_weight_fs.dart';
import '../../backend/utils.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/custom_button.dart';
import '../../widgets/input/validated_text.dart';
import '../../widgets/layout/align_padding.dart';
import '../../widgets/layout/cards/ccard.dart';
import '../../widgets/layout/div.dart';
import '../../widgets/layout/rows/row1.dart';
import '../../widgets/layout/rows/row2.dart';

class ValidatedCargoUI extends StatefulWidget {
  final String fs0, fs1, cargoMaxWeight;
  final NameWeightFS nwf;
  final IntCallBackIntPara onRemovePressed;
  final NotifyCargoValid notifyValid;

  ValidatedCargoUI(
      {@required this.fs0,
      @required this.fs1,
      @required this.cargoMaxWeight,
      @required this.nwf,
      @required this.onRemovePressed,
      @required this.notifyValid})
      : super(key: UniqueKey());

  @override
  ValidatedCargoUIState createState() => ValidatedCargoUIState();
}

class ValidatedCargoUIState extends State<ValidatedCargoUI> {
  bool valid = false;
  List<Widget> children;
  var childValid = LinkedHashMap<int, bool>();
  bool ope = false;

  @override
  initState() {
    super.initState();

    //init valid map to refect init state of nwfs
    childValid[0] = validateName(this.widget.nwf.name);
    childValid[1] = validateWeight(this.widget.nwf.weight);
    childValid[2] = validateFS(this.widget.nwf.getfs());
    childValid[3] = validateQty(this.widget.nwf.qty);
    
    //call back because this may set state again 
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateAllValid();
    });

    children = [
      Row1(ValidatedText(
        initText: this.widget.nwf.name,
        inputType: 2,
        onChange: changeName,
        maxChars: 30,
        validateText: validateName,
        width: double.infinity, 
        notifyIsValid: (v) {updateValid(0, v);},
      )),
      Div(),
      Row2(
          Tex('Weight'),
          ValidatedText(
            notifyIsValid: (v) {updateValid(1, v);},
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
            notifyIsValid: (v) {updateValid(2, v);},
            initText: this.widget.nwf.getfs(),
            inputType: 1,
            onChange: changeFS,
            maxChars: 8,
            validateText: validateFS,
          )),
      Div(),
      Row2(
          Tex('Qty'),
          ValidatedText(
            notifyIsValid: (v) {updateValid(3, v);},
            initText: this.widget.nwf.qty,
            inputType: 1,
            onChange: changeQty,
            maxChars: 8,
            validateText: validateQty,
          )),
      Div(),
      Row1(CustomButton(
        'Remove',
        onPressed: () {
          this.widget.onRemovePressed(this.widget.nwf.id);
        },
      )),
    ];
  }

  /// put new value into map of all children
  void updateValid(int id, bool val) {
    childValid[id] = val;
    updateAllValid();
  }

  void updateAllValid() {
    // are all children valid?
    var ret = true;
    childValid.forEach((_, value) {
      if (!value) {
        ret = false;
      }
    });

    //open the card if closed & invalid
    bool wasOpened =false;
    if(this.ope == ret){
      ope = true;
      wasOpened =true;
    }

    //if valid has chaged:
    if (this.valid != ret || wasOpened) {
      //notify parent: cargocard
      this.widget.notifyValid(this.widget.nwf.id, ret);
      setState(() {this.valid = ret;});
    }
  }

  bool validateName(String x) {
    if (x.length >= 1) {return true;}
    return false;
  }

  bool validateWeight(String x) {
    if (double.tryParse(x) != null &&
        double.parse(x) > 0 &&
        double.parse(x) <= double.parse(this.widget.cargoMaxWeight)) {
      return true;
    }
    return false;
  }

  bool validateFS(String x) {
    if (double.tryParse(x) != null &&
        double.parse(x) >= double.parse(this.widget.fs0) &&
        double.parse(x) <= double.parse(this.widget.fs1)) {
      return true;
    }
    return false;
  }

  bool validateQty(String x) {
    if (int.tryParse(x) != null && int.parse(x) > 0) {
      return true;
    }
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

  List<Widget> buildInput() {
    if (ope) {
      return children;
    }
    return [Container()];
  }

  toggle() {
    setState(() {
      ope = !ope;
    });
  }

  Widget getCardTitle() {
    if (ope) {
      return TitleCC(
          open: true,
          tex: Tex(
            this.widget.nwf.qty + ' EA ' + Util.getTruncated(this.widget.nwf.name,30),
            fontWeight: FontWeight.normal,
            color: Util.getValidColor(valid),
          ));
    }
    return TitleCC(
        open: false,
        tex: Tex(
          this.widget.nwf.qty + ' EA ' + Util.getTruncated(this.widget.nwf.name,30),
          fontWeight: FontWeight.normal,
          color: Util.getValidColor(valid),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.fromLTRB(Const.cardP, Const.cardP, Const.cardP, 0.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Card(
                color: Const.cargoUIColor,
                shape: Border(
                    top: BorderSide(
                  color: Const.cargoUIColor,
                  width: Const.cardTabSize,
                )),
                child: Column(
                  children: [
                    InkWell(
                      key: Key('tap'),
                      child:
                          AlignPadding(3.0, Alignment.center, getCardTitle()),
                      onTap: toggle,
                    ),
                    Column(children: buildInput())
                  ],
                ))));
  }
}
