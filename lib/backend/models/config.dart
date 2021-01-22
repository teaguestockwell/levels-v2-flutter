import '../utils.dart';
import 'nameWeightFS.dart';

class Config {
  List<NameWeightFS> nwfList = [];
  String name, simplemom;
  Config(String csv, this.simplemom) {
    var nameWeightMomentQtyList = csv.split(';');
    this.name = nameWeightMomentQtyList[0];

    for (int i = 1; i < nameWeightMomentQtyList.length; i++) {
      String nwmqAtIndex = nameWeightMomentQtyList[i];
      var nwmqAtIndexList = nwmqAtIndex.split(',');

      this.nwfList.add(NameWeightFS(
          name: nwmqAtIndexList[0].trim(),
          weight:
              (Util.parsedouble(nwmqAtIndexList[1].trim()) / Util.parsedouble(nwmqAtIndexList[3].trim()))
                  .toString(), // weight = totweight / qty
          mom: (Util.parsedouble(nwmqAtIndexList[2].trim()) / Util.parsedouble(nwmqAtIndexList[3].trim()))
              .toString(), // mom = totmom / qty
          simplemom: this.simplemom,
          qty: nwmqAtIndexList[3].trim() // qty = qty
          ));
    }
  }
}