import 'package:five_level_one/Backend/model.dart';
import 'package:flutter/cupertino.dart';

class Cargo extends StatefulWidget {
  var nwf;
  Cargo({@required simplemom}){this.nwf = NameWeightFS(simplemom: simplemom);}
  @override
  _CargoState createState() => _CargoState();
}

class _CargoState extends State<Cargo> {
  ///qty
  ///name
  ///weight
  ///fs
  ///remove
  ///
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}