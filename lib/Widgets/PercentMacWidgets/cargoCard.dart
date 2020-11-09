import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Backend/model.dart';
import 'package:five_level_one/Widgets/UIWidgets/Cards.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CargoCard extends StatefulWidget {
  Aircraft air;
  Config selected;
  CargoCard(this.air);
  @override
  _CargoCardState createState() => _CargoCardState();
}

class _CargoCardState extends State<CargoCard> {
  @override
  initState() {
    this.widget.selected = this.widget.air.configs[0];
    super.initState();
  }

  getWidgetForSpinner() {
    List<Widget> list = [];
    for (int i = 0; i < this.widget.air.configs.length; i++) {
      list.add(Padding(
          padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
          child: Text(
            this.widget.air.configs[i].name,
            style: TextStyle(color: Colors.white70, fontSize: 18),
          )));
    }
    return list;
  }

  change(int i) {
    this.widget.selected = this.widget.air.configs[i];
    print(this.widget.selected.name + ' selected');
  }

  Widget build(BuildContext context) {
    return CardAllwaysOpen(
        'Cargo',
        Column(children: <Widget>[
          Row2(
              Text('Select Config'),
              Container(
                  width: Const.pickerWidth,
                  height: Const.pickerHeight,
                  child: CupertinoPicker(
                    children: getWidgetForSpinner(),
                    onSelectedItemChanged: (int i) => {change(i)},
                    itemExtent: 30,
                  )))
        ]));
  }
}
