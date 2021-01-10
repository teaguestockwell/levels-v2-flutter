import '../../backend/cont.dart';
import '../../backend/model.dart';
import '../../widgets/display/text.dart';
import '../../widgets/layout/cards/ccard.dart';
import 'package:flutter/material.dart';

class AircraftPerMacCard extends StatefulWidget {
  final PerMac permac;
  AircraftPerMacCard(this.permac);
  @override
  _AircraftPerMacCardState createState() => _AircraftPerMacCardState();
}

class _AircraftPerMacCardState extends State<AircraftPerMacCard> {

  List<DataRow> getRows(){
    List<DataRow> ret = [];
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
            DataCell(Tex(nwfs.getTotWeightFixed(2))),
            DataCell(Tex(nwfs.getTotUnSimpMomAsStringFixed(0))),
            DataCell(Tex(nwfs.getTotMomAsStringFixes(2))),
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
          DataCell(Tex(this.widget.permac.grandTotQty)),
          DataCell(Tex('Grand Total')),
          DataCell(Tex('NA')),
          DataCell(Tex('NA')),
          DataCell(Tex('NA')),
          DataCell(Tex('NA')),
          DataCell(Tex(this.widget.permac.totWeightAsSting)),
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
        DataColumn(label: Tex('Weight EA')),
        DataColumn(label: Tex('FS')),
        DataColumn(label: Tex('Mom EA (FS*Weight)')),
        DataColumn(label: Tex('Simp Mom EA')),

        DataColumn(label: Tex('Weight Total')),
        DataColumn(label: Tex('Mom Total')),
        DataColumn(label: Tex('Simp Mom Total')),
      ],
      rows: getRows(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CCards(
      'Aircraft, Fuel & Cargo',
      getDataTable());
  }
}