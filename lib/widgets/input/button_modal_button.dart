import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../backend/const.dart';
import '../../backend/utils.dart';
import '../display/text.dart';
import 'custom_button.dart';

class ButtonModalButton extends StatefulWidget {
  final List<String> stringList;
  final IntCallBackIntPara onPress;
  final String modalButtonText;
  final String buttText;

  ButtonModalButton({
      @required this.buttText,
      @required this.onPress,
      @required this.stringList,
      @required this.modalButtonText})
      : 
        assert(onPress != null),
        assert(stringList != null),
        assert(modalButtonText != null),
        assert(stringList.isNotEmpty);

  @override
  _ButtonModalButtonState createState() =>
      _ButtonModalButtonState();
}

class _ButtonModalButtonState extends State<ButtonModalButton> {
   List<Widget> spinnerWidgets;
  int spinIdx = 0;
  FixedExtentScrollController sc;

  @override
  void initState() {
    super.initState();
    spinnerWidgets =getSpinnerWidgets(this.widget.stringList);
    sc = FixedExtentScrollController(initialItem: spinIdx);
  }

   List<Widget> getSpinnerWidgets(List<String> strings) {
    return List.generate(strings.length, (i) {
      return Center(
          key: Key('spinner'),
          child: Tex(
            strings[i],
            size: Const.textSizeModalSpinner,
            fontWeight: Const.fwSpinner,
          ));
    });
  }

  @override
  void dispose() {
    sc.dispose();
    super.dispose();
  }

  void pressModal() {
    Navigator.pop(context);
    this.widget.onPress(spinIdx);
  }

    void _spin(int newIdx) {
    if (this.mounted) {
      setState(() {
        spinIdx = newIdx;
        sc = FixedExtentScrollController(initialItem: spinIdx);
      });
    }
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
                              scrollController: sc,
                              onSelectedItemChanged: _spin,
                              itemExtent: 35,
                              children: spinnerWidgets)),
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
      this.widget.buttText,
      onPressed: press,
    );
  }
}
