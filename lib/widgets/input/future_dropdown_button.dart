import 'package:flutter/material.dart';
import '../../constant.dart';
class FutureDropDownButton extends StatelessWidget {
  /// call back of the newly selected model
  final void Function(Map<String, dynamic>) onChange;
  /// the key where the val is the models pk
  final String apiModelPK;
  /// the future containg a list of models
  final Future<List<dynamic>> future;
  /// the primary key of the model to be displayied first and passed to onchange after initState
  final int initPKID;
  /// msg shown when future res.length = 0
  final String onEmptyMSG;

  FutureDropDownButton({
    @required this.onEmptyMSG,
    @required this.onChange,
    @required this.apiModelPK,
    @required this.future,
    this.initPKID = -1 // -1 is never a valid index
  }) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: future,
        builder: (_,sh) {
          if (sh.data != null && sh.data.length > 0) {
              return DropDownButton(
                apiModelPK: apiModelPK,
                onChange: onChange,
                initPKID: initPKID,
                jsonList: sh.data
              );
          }  else if(sh.data != null){
            return Container(
                key: Key('empty'),
                height: 50,
                child: Text(onEmptyMSG, style: dmDisabled)
            );
          } else {
            return Container(
              key: Key('loading'),
              height: 50,
              child: Text('Loading', style: dmDisabled)
            );
          }
        }
    );
  }
}
class DropDownButton extends StatefulWidget {
  /// k = seachfield v = model's pk
  final List<Map<String, dynamic>> jsonList;
  /// call back of the newly selected model
  final void Function(Map<String, dynamic>) onChange;
  /// the primary key of the model
  final int initPKID;
  /// the key where the val is the models pk
  final String apiModelPK;

  DropDownButton({
    @required this.apiModelPK,
    @required this.jsonList,
    @required this.onChange,
    @required this.initPKID
  }) : super(key: UniqueKey());

  @override
  DropDownButtonState createState() => DropDownButtonState();
}

class DropDownButtonState extends State<DropDownButton> {
  var _dropdownMenuItems = <DropdownMenuItem<String>>[];
  String selected;
  //Map<int, int> pkiDIndexMap = {};

  @override
  void initState() {
    super.initState();

    _dropdownMenuItems = buildDropdownMenuItems();

    // if has init index
    if (this.widget.initPKID != -1) {

      // init drop title to pkid using map
      selected = this.widget.jsonList.firstWhere(
        (obj) => obj[this.widget.apiModelPK] == this.widget.initPKID
      )[searchField];

    } else {
      selected = this.widget.jsonList[0][searchField];
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // init state to displaied element
      this.widget.onChange(
        this.widget.jsonList.firstWhere(
          (obj) => obj[searchField] == selected
        )
      );
    });
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItems() {
    return this.widget.jsonList.map<DropdownMenuItem<String>>(
      (obj) => DropdownMenuItem(
        key: UniqueKey(),
        value: obj[searchField],
        child: Text(obj[searchField],style: dmDisabled),
        onTap: () => this.widget.onChange(obj),
      )
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: DropdownButton(
        isExpanded: true,
        value: selected,
        items: _dropdownMenuItems,
        onChanged: (x) => setState(() => selected = x),
      ),
    );
  }
}