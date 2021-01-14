import 'customButton.dart';
import '../../backend/cont.dart';
import '../../widgets/display/text.dart';
import '../../utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonModalSpinnerButton extends StatefulWidget {
  final List<String> stringList;
  final IntCallBackIntPara onSpin;
  final IntCallBack onPress;
  final String modalButtonText;

  ButtonModalSpinnerButton(
      {@required this.onSpin,
      @required this.onPress,
      @required this.stringList,
      @required this.modalButtonText})
      : assert(onSpin != null),
        assert(onPress != null),
        assert(stringList != null),
        assert(modalButtonText != null),
        assert(stringList.isNotEmpty);

  @override
  _ButtonModalSpinnerButtonState createState() =>
      _ButtonModalSpinnerButtonState();
}

class _ButtonModalSpinnerButtonState extends State<ButtonModalSpinnerButton> {
  int spinIdx = 0;

  void _spin(int newIdx) {
    this.widget.onSpin(newIdx);
    setState(() {
      spinIdx = newIdx;
    });
  }

  void pressModal() {
    Navigator.pop(context);
    this.widget.onPress();
  }

  press() {
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
                    height: 210,
                    child: Column(children: [
                      Flexible(child: Container()),
                      Flexible(
                          flex: 9,
                          child: CupertinoPicker(
                              scrollController: FixedExtentScrollController(
                                  initialItem: spinIdx),
                              onSelectedItemChanged: _spin,
                              itemExtent: 35,
                              children: List.generate(
                                  this.widget.stringList.length, (idx) {
                                return Center(
                                    child: Tex(
                                  this.widget.stringList[idx],
                                  size: Const.textSizeModalSpinner,
                                  fontWeight: Const.fwSpinner,
                                ));
                              }))),
                      Flexible(child: Container()),
                      CustomButton(
                        this.widget.modalButtonText,
                        onPressed: pressModal,
                      ),
                      Flexible(child: Container()),
                    ])),
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
      this.widget.stringList[spinIdx],
      onPressed: press,
    );
  }
}
