import 'cargo.dart';

class Config {
  final int aircraftId;
  final int configId;
  final String name;
  final List<Cargo> nwfList = [];

  Config.fromJson(Map<String,dynamic> json):
    aircraftId = json['aircraftId'],
    configId = json['configId'],
    name = json['name']{
      List<dynamic> configCargos = json['configCargos'];

      configCargos.forEach((x) => nwfList.add(Cargo.fromJsonConfigCargo(x)));
    }
  
  Config.empty():
  aircraftId = -1,
  configId = -1,
  name = 'No Config';
}