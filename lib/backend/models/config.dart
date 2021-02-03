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
    return ret;

  }
}