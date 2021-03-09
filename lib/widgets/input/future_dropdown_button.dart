import 'package:flutter/material.dart';
import '../../constant.dart';
class FutureDropDownButton extends StatelessWidget {
  final void Function(Map<String, dynamic>) onChange;
  final String apiModelPK;
  final Future<List<dynamic>> future;
  final int initID;
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
                map: Map.fromEntries(
                  sh.data.map<MapEntry<String,dynamic>>(
                    (x) => MapEntry(x[searchField],x[apiModelPK]))
                )
              );
          }  else if(sh.data != null){
            return Container(
                height: 50,
                child: Text(onEmptyMSG, style: dmDisabled)
            );
          } else {
            return Container(
              height: 50,
              child: Text('Loading', style: dmDisabled)
            );
          }
        }
    );
  }
}


class DropDownButton extends StatefulWidget {
  final Map<String, dynamic> map;
  final void Function(Map<String, dynamic>) onChange;
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