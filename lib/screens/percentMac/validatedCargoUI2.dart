import 'dart:collection';
import '../../widgets/input/customButton.dart';
import '../../widgets/input/validatedText.dart';
import '../../widgets/layout/alignPadding.dart';
import '../../widgets/layout/rows/row1.dart';
import '../../widgets/layout/rows/row2.dart';
import '../../backend/cont.dart';
import '../../backend/model.dart';
import '../../utils.dart';
import '../../widgets/display/text.dart';
import '../../widgets/layout/cards/ccard.dart';
import '../../widgets/layout/div.dart';
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
  bool ope = false;

  @override
  initState() {
    super.initState();

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
      Row1(CustomButton(
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

  String getNameTruncated() {
    var ret = this.widget.nwf.name;
    if (ret.length <= 30) {
      return ret;
    }
    return ret.substring(0, 27) + '...';
  }

  Color getColor(bool valid) {
    if (valid) {
      return Const.nonfocusedBoderColors;
    }
    return Const.nonfocusedErrorBoderColor;
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
            this.widget.nwf.qty + ' EA ' + getNameTruncated(),
            fontWeight: FontWeight.normal,
            color: getColor(valid),
          ));
    }
    return TitleCC(
        open: false,
        tex: Tex(
          this.widget.nwf.qty + ' EA ' + getNameTruncated(),
          fontWeight: FontWeight.normal,
          color: getColor(valid),
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
                      child:
                          AlignPadding(3.0, Alignment.center, getCardTitle()),
                      onTap: toggle,
                    ),
                    Column(children: buildInput())
                  ],
                ))));
  }
}
