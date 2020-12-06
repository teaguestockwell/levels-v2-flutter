import 'package:auto_size_text/auto_size_text.dart';
import 'package:five_level_one/Backend/cont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import '../Uitls.dart';
import 'Rows.dart';

class CustomTextField extends StatefulWidget {
  var c = TextEditingController();
  CustomTextField(this.c);
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  InputDecoration dec;
  @override
  initstate(){
    dec = InputDec.wi;
    this.widget.c.addListener((){ 
      
    });
      
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
      Container(
        height: Const.pickerHeight,
        width: Const.pickerWidth,
        child: TextField(
          controller: this.widget.c,
          decoration: dec,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: <TextInputFormatter>[DecimalTextInputFormatter()],
          textAlign: TextAlign.center,
        )
      );
  }
}


typedef void OnTextChange(String text);
typedef bool ValidateText(String text);
typedef void NotifyValid(bool valid);

class ValidatedText extends StatefulWidget {
  ///
  int maxChars;
  ///select input type 0=int, 1=double, 2=string
  int inputType;
  ///updated when changed, also see bool void notifyIsValid(bool valid)
  bool valid = false;
  ///updated when text is changed
  String text='';
  ///called when text is changed
  NotifyValid notifyIsValid = (_){}; 
  ///called when text is changed
  OnTextChange onChange = (_){}; 
  ///called when text is changed, changes border around text
  ValidateText validateText = (_){return true;};

  TextEditingController _c = TextEditingController();

  ValidatedText({
    this.inputType=1,
    this.onChange,
    this.notifyIsValid,
    this.validateText,
    this.maxChars=12
  });

  @override
  _ValidatedTextState createState() => _ValidatedTextState();
}

class _ValidatedTextState extends State<ValidatedText> {
  InputDecoration dec = InputDec.re;
  Widget ret;

  @override
  void initState() {
    _addListner();
    ret = _getCustomTextFeild(this.widget.inputType);
    super.initState();
  }

  void _addListner(){
    this.widget._c.addListener((){ 

      //validate the text and set outline to red or white
      String text = this.widget._c.text;
      if(this.widget.validateText(text)){
        this.widget.valid=true;
        setState(() {
          dec = InputDec.wi;
        });
      }
      else{
        this.widget.valid=false;
        setState(() {
          dec = InputDec.re;
        });
      }

      //notify valid and on change if not null
      this.widget?.onChange(text); 
      this.widget?.notifyIsValid(this.widget.valid);
    });
  }


  Widget _getCustomTextFeild(int type){
    switch (type){
      case 0: //ints only
        return 
          Container(
            height: Const.pickerHeight,
            width: Const.pickerWidth,
              child: TextField(
                controller: this.widget._c,
                decoration: dec,
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                inputFormatters: [
                  DecimalTextInputFormatter(),
                  LengthLimitingTextInputFormatter(this.widget.maxChars),
                  ],
                textAlign: TextAlign.center,
              )
          );
      case 1: //doubles only
        return 
          Container(
            height: Const.pickerHeight,
            width: Const.pickerWidth,
            child: TextField(
              controller: this.widget._c,
              decoration: dec,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                DecimalTextInputFormatter(),
                LengthLimitingTextInputFormatter(this.widget.maxChars),
                ],
              textAlign: TextAlign.center,
            )
          );
      case 2: //all chars
        return 
          Container(
            height: Const.pickerHeight,
            width: Const.pickerWidth,
            child: TextField(
              controller: this.widget._c,
              decoration: dec,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(this.widget.maxChars),
              ],
            )
          );
      default: throw (type.toString() + ' is not 0, 1, or 2');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getCustomTextFeild(this.widget.inputType);
  }
}

class CustomTextFieldText extends StatefulWidget {
  TextEditingController t;
  double width;
  int maxSize;
  CustomTextFieldText(this.t) {
    width = Const.pickerWidth;
  }
  CustomTextFieldText.d(this.t) {
    width = Const.pickerWidth * 2.0;
  }
  @override
  _CustomTextFieldTextState createState() => _CustomTextFieldTextState();
}

class _CustomTextFieldTextState extends State<CustomTextFieldText> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Const.pickerHeight,
        width: this.widget.width,
        child: TextField(
            keyboardType: TextInputType.name,
            textAlign: TextAlign.center,
            controller: this.widget.t,
            decoration: InputDec.wi));
  }
}
class CustomTextFieldNumSize extends StatefulWidget {
  final TextEditingController t;
  final int maxSize;
  final bool decimal;
  StringCallBack onChange;
  CustomTextFieldNumSize(this.t,this.maxSize,{this.decimal=true, this.onChange});
  @override
  _CustomTextFieldNumSizeState createState() => _CustomTextFieldNumSizeState();
}

class _CustomTextFieldNumSizeState extends State<CustomTextFieldNumSize> {

  change(String x){
    this.widget.onChange?.call(x);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Const.pickerHeight*1.7,
        width: Const.pickerWidth,
        child: TextField(
            onChanged: change,
            maxLength: this.widget.maxSize,
            keyboardType: TextInputType.numberWithOptions(decimal: this.widget.decimal),
            textAlign: TextAlign.center,
            controller: this.widget.t,
            decoration: InputDec.wi));
  }
}

class CustomTextFieldTextMax extends StatefulWidget {
  TextEditingController t;
  StringCallBack onChange;
  CustomTextFieldTextMax(this.t,this.onChange);

  @override
  _CustomTextFieldTextMaxState createState() => _CustomTextFieldTextMaxState();
}

