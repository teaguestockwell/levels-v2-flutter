import '../../backend/cont.dart';
import '../../backend/model.dart';
import '../../widgets/display/text.dart';
import '../../widgets/layout/cards/ccard.dart';
import 'package:flutter/material.dart';

class PerMacCard extends StatelessWidget {
  final PerMac permac;
  PerMacCard(this.permac);

  List<DataRow> getRows(){
    var ret = List<DataRow>();
     ret.add(DataRow(
      cells:[
          DataCell(Tex(permac.perMacPercentAsString+'% = '+permac.perMacDecimalAsString)),
           DataCell(Tex('=')),
           DataCell(Tex(permac.balArmAsString)),
           DataCell(Tex('-')),
           DataCell(Tex(permac.lemacAsString)),
           DataCell(Tex('/')),
           DataCell(Tex(permac.macAsString)),
      ] 
    ));
    return ret;
  }
  @override
  Widget build(BuildContext context) {
    return CCards(
      'Mean Aerodynamic Chord %',
      SingleChildScrollView(scrollDirection: Axis.horizontal, child:
      DataTable(
        dividerThickness: Const.divThickness,
        columns: [
          DataColumn(label: Tex('MAC%')),
          DataColumn(label: Tex('=')),
          DataColumn(label: Tex('Balance Arm')),
          DataColumn(label: Tex('-')),
          DataColumn(label: Tex('LEMAC')),
          DataColumn(label: Tex('/')),
          DataColumn(label: Tex('MAC')),
        ],
        rows: getRows(),
      )
      )
    );
  }
}