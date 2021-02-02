import '../utils.dart';
import 'cargo.dart';

class Config {
  final int aircraftid;
  final int configid;
  final String name;
  final List<Cargo> nwfList = [];

  Config.fromJson(Map<String,dynamic> json):
    aircraftid = json['aircraftid'],
    configid = json['configid'],
    name = json['name']{
      List<dynamic> configcargos = json['configcargos'];

      configcargos.forEach((x) => nwfList.add(Cargo.fromJsonConfigCargo(x)));
    }

  Map<String,dynamic> get json{
    Map<String,dynamic> ret = {};
    ret['aircraftid'] = aircraftid;
    ret['configid'] = configid;
    ret['name'] = name;
    
    List<dynamic> cc = [];
    nwfList.forEach((x) => cc.add(x.json));
    ret['configcargos'] = cc;

  }



  // List<Cargo> nwfList = [];
  // String name, simplemom;
  // Config(String csv, this.simplemom) {
  //   var nameWeightMomentQtyList = csv.split(';');
  //   this.name = nameWeightMomentQtyList[0];

  //   for (int i = 1; i < nameWeightMomentQtyList.length; i++) {
  //     String nwmqAtIndex = nameWeightMomentQtyList[i];
  //     var nwmqAtIndexList = nwmqAtIndex.split(',');

  //     this.nwfList.add(Cargo(
  //         name: nwmqAtIndexList[0].trim(),
  //         weight:
  //             (Util.parsenum(nwmqAtIndexList[1].trim()) / Util.parsenum(nwmqAtIndexList[3].trim()))
  //                 .toString(), // weight = totweight / qty
  //         mom: (Util.parsenum(nwmqAtIndexList[2].trim()) / Util.parsenum(nwmqAtIndexList[3].trim()))
  //             .toString(), // mom = totmom / qty
  //         simplemom: this.simplemom,
  //         qty: nwmqAtIndexList[3].trim() // qty = qty
  //         ));
  //   }
  // }


  
}