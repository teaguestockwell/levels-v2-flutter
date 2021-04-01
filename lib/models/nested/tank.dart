import '../../util.dart';
import 'cargo.dart';
class Tank{
  final String name;
  final int aircraftId;
  final int tankId;
  final num momMultiplier;

  final List<Cargo> nwfss = [];

  //csv
  final String weightsCSV;
  final String simpleMomsCSV;

  //list
  List<String> weightList;
  List<String> simpleMomsCSVList;

  Tank.fromJson(Map<String,dynamic> json, this.momMultiplier):
    name = json['name'],
    aircraftId = json['aircraftId'],
    tankId = json['tankId'],

    weightsCSV = json['weightsCSV'],
    simpleMomsCSV = json['simpleMomsCSV']{

    weightList = weightsCSV.split(',');
    simpleMomsCSVList =simpleMomsCSV.split(',');

    assert(weightList.length == simpleMomsCSVList.length);

    for(int i=0; i<weightList.length; i++){

      nwfss.add(
        Cargo.fromTank(
          name: name, 
          weight: parsedouble(weightList[i]),
          simplemom: parsedouble(simpleMomsCSVList[i]),
          momMultiplier: momMultiplier
        )
      );
    }
  }
}