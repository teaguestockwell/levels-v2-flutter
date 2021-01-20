import '../../widgets/layout/cards/cardAllwaysOpen.dart';
import '../../backend/cont.dart';
import '../../backend/model.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/validatedText.dart';
import '../../widgets/layout/div.dart';
import '../../widgets/layout/rows/row2.dart';
import '../../utils.dart';
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartCCard extends StatefulWidget {
  final nwfs = NameWeightFS();
  final Aircraft air;
  final NotifyCargoValid onValidationChange;
  ///the inti state of false of this map is handled by the callback of validated text after drawn
  final childrenValid = LinkedHashMap<int, bool>();

  ChartCCard(this.air, this.onValidationChange);

  //iterates though map and calls back to permac
  bool getThisValid() {
    bool ret = true;
    childrenValid.forEach((_, value) {
      if (!value) {
        ret = false;
      }
    });
    onValidationChange(0, ret);
    return ret;
  }

  @override
  ChartCCardState createState() => ChartCCardState();
}

class ChartCCardState extends State<ChartCCard> {
  bool valid = false;
  List<Widget> body;

  @override
  initState() {
    super.initState();

    //init valididation within map
    this.widget.childrenValid[0] = false;
    this.widget.childrenValid[1] = false;

    ///init the basic acft nwfs
    this.widget.nwfs.name = 'Basic Aircraft';
    this.widget.nwfs.simplemom = this.widget.air.simplemom;

    //init the cards body
    body = [
      Row2(
          Tex('Basic Weight'),
          ValidatedText(
            inputType: 1,
            maxChars: 12,
            notifyIsValid: (b) {updateValidChildren(0,b);},
            validateText: _validateWeight,
            onChange: (String weight) {
              this.widget.nwfs.weight = weight;
            },
          )),

      Div(),

      Row2(
          Tex('Basic Moment'),
          ValidatedText(
            maxChars: 12,
            inputType: 1,
            notifyIsValid: (b) {updateValidChildren(1,b);},
            validateText: _validateMoment,
            onChange: (String mom) {
              this.widget.nwfs.mom = mom;
            },
          )),
    ];
  }

  bool _validateWeight(String weight) {
    if (double.tryParse(weight) != null &&
        double.parse(weight) >= double.parse(this.widget.air.weight0) &&
        double.parse(weight) <= double.parse(this.widget.air.weight1)) {
      return true;
    }
    return false;
  }

  bool _validateMoment(String mom) {
    if (double.tryParse(mom) != null &&
        double.parse(mom) >= double.parse(this.widget.air.mom0) &&
        double.parse(mom) <= double.parse(this.widget.air.mom1)) {
      return true;
    }
    return false;
  }

   /// 0= weight, 1=moment
  void updateValidChildren(int id, bool valid) {
    //insert validation into map
    this.widget.childrenValid[id] = valid;

    //iterate though map to see if all children are valid
    bool newValid = this.widget.getThisValid();

    //if validation has changed, update ti
    if (this.valid != newValid) {
      setState(() {
        this.valid = newValid;
      });
    }
  }

  Color getTitleColor() {
    if (valid) {
      return Const.nonfocusedBoderColors;
    }
    return Const.nonfocusedErrorBoderColor;
  }

  @override
  Widget build(_) {
    return CardAllwaysOpen(
      title: 'Chart C',
      color: getTitleColor(),
      children: body,
    );
  }
}
