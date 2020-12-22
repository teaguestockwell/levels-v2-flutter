import 'package:five_level_one/backend/cont.dart';
import 'package:five_level_one/backend/model.dart';
import 'package:five_level_one/widgets/display/text.dart';
import 'package:five_level_one/widgets/layout/cards/ccard.dart';
import 'package:flutter/material.dart';

class AircraftPerMacCard extends StatefulWidget {
  final PerMac permac;
  AircraftPerMacCard(this.permac);
  @override
  _AircraftPerMacCardState createState() => _AircraftPerMacCardState();
}

class _AircraftPerMacCardState extends State<AircraftPerMacCard> {

  List<DataRow> getRows(){
    var ret = List<DataRow>();
    this.widget.permac.nwfss.forEach((nwfs){
      ret.add(
        DataRow(
          cells: <DataCell>[
            DataCell(Tex(nwfs.qty)),
            DataCell(Tex(nwfs.name)),
            DataCell(Tex(nwfs.weight)),
            DataCell(Tex(nwfs.fs)),
            DataCell(Tex(nwfs.getUnSimpMomAsStringFixed(0))),
            DataCell(Tex(nwfs.getMomAsStringFixes(2))),
          ]
        )
      );
    });

    //add padding to last row
    ret.add(
      DataRow(
        cells: [
          DataCell(Tex(' ')),
          DataCell(Tex(' ')),
          DataCell(Tex(' ')),
          DataCell(Tex(' ')),
          DataCell(Tex(' ')),
          DataCell(Tex(' ')),
        ]
      )
    );

    //add totals
    ret.add(
      DataRow(
        cells: [
          DataCell(Tex('1')),
          DataCell(Tex('Total (Aircraft + Fuel + Cargo)')),
          DataCell(Tex(this.widget.permac.totWeightAsSting)),
          DataCell(Tex('NA')),
          DataCell(Tex(this.widget.permac.totUnSimpMomAsString)),
          DataCell(Tex(this.widget.permac.totMomAsString)),
        ]
      )
    );
    return ret;
  }

  Widget getDataTable(){
    return DataTable(
      dividerThickness: Const.divThickness,
      columns: <DataColumn>[
        DataColumn(label: Tex('Qty')),
        DataColumn(label: Tex('Name')),
        DataColumn(label: Tex('Weight')),
        DataColumn(label: Tex('FS')),
        DataColumn(label: Tex('Mom (FS*Weight)')),
        DataColumn(label: Tex('Simp Mom')),
      ],
      rows: getRows(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CCards(
      'Aircraft, Fuel & Cargo',
      SingleChildScrollView(scrollDirection: Axis.horizontal, child: getDataTable()));
  }
}