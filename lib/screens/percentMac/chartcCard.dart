import '../../widgets/display/titleText.dart';
import 'package:five_level_one/backend/cont.dart';
import '../../widgets/layout/cards/cardAllwaysOpenTex.dart';
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
  final _nwfs = NameWeightFS();
  final Aircraft air;
  final NotifyCargoValid onValidationChange;
  final childrenValid = LinkedHashMap<int, bool>();

  ChartCCard(this.air, this.onValidationChange);

  /// do not call this before checking bool getValid()
  NameWeightFS getNWFS() {
    return this._nwfs;
  }

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

  /// 0= weight, 1=moment
  void updateValidChildren(int id, bool valid) {
    this.childrenValid[id] = valid;
  }

  @override
  _ChartCCardState createState() => _ChartCCardState();
}

class _ChartCCardState extends State<ChartCCard> {
  bool valid;
  Column body;
  int buildId = 0;
  Widget title;

  final titleValid = Tex(
    'Chart C valid',
    fontWeight: FontWeight.normal,
    color: Const.nonfocusedBoderColors,
  );

  final titleInvalid = Tex('Chart C inval',
    fontWeight: FontWeight.normal,
    color: Const.nonfocusedErrorBoderColor
  );

  @override
  initState() {
    super.initState();

    //init valid
    valid = false;
    title = titleInvalid;
    this.widget.childrenValid[0] = false;
    this.widget.childrenValid[1] = false;

    ///init the basic acft nwfs
    this.widget._nwfs.name = 'Basic Aircraft';
    this.widget._nwfs.simplemom = this.widget.air.simplemom;

    //init the cards body
    body = Column(children: [
      Row2(
          Tex('Basic Weight'),
          ValidatedText(
            inputType: 1,
            notifyIsValid: (_) {},
            validateText: _validateWeight,
            onChange: (String weight) {
              this.widget._nwfs.weight = weight;
            },
          )),
      Div(),
      Row2(
          Tex('Basic Moment'),
          ValidatedText(
            inputType: 1,
            notifyIsValid: (_) {},
            validateText: _validateMoment,
            onChange: (String mom) {
              this.widget._nwfs.mom = mom;
            },
          )),
    ]);
  }

  bool _validateWeight(String weight) {
    if (double.tryParse(weight) != null &&
        double.parse(weight) >= double.parse(this.widget.air.weight0) &&
        double.parse(weight) <= double.parse(this.widget.air.weight1)) {
      this.widget.updateValidChildren(0, true);
      updateTitleText();
      return true;
    }
    this.widget.updateValidChildren(0, false);
    updateTitleText();
    return false;
  }

  bool _validateMoment(String mom) {
    if (double.tryParse(mom) != null &&
        double.parse(mom) >= double.parse(this.widget.air.mom0) &&
        double.parse(mom) <= double.parse(this.widget.air.mom1)) {
      this.widget.updateValidChildren(1, true);
      updateTitleText();
      return true;
    }
    this.widget.updateValidChildren(1, false);
    updateTitleText();
    return false;
  }

  updateTitleText() {
    bool newValid = this.widget.getThisValid();
    if (valid != newValid) {
      setState(() {
        valid = newValid;
      });
    }
  }

  @override
  Widget build(_) {
    return CardAllwaysOpenTex(
      tex: TitleText(name: 'Chart C', valid: valid),
      chil: body,
    );
  }
}