class _CustomTextFieldTextMaxState extends State<CustomTextFieldTextMax> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Const.pickerHeight*1.7,
        child: TextField(
          onChanged: this.widget.onChange,
          maxLength: 45,
            keyboardType: TextInputType.name,
            textAlign: TextAlign.center,
            controller: this.widget.t,
            decoration: InputDec.wi));
  }
}

typedef void IntCallBack();
typedef void IntCallBackIntPara(int i);
typedef void StringCallBack(String x);
typedef void DateCallBack(DateTime);

class CustomButton extends StatelessWidget {
  final String text;
  final IntCallBack onPressed;
  var autoSizeGroup = AutoSizeGroup();
  CustomButton(this.text, {this.onPressed,this.autoSizeGroup});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Const.pickerHeight,
      width: Const.pickerWidth,
      decoration: BoxDecoration(
        color: Const.buttonColor,
        borderRadius: BorderRadius.circular(8)
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child:FlatButton(
          onPressed: onPressed,
          child: Tex(this.text,autoSizeGroup: this.autoSizeGroup),
          ),
    )
    );
  }
}

class InputDec {
  static final OutlineInputBorder _wi = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Const.focusedBorderColor,
        width: Const.divThickness,
      ),
    );

    static final OutlineInputBorder _wiNF = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Const.nonfocusedBoderColors,
        width: Const.divThickness,
      ),
    );

  static final OutlineInputBorder _re = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Const.focusedErrorBorderColor,
        width: Const.divThickness,
      ),
    );

    static final OutlineInputBorder _reNF = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Const.nonfocusedErrorBoderColor,
        width: Const.divThickness,
      ),
    );

  static final InputDecoration wi = InputDecoration(
    enabledBorder: _wiNF,
    focusedBorder: _wi,
  );

  static final InputDecoration re = InputDecoration(
    enabledBorder: _reNF,
    focusedBorder: _re,
  );
}

class CustomButtomSpinnerModalString extends StatefulWidget {
  int spinIdx;
  String selected;
  final asg = AutoSizeGroup();
  var timesPressed =0;
  var spinnerWidgets = List<Widget>();
  final List<String> stringList;
  final IntCallBackIntPara onPressed;

  CustomButtomSpinnerModalString(this.stringList,{this.spinIdx, this.onPressed,this.selected});
  @override
  _CustomButtomSpinnerModalStringState createState() =>
      _CustomButtomSpinnerModalStringState();
}

class _CustomButtomSpinnerModalStringState
    extends State<CustomButtomSpinnerModalString> {
  @override
  void initState() {
    this.widget.spinIdx ??= 0;
    this.widget.selected = this.widget.stringList[this.widget.spinIdx];
    super.initState();
  }

   _getSpinnerWidgets() {
    
    this.widget.spinnerWidgets.clear();
    for (String x in this.widget.stringList) {
      this.widget.spinnerWidgets.add(
        Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Tex(
            x,
            autoSizeGroup: this.widget.asg,
          )
        )
      );
      print(x);
    }
  }

  void _spin(int newIdx) {
    this.widget.spinIdx = newIdx;
    this.widget.selected = this.widget.stringList[newIdx];

    this.widget.onPressed?.call(newIdx);
    //rebuild to change button text
    setState(() {});
  }

  press(){
    //build children only on first press
    if(this.widget.timesPressed==0){_getSpinnerWidgets();}
    this.widget.timesPressed++;
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
                    child: Center(
                        child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                        initialItem: this.widget.spinIdx),
                      children: this.widget.spinnerWidgets,
                      onSelectedItemChanged: _spin,
                      itemExtent: 35,
                    )
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
    return CustomButton(
      this.widget.selected,
      onPressed: press,
    );
  }
}

class CustomButtonDatePicker extends StatelessWidget {
  String buttText;
  DateCallBack onChange;
  DateTime currentTime;
  CustomButtonDatePicker(
    {
      @required this.buttText,
      @required this.onChange,
      @required this.currentTime,
    }
  );
  @override
  Widget build(BuildContext context) {
    return 
    CustomButton(
      buttText,
      onPressed: () {
        DatePicker.showDatePicker(
          context,
          showTitleActions: false,
          onChanged: this.onChange,
          currentTime: this.currentTime,
          locale: LocaleType.en,
          theme: DatePickerTheme(
            backgroundColor: Const.modalPickerColor,
            itemStyle: TextStyle(
              color: Const.textColor,
              fontWeight: Const.textWeight,
              fontSize: Const.maxTextSize
            ),
            doneStyle: TextStyle(
            color: Const.textColor,
              fontSize: Const.maxTextSize
            )
          ), 
        );
      },
    );
  }
}

class CustomButtonDateTimePicker extends StatelessWidget {
  String buttText;
  ///use (DateTime)=>{your code here}
  DateCallBack onChange;
  DateTime currentTime;
  ///default yyyy MM dd
  DateFormat dateFormat;
  CustomButtonDateTimePicker(
    {
      @required this.buttText,
      @required this.onChange,
      @required this.currentTime,
      this.dateFormat,
    }
  ){
    this.dateFormat = DateFormat('yyyy MM dd HH:mm');
  }
  @override
  Widget build(BuildContext context) {
    return 
    CustomButton(
      buttText,
      onPressed: () {
        DatePicker.showDateTimePicker(
          context,
          showTitleActions: false,
          onChanged: this.onChange,
          currentTime: this.currentTime,
          locale: LocaleType.en,
          theme: DatePickerTheme(
            backgroundColor: Const.modalPickerColor,
            itemStyle: TextStyle(
              color: Const.textColor,
              fontWeight: Const.textWeight,
              fontSize: Const.maxTextSize
            ),
            doneStyle: TextStyle(
            color: Const.textColor,
              fontSize: Const.maxTextSize
            )
          ), 
        );
      },
    );
  }
}

