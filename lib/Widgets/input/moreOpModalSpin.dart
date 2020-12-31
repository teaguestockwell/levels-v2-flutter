import 'package:five_level_one/backend/cont.dart';
import 'package:five_level_one/backend/model.dart';
import 'package:five_level_one/widgets/display/text.dart';
import 'package:five_level_one/widgets/input/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreOpModal extends StatefulWidget {
  final MoreOp moreOp;
  MoreOpModal(this.moreOp);
  @override
  _MoreOpModalState createState() => _MoreOpModalState();
}

class _MoreOpModalState extends State<MoreOpModal> {
  int spinIdx =0;
  int _timesPressed = 0;
  var _spinnerWidgets = List<Widget>();

  void _spin(int newIdx) {
    spinIdx = newIdx;
  }

  void select()async{
    String url = Uri.encodeFull(this.widget.moreOp.url[spinIdx]);
    if (await canLaunch(url)) {
      await launch(url);
    }
    else{
    Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Const.modalPickerColor,
        content: 
        Container(
          height: Const.pickerHeight*2,
         child:Center(child: 
        Tex('Error, please email tsAppDevelopment@gmail.com', fontWeight: FontWeight.bold,color: Const.nonfocusedErrorBoderColor,)))));
    }

  }

   _getSpinnerWidgets() {
    _spinnerWidgets.clear();
    
    this.widget.moreOp.name.forEach((name) {
      _spinnerWidgets.add(
        Center(
          child: Tex(
            name,
            size: Const.textSizeModalSpinner,
            fontWeight: Const.fwSpinner,
            color: Const.textColor,
          )
        )
      );
    });
  }

  press() {
    //build children only on first press
    if (_timesPressed == 0) {
      _getSpinnerWidgets();
      _timesPressed++;
    }
    _timesPressed++;
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: Const.modalSpinHeight,
          color: Const.modalPickerColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: Const.modalSpinHeight,
                  child: Column(children: [

                    Flexible(child: Container()),
                    
                    Flexible(
                      flex: 9,
                      child:
                      CupertinoPicker(
                        scrollController: FixedExtentScrollController(
                          initialItem: spinIdx),
                        children: _spinnerWidgets,
                        onSelectedItemChanged: _spin,
                        itemExtent: 35,
                      )
                    ),
                    
                    Flexible(child: Container()),
                    
                    Flexible(
                      flex: 3,
                      child:
                      CustomButton('Select',
                      onPressed: (){Navigator.pop(context); select();},
                      )
                    ),

                    Flexible(child: Container()),

                    ]
                  )
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return 
    InkWell(
      onTap: press,
      child: Padding(padding: EdgeInsets.only(left: 20, right: 20), 
        child: Icon(
          Icons.more_vert
        )
      )
    );
  }
}
