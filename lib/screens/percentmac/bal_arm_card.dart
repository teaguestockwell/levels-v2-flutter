import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../models/nested/per_mac.dart';
import '../../widgets/display/text.dart';
import '../../widgets/layout/ccard.dart';

class BalArmCard extends StatelessWidget {
  final PerMac permac;
  BalArmCard(this.permac);

  List<DataRow> getRows(){
    List<DataRow> ret = [];
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
    return CCard(
      name: 'Balance Arm',
      initOpen: true,
      children: [SingleChildScrollView(scrollDirection: Axis.horizontal, physics: ClampingScrollPhysics(), child:
      DataTable(
        dividerThickness: divThickness,
        columns: [
          DataColumn(label: Tex('Balance Arm')),
          DataColumn(label: Tex('=')),
          DataColumn(label: Tex('Moment')),
          DataColumn(label: Tex('/')),
          DataColumn(label: Tex('Total Weight')),
        ],
        rows: getRows(),
      )
      )]
    );
  }
}