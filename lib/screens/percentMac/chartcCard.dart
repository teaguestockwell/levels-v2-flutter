

import 'dart:collection';

import 'package:five_level_one/backend/model.dart';
import 'package:five_level_one/widgets/display/text.dart';
import 'package:five_level_one/widgets/input/validatedText.dart';
import 'package:five_level_one/widgets/layout/cards/cardAllwaysOpen.dart';
import 'package:five_level_one/widgets/layout/div.dart';
import 'package:five_level_one/widgets/layout/rows/row2.dart';
import 'package:flutter/cupertino.dart';

import '../../utils.dart';

class ChartCCard extends StatelessWidget {
  String _stringWeight = '0';
  String _stringMom = '0';
  Aircraft air;
  NotifyCargoValid onValidationChange;
  var childrenValid = LinkedHashMap<int,bool>();
  bool valid;
  

  ChartCCard(this.air, this.onValidationChange);

  /// do not call this before checking bool getValid()
  NameWeightFS getNWFS(){
    if(valid){
      return
      NameWeightFS(
        name: 'Basic Aircraft',
        weight: _stringWeight,
        mom: _stringMom,
        simplemom: air.simplemom,
      );
    }
    throw Exception('getNWFS was called on invalid Chart C');
  }

  bool getThisValid(){
    bool ret = true;
    childrenValid.forEach((_,value) { 
      if(!value){ret=false;}
    });
    valid = ret;
    onValidationChange(0,ret);
    return ret;
  }

  /// 0= weight, 1=moment
  void updateValidChildren(int id, bool valid){
    this.childrenValid[id] =  valid;
    getThisValid();
  }


  bool _validateWeight(String weight){
    if(
      double.tryParse(weight) != null 
      &&
      double.parse(weight) >= double.parse(air.weight0)
      &&
      double.parse(weight) <= double.parse(air.weight1)
    ){ 
      updateValidChildren(0,true); return true;
    }
      updateValidChildren(0,false); return false;
  } 

  bool _validateMoment(String mom){
    if(
      double.tryParse(mom) != null 
      &&
      double.parse(mom) >= double.parse(air.mom0)
      &&
      double.parse(mom) <= double.parse(air.mom1)
    ){ 
     updateValidChildren(1,true); return true;
    }
   updateValidChildren(1,false); return false;
  }

  @override
  Widget build(_) {
    return CardAllwaysOpen(
      'Chart C', 
      Column(
        children: [

          Row2(
            Tex('Basic Weight'),
            ValidatedText(
              inputType: 1,
              notifyIsValid: (_){},
              validateText: _validateWeight,
              onChange: (String weight){_stringWeight = weight;},
            )
          ),

          Div(),

          Row2(
            Tex('Basic Moment'),
            ValidatedText(
              inputType: 1,
              notifyIsValid: (_){},
              validateText: _validateMoment,
              onChange: (String mom){_stringMom = mom;},
            )
          ),
        ]
      )
    );
  }
}