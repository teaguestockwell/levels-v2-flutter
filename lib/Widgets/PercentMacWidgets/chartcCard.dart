import 'dart:collection';

import 'package:five_level_one/Backend/model.dart';
import 'package:five_level_one/Widgets/UIWidgets/Cards.dart';
import 'package:five_level_one/Widgets/UIWidgets/Input.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:five_level_one/Widgets/Uitls.dart';
import 'package:flutter/material.dart';

class ChartCCard extends StatelessWidget {

  bool  _validWeight = false;
  bool _validMoment = false;
  String _stringWeight = '0';
  String _stringMom = '0';
  Aircraft air;
  NotifyCargoValid onValidationChange;
  var childrenValid = LinkedHashMap<int,bool>();
  

  ChartCCard(this.air);

  /// do not call this before checking bool getValid()
  NameWeightFS getNWFS(){
    if(getValid()){
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

  getThisValid(){
    childrenValid.
  }



  /// is the nwfs valid for this acft?
  bool getValid(){
    if(_validMoment && _validWeight){return true;}
    return false;
  }

  /// 0= weight, 1=moment
  void updateValidChildren(int id, bool valid){
    this.childrenValid[id] =  valid;
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
              notifyIsValid: (bool isValid){_validWeight = isValid;},
              validateText: _validateWeight,
              onChange: (String weight){_stringWeight = weight;},
            )
          ),

          Div(),

          Row2(
            Tex('Basic Moment'),
            ValidatedText(
              inputType: 1,
              notifyIsValid: (bool isValid){_validMoment = isValid;},
              validateText: _validateMoment,
              onChange: (String mom){_stringMom = mom;},
            )
          ),
        ]
      )
    );
  }
}