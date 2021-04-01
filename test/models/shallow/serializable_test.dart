import 'package:five_level_one/constant.dart';
import 'package:five_level_one/models/shallow/serializable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const mockShallows = <String, Map<String,dynamic>>{
  aircraftS: {
    "id": 1,
    "name": "C-17A-ER",
    "fs0": 80.5,
    "fs1": 2168,
    "mom0": 9999,
    "mom1": 50000,
    "weight0": 260000,
    "weight1": 300000,
    "cargoWeight1": 300000,
    "lemac": 793.6,
    "mac": 309.5,
    "mommultiplyer": 10000
  },
  cargoS: {
    "aircraftId": 1,
    "cargoId": 2,
    "name": "Std 2 gal liquid container",
    "weight": 25,
    "fs": 260,
    "category": "Steward"
  },
  configS: {
    "aircraftId": 2,
    "configId": 20,
    "name": "AE-1"
  },
  configCargosS: {
    "configId": 1,
    "aircraftId": 1,
    "cargoId": 28,
    "configCargoId": 1,
    "fs": 400,
    "qty": 4,
    "name": "Flare Hazard Placards (Note 1)"
  },
  glossaryS :   {
    "aircraftId": 2,
    "glossaryId": 11,
    "name": "Chart C",
    "body": "The Chart C is a record of the aircraft weight and balance that is continuously updated by a qualified weight and balance technician. Some equipment is provided by the manufacturer during aircraft delivery to the Air Force and is included in the aircraft's basic weight. Further, To standardize equipment and its location, items listed in Addenda A Table 2.1 are included in the basic weight of the aircraft."
  },
  tankS: {
    "name": "Tank 2 ER",
    "aircraftId": 1,
    "tankId": 2,
    "weightsCSV": "250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500, 6750, 7000, 7250, 7500, 7750, 8000, 8250, 8500, 8750, 9000, 9250, 9500, 9750, 10000, 10250, 10500, 10750, 11000, 11250, 11500, 11750, 12000, 12250, 12500, 12750, 13000, 13250, 13500, 13750, 14000, 14250, 14500, 14750, 15000, 15250, 15500, 15750, 16000, 16250, 16500, 16750, 17000, 17250, 17500, 17750, 18000, 18250, 18500, 18750, 19000, 19250, 19500, 19750, 20000, 20250, 20500, 20750, 21000, 21250, 21500, 21750, 22000, 22250, 22500, 22750, 23000, 23250, 23500, 23750, 24000, 24250, 24500, 24750, 25000, 25250, 25500, 25750, 26000, 26250, 26500, 26750, 27000, 27250, 27500, 27750, 28000, 28250, 28500, 28750, 29000, 29250, 29500, 29750, 30000, 30250, 30500, 30750, 31000, 31250, 31500, 31750, 32000, 32250, 32500, 32750, 33000, 33250, 33500, 33750, 34000, 34250, 34500, 34750, 35000, 35250, 35500, 35750, 36000, 36250, 36500, 36750, 37000, 37250, 37500, 37750, 38240, 38740, 39240, 39740, 40240, 40740, 41240, 41740, 42240, 42740, 43240, 43740, 44240, 44740, 45240, 45740, 46240, 46740, 47240, 47740, 48240, 48740, 49240, 49740, 50240, 50740, 51240, 51740, 52240, 52740, 53240, 53740, 54240, 54740, 55240, 55740, 56240, 56740, 57240, 57740, 58240, 58740, 59240, 59740, 60240, 60740, 61240, 61740, 62240, 62740, 63240, 63640, 64240, 64740, 65240, 65740, 66240, 66740, 67240, 67740, 68240, 68740, 69240, 69740, 70240, 70740, 71240, 71740, 72240, 72740, 73240, 73740, 74240, 74640, 75240, 75740, 76240, 76740, 77240, 77740, 78240, 78740, 79240, 79740, 80240, 80740, 81240, 81740, 82240, 82740, 83240, 83740, 84240, 84540",
    "simpleMomsCSV": "21, 43, 64, 85, 107, 128, 149, 170, 191, 213, 234, 255, 276, 297, 318, 339, 359, 380, 401, 421, 441, 461, 481, 501, 521, 541, 561, 581, 600, 620, 640, 660, 679, 699, 719, 739, 758, 778, 797, 817, 837, 857, 876, 896, 916, 935, 955, 975, 994, 1014, 1033, 1053, 1073, 1093, 1112, 1132, 1152, 1171, 1191, 1210, 1230, 1250, 1270, 1289, 1309, 1329, 1348, 1368, 1387, 1407, 1427, 1446, 1466, 1486, 1506, 1525, 1545, 1564, 1584, 1604, 1623, 1643, 1663, 1682, 1702, 1721, 1741, 1760, 1780, 1799, 1819, 1839, 1858, 1878, 1897, 1917, 1936, 1956, 1976, 1995, 2014, 2034, 2053, 2072, 2091, 2111, 2130, 2149, 2168, 2187, 2206, 2225, 2244, 2262, 2285, 2308, 2330, 2353, 2376, 2399, 2422, 2444, 2466, 2489, 2511, 2534, 2557, 2579, 2602, 2625, 2647, 2669, 2692, 2714, 2736, 2758, 2781, 2803, 2826, 2848, 2870, 2893, 2915, 2937, 2959, 2982, 3004, 3026, 3049, 3071, 3094, 3137, 3182, 3227, 3271, 3316, 3361, 3405, 3450, 3494, 3539, 3583, 3628, 3672, 3717, 3761, 3805, 3850, 3894, 3939, 3983, 4027, 4072, 4116, 4159, 4203, 4246, 4289, 4332, 4375, 4419, 4462, 4505, 4548, 4589, 4631, 4672, 4713, 4755, 4796, 4837, 4879, 4920, 4961, 5003, 5044, 5085, 5127, 5168, 5209, 5250, 5290, 5330, 5370, 5411, 5451, 5491, 5531, 5571, 5611, 5648, 5684, 5720, 5756, 5792, 5828, 5864, 5900, 5935, 5971, 6007, 6043, 6079, 6115, 6151, 6187, 6222, 6258, 6294, 6329, 6365, 6401, 6437, 6473, 6509, 6545, 6581, 6616, 6652, 6687, 6723, 6758, 6794, 6829, 6850"
  },
  userS: {
    "aircraftId": 1,
    "userId": 1,
    "name": "role0@test.com",
    "role": 0
  },
};

Widget wrap(Widget t) => MaterialApp(home: Scaffold(body: t));
void put(Map<String,dynamic>_){}

main(){
   test(
     'given all shallow models, when are constructed, then they will return the same json',
      (){
        for(final entry in mockShallows.entries){
          final expected = entry.value;
          final actual = getAPISerializableOfEP(
            ep: entry.key,
            obj: entry.value,
            put: put
          ).toJson();

          expect(actual,expected);
        
        }
      });
    testWidgets(
      'given all shallow models, when their getform is called, they will draw',
      (WidgetTester wt) async {

        // given
        for(final entry in mockShallows.entries){

          final fourm = getAPISerializableOfEP(
            ep: entry.key,
            obj: entry.value,
            put: put
          ).getForm();

          // when
          await wt.pumpWidget(wrap(fourm));
  
          // then
          expect(find.byType(Form), findsOneWidget);
        }
      });

      dynamic concat1(var v){
       switch (v.runtimeType) {
         case String: return '1';
         case int: return int.parse('1');
         case double: return double.parse('1');
         default: throw Exception('undefined runtime type: ' + v.runtimeType.toString());
       }
      }

      Map<String,dynamic> concateVals(Map<String,dynamic> map){
        return map..updateAll((_,v) => v = concat1(v));
      }
      bool filter(String x){
        if(
          x.contains('Id') || // id does not have ui to modify
          x.contains('category') // this is not an edit text, it is a drop down
        ){
          return true;
        }
        return false;
      }

      testWidgets(
      'given all shallow models, when their editext are modifed with + 1, then the to json will reflect that',
      (WidgetTester wt) async {

        // given
        for(final entry in mockShallows.entries){

          final serializable = getAPISerializableOfEP(
            ep: entry.key,
            obj: entry.value,
            put: put
          );
          final fourm = serializable.getForm();
          final expected = concateVals(serializable.toJson()..removeWhere((k,_) => filter(k)));

          // when
          await wt.pumpWidget(wrap(fourm));
          try{
            for(int i=0;i<20;i++){

              await wt.enterText(find.byType(TextFormField).at(i),'1');
              await wt.pumpAndSettle();
            }
          // ignore: avoid_catches_without_on_clauses
          } catch(_){print('^ not an error');}
        
          // then

          /// name is inhrited on config cargo and is not modifiable
          if(entry.key == configCargosS){
             expect(
               serializable.toJson()
               ..removeWhere((k,_) => filter(k))
               ..removeWhere((k,_) => k.contains('name')),
                expected..removeWhere((k,_) => k.contains('name'))
            );
          }else{
            expect(serializable.toJson()..removeWhere((k,_) => filter(k)), expected);
          }
        }
      });
}