import '../../util.dart';
import 'cargo.dart';
class Tank{
  final String name;
  final int aircraftid;
  final int tankid;
  final num mommultiplier;

  final List<Cargo> nwfss = [];

  //csv
  final String weights;
  final String simplemoms;

  //list
  List<String> weightList;
  List<String> simplemomsList;

  Tank.fromJson(Map<String,dynamic> json, this.mommultiplier):
    name = json['name'],
    aircraftid = json['aircraftid'],
    tankid = json['tankid'],

    weights = json['weights'],
    simplemoms = json['simplemoms']{

    weightList = weights.split(',');
    simplemomsList =simplemoms.split(',');

    assert(weightList.length == simplemomsList.length);

    for(int i=0; i<weightList.length; i++){

      nwfss.add(
        Cargo.fromTank(
          name: name, 
          weight: parsedouble(weightList[i]),
          simplemom: parsedouble(simplemomsList[i]),
          mommultiplier: mommultiplier
        )
      );
    }
  }

  Map<String, dynamic> get json {
    Map<String, dynamic> ret = {};
    ret['name'] = name;
    ret['aircraftid'] = aircraftid;
    ret['tankid'] = tankid;
    ret['weights'] = weights;
    ret['simplemoms'] = simplemoms;
    return ret;
  }
}