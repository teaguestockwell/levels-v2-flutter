import 'package:five_level_one/backend/cont.dart';
import 'package:five_level_one/backend/model.dart';
import 'package:five_level_one/widgets/display/text.dart';
import 'package:five_level_one/widgets/layout/cards/cardAllwaysOpen.dart';
import 'package:five_level_one/widgets/layout/cards/ccard.dart';
import 'package:flutter/material.dart';

class BalArmCard extends StatelessWidget {
  final PerMac permac;
  BalArmCard(this.permac);

  List<DataRow> getRows(){
    var ret = List<DataRow>();
     ret.add(DataRow(
      cells:[
        DataCell(Tex(permac.balArmAsString)),
        DataCell(Tex('=')),
        DataCell(Tex(permac.totUnSimpMomAsString)),
        DataCell(Tex('/')),
        DataCell(Tex(permac.totWeightAsSting)),
      ] 
    ));
    return ret;
  }
  @override
  Widget build(BuildContext context) {
    return CardAllwaysOpen(
      'Balance Arm',
      SingleChildScrollView(scrollDirection: Axis.horizontal, child:
      DataTable(
        dividerThickness: Const.divThickness,
        columns: [
          DataColumn(label: Tex('Balance Arm')),
          DataColumn(label: Tex('=')),
          DataColumn(label: Tex('Moment')),
          DataColumn(label: Tex('/')),
          DataColumn(label: Tex('Total Weight')),
        ],
        rows: getRows(),
      )
      )
    );
  }
}