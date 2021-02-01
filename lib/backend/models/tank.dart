import 'cargo.dart';

/// Tank builds a list of name weight fs from
///  weightcsv, momentcsv,  
///contained under a tank name
class Tank {
  final String name, _weightsCSV, _momCSV, simplemom;

  List<Cargo> nameWeightFSs = [];

  List<String> _weights = [], _moms = [];

  Tank(
    this.name,
    this._weightsCSV,
    this._momCSV,
    this.simplemom,
  ) {
    _weights = _weightsCSV.split(',');
    _moms = _momCSV.split(',');

    for (int i = 0; i < _weights.length; i++) {
      nameWeightFSs.add(Cargo(
          name: name,
          weight: _weights[i],
          mom: _moms[i],
          simplemom: simplemom));
    }
  }
}