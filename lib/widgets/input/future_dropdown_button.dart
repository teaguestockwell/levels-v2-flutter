import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../util.dart';
class FutureDropDownButton extends StatelessWidget {
  /// call back of the newly selected model
  final void Function(Map<String, dynamic>) onChange;
  /// the key where the val is the models pk
  final String apiModelPK;
  /// the future containg a list of models
  final Future<List<dynamic>> future;
  /// the primary key of the model to be displayied first and passed to onchange after initState
  final int initID;
  /// msg shown when future res.length = 0
  final String onEmptyMSG;

  FutureDropDownButton({
    @required this.onEmptyMSG,
    @required this.onChange,
    @required this.apiModelPK,
    @required this.future,
    this.initID = -1 // -1 is never a valid index
  }) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: future,
        builder: (_,sh) {
          if (sh.data != null && sh.data.length > 0) {
              return DropDownButton(
                onChange: onChange,
                initID: initID,
                map: mapOfNameIDFromAPIGetN(sh.data, apiModelPK)
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
  final Map<String, dynamic> map;
  /// call back of the newly selected model
  final void Function(Map<String, dynamic>) onChange;
  /// the primary key of the model
  final int initID;

  DropDownButton({
    @required this.map,
    @required this.onChange,
    @required this.initID
    }) : super(key: UniqueKey());

  @override
  DropDownButtonState createState() => DropDownButtonState();
}

class DropDownButtonState extends State<DropDownButton> {
  var _dropdownMenuItems = <DropdownMenuItem<String>>[];
  String selected;
  Map<int, int> pkiDIndexMap = {};

  @override
  void initState() {
    super.initState();

    _dropdownMenuItems = buildDropdownMenuItems();

    // if has init index
    if (this.widget.initID != -1) {

      // init drop title to pkid using map
      selected = _dropdownMenuItems[pkiDIndexMap[this.widget.initID]].value;

    } else {
      selected = _dropdownMenuItems[0].value;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // init state to displaied element
      this.widget.onChange(Map.fromEntries(this.widget.map.entries.where((x) => x.key == selected)));
    });
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItems() {
    final items = <DropdownMenuItem<String>>[];
    int counter = 0;
    this.widget.map.forEach((k, v) {
      pkiDIndexMap[v] = counter;
      counter++;
      items.add(
        DropdownMenuItem(
          key: UniqueKey(),
          value: k,
          child: Text(k, style: dmDisabled),
          onTap: () => this.widget.onChange({k: v}),
        )
      );
    });
    return items;
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