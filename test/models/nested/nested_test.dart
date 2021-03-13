import 'package:five_level_one/models/nested/aircraft.dart';
import 'package:five_level_one/services/isolate.dart';
import 'package:flutter_test/flutter_test.dart';


main(){
  test(
  'given a mock res, when aircrafts are contructed, then ther will be 2',() async {
    // given
  ;
    final jsonMap = await decodeJsonIsolate<List<dynamic>>(body);

    // when
    final airs = jsonMap.map((air){
    try{
      return Aircraft.fromJson(air as Map<String,dynamic>);
    // ignore: avoid_catches_without_on_clauses
    }catch(e){}
  }).toList();

    // then
    expect(airs.length,2);
  });
}

const body = '''
  [
  {
    "id": 1,
    "name": "C-17A-ER",
    "fs0": 80.5,
    "fs1": 2168,
    "mom0": 9999,
    "mom1": 50000,
    "weight0": 260000,
    "weight1": 300000,
    "cargoweight1": 300000,
    "lemac": 793.6,
    "mac": 309.5,
    "mommultiplyer": 10000,
    "cargos": [
      {
        "aircraftid": 1,
        "cargoid": 1,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Water Container (5 Gallon)",
        "weight": 40,
        "fs": 358,
        "category": "Steward"
      },
      {
        "aircraftid": 1,
        "cargoid": 2,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Std 2 gal liquid container",
        "weight": 25,
        "fs": 260,
        "category": "Steward"
      },
      {
        "aircraftid": 1,
        "cargoid": 3,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Hot Cup",
        "weight": 3,
        "fs": 260,
        "category": "Steward"
      },
      {
        "aircraftid": 1,
        "cargoid": 4,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Human Waste Clean-up kit",
        "weight": 5,
        "fs": 280,
        "category": "Steward"
      },
      {
        "aircraftid": 1,
        "cargoid": 5,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Blanket Large",
        "weight": 3.5,
        "fs": 280,
        "category": "Steward"
      },
      {
        "aircraftid": 1,
        "cargoid": 6,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Pillow Large w/Case",
        "weight": 2,
        "fs": 280,
        "category": "Steward"
      },
      {
        "aircraftid": 1,
        "cargoid": 7,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Blanket Small",
        "weight": 1,
        "fs": -1,
        "category": "Steward"
      },
      {
        "aircraftid": 1,
        "cargoid": 8,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Pillow Small w/Case",
        "weight": 0.5,
        "fs": -1,
        "category": "Steward"
      },
      {
        "aircraftid": 1,
        "cargoid": 9,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Expendable Supplies",
        "weight": 10,
        "fs": 260,
        "category": "Steward"
      },
      {
        "aircraftid": 1,
        "cargoid": 10,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Passenger Demo Kit",
        "weight": 3,
        "fs": 380,
        "category": "Steward"
      },
      {
        "aircraftid": 1,
        "cargoid": 11,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Pax info card",
        "weight": 3,
        "fs": 280,
        "category": "Steward"
      },
      {
        "aircraftid": 1,
        "cargoid": 12,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "ATGL (Serviced)",
        "weight": 3620,
        "fs": 401,
        "category": "Steward"
      },
      {
        "aircraftid": 1,
        "cargoid": 13,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "LPU-6P Infant Cot",
        "weight": 4,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftid": 1,
        "cargoid": 14,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "A/C Life Preserver",
        "weight": 1.5,
        "fs": -1,
        "category": "Emergency"
      },
      {
        "aircraftid": 1,
        "cargoid": 15,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Protective clothing kit",
        "weight": 36,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftid": 1,
        "cargoid": 16,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "BA-22 Parachute",
        "weight": 28,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftid": 1,
        "cargoid": 17,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "LPU-10P",
        "weight": 4,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftid": 1,
        "cargoid": 18,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "EPOS",
        "weight": 2,
        "fs": -1,
        "category": "Emergency"
      },
      {
        "aircraftid": 1,
        "cargoid": 19,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "PBE",
        "weight": 5,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftid": 1,
        "cargoid": 20,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Survival Vest",
        "weight": 11.5,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftid": 1,
        "cargoid": 21,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Aircrew Body Armor (Level IIIA)",
        "weight": 8.5,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftid": 1,
        "cargoid": 22,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "60 Hz Backup Converter",
        "weight": 43,
        "fs": 252,
        "category": "Extra"
      },
      {
        "aircraftid": 1,
        "cargoid": 23,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Additional Aeromedical Stations",
        "weight": 66,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftid": 1,
        "cargoid": 24,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Seat Pallets DV (5 Seats/Pallet)",
        "weight": 591,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftid": 1,
        "cargoid": 25,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Seat Pallets DV (10 Seats/pallet)",
        "weight": 767,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftid": 1,
        "cargoid": 26,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Seat Pallets Mass (15 Seats/pallet)",
        "weight": 943,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftid": 1,
        "cargoid": 27,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Flares/Flare Cans (Note 1)",
        "weight": 255,
        "fs": 744,
        "category": "Extra"
      },
      {
        "aircraftid": 1,
        "cargoid": 28,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Flare Hazard Placards (Note 1)",
        "weight": 20,
        "fs": 400,
        "category": "Extra"
      },
      {
        "aircraftid": 1,
        "cargoid": 29,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Aircraft Armor (Note 1)",
        "weight": 1125,
        "fs": 217,
        "category": "Extra"
      },
      {
        "aircraftid": 1,
        "cargoid": 30,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "SLIP (unoccupied)",
        "weight": 1350,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftid": 1,
        "cargoid": 31,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "SLICC Berthing Capsule",
        "weight": 3790,
        "fs": 580,
        "category": "Extra"
      },
      {
        "aircraftid": 1,
        "cargoid": 32,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "SLICC Conference Capsule",
        "weight": 4660,
        "fs": 685,
        "category": "Extra"
      },
      {
        "aircraftid": 1,
        "cargoid": 33,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "MX TO File",
        "weight": 30,
        "fs": 305,
        "category": "Extra"
      },
      {
        "aircraftid": 1,
        "cargoid": 34,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Kit, Passenger service",
        "weight": 10,
        "fs": 280,
        "category": "Extra"
      }
    ],
    "tanks": [
      {
        "name": "Tank 1",
        "aircraftid": 1,
        "tankid": 1,
        "weights": "250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500, 6750, 7000, 7250, 7500, 7750, 8000, 8250, 8500, 8750, 9000, 9250, 9500, 9750, 10000, 10250, 10500, 10750, 11000, 11250, 11500, 11750, 12000, 12250, 12500, 12750, 13000, 13250, 13500, 13750, 14000, 14250, 14500, 14750, 15000, 15250, 15500, 15750, 16000, 16250, 16500, 16750, 17000, 17250, 17500, 17750, 18000, 18250, 18500, 18750, 19000, 19250, 19500, 19750, 20000, 20250, 20500, 20750, 21000, 21250, 21500, 21750, 22000, 22250, 22500, 22750, 23000, 23250, 23500, 23750, 24000, 24250, 24500, 24750, 25000, 25250, 25500, 25750, 26000, 26250, 26500, 26750, 27000, 27250, 27500, 27750, 28000, 28250, 28500, 28750, 29000, 29250, 29500, 29750, 30000, 30250, 30500, 30750, 31000, 31250, 31500, 31750, 32000, 32250, 32500, 32750, 33000, 33250, 33500, 33750, 34000, 34250, 34500, 34750, 35000, 35250, 35500, 35750, 36000, 36250, 36500, 36750, 37000, 37250, 37500, 37750, 37760",
        "simplemoms": "28, 56, 84, 112, 140, 168, 196, 222, 248, 274, 300, 326, 353, 379, 405, 430, 456, 482, 508, 534, 559, 585, 610, 636, 661, 687, 712, 738, 763, 789, 814, 839, 864, 889, 915, 940, 965, 990, 1016, 1041, 1066, 1091, 1116, 1141, 1166, 1190, 1215, 1240, 1265, 1290, 1315, 1340, 1365, 1390, 1414, 1439, 1464, 1489, 1514, 1538, 1563, 1588, 1612, 1637, 1662, 1686, 1711, 1736, 1760, 1785, 1810, 1834, 1859, 1883, 1908, 1932, 1957, 1982, 2006, 2031, 2055, 2080, 2104, 2129, 2153, 2178, 2202, 2227, 2251, 2276, 2300, 2325, 2349, 2373, 2398, 2422, 2447, 2471, 2495, 2520, 2544, 2569, 2593, 2617, 2641, 2665, 2689, 2713, 2737, 2761, 2785, 2809, 2833, 2857, 2881, 2905, 2929, 2953, 2977, 3001, 3024, 3048, 3072, 3096, 3119, 3143, 3167, 3191, 3214, 3238, 3262, 3285, 3309, 3332, 3356, 3379, 3403, 3427, 3450, 3474, 3497, 3520, 3543, 3566, 3590, 3613, 3636, 3659, 3682, 3705, 3729, 3730"
      },
      {
        "name": "Tank 2 ER",
        "aircraftid": 1,
        "tankid": 2,
        "weights": "250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500, 6750, 7000, 7250, 7500, 7750, 8000, 8250, 8500, 8750, 9000, 9250, 9500, 9750, 10000, 10250, 10500, 10750, 11000, 11250, 11500, 11750, 12000, 12250, 12500, 12750, 13000, 13250, 13500, 13750, 14000, 14250, 14500, 14750, 15000, 15250, 15500, 15750, 16000, 16250, 16500, 16750, 17000, 17250, 17500, 17750, 18000, 18250, 18500, 18750, 19000, 19250, 19500, 19750, 20000, 20250, 20500, 20750, 21000, 21250, 21500, 21750, 22000, 22250, 22500, 22750, 23000, 23250, 23500, 23750, 24000, 24250, 24500, 24750, 25000, 25250, 25500, 25750, 26000, 26250, 26500, 26750, 27000, 27250, 27500, 27750, 28000, 28250, 28500, 28750, 29000, 29250, 29500, 29750, 30000, 30250, 30500, 30750, 31000, 31250, 31500, 31750, 32000, 32250, 32500, 32750, 33000, 33250, 33500, 33750, 34000, 34250, 34500, 34750, 35000, 35250, 35500, 35750, 36000, 36250, 36500, 36750, 37000, 37250, 37500, 37750, 38240, 38740, 39240, 39740, 40240, 40740, 41240, 41740, 42240, 42740, 43240, 43740, 44240, 44740, 45240, 45740, 46240, 46740, 47240, 47740, 48240, 48740, 49240, 49740, 50240, 50740, 51240, 51740, 52240, 52740, 53240, 53740, 54240, 54740, 55240, 55740, 56240, 56740, 57240, 57740, 58240, 58740, 59240, 59740, 60240, 60740, 61240, 61740, 62240, 62740, 63240, 63640, 64240, 64740, 65240, 65740, 66240, 66740, 67240, 67740, 68240, 68740, 69240, 69740, 70240, 70740, 71240, 71740, 72240, 72740, 73240, 73740, 74240, 74640, 75240, 75740, 76240, 76740, 77240, 77740, 78240, 78740, 79240, 79740, 80240, 80740, 81240, 81740, 82240, 82740, 83240, 83740, 84240, 84540",
        "simplemoms": "21, 43, 64, 85, 107, 128, 149, 170, 191, 213, 234, 255, 276, 297, 318, 339, 359, 380, 401, 421, 441, 461, 481, 501, 521, 541, 561, 581, 600, 620, 640, 660, 679, 699, 719, 739, 758, 778, 797, 817, 837, 857, 876, 896, 916, 935, 955, 975, 994, 1014, 1033, 1053, 1073, 1093, 1112, 1132, 1152, 1171, 1191, 1210, 1230, 1250, 1270, 1289, 1309, 1329, 1348, 1368, 1387, 1407, 1427, 1446, 1466, 1486, 1506, 1525, 1545, 1564, 1584, 1604, 1623, 1643, 1663, 1682, 1702, 1721, 1741, 1760, 1780, 1799, 1819, 1839, 1858, 1878, 1897, 1917, 1936, 1956, 1976, 1995, 2014, 2034, 2053, 2072, 2091, 2111, 2130, 2149, 2168, 2187, 2206, 2225, 2244, 2262, 2285, 2308, 2330, 2353, 2376, 2399, 2422, 2444, 2466, 2489, 2511, 2534, 2557, 2579, 2602, 2625, 2647, 2669, 2692, 2714, 2736, 2758, 2781, 2803, 2826, 2848, 2870, 2893, 2915, 2937, 2959, 2982, 3004, 3026, 3049, 3071, 3094, 3137, 3182, 3227, 3271, 3316, 3361, 3405, 3450, 3494, 3539, 3583, 3628, 3672, 3717, 3761, 3805, 3850, 3894, 3939, 3983, 4027, 4072, 4116, 4159, 4203, 4246, 4289, 4332, 4375, 4419, 4462, 4505, 4548, 4589, 4631, 4672, 4713, 4755, 4796, 4837, 4879, 4920, 4961, 5003, 5044, 5085, 5127, 5168, 5209, 5250, 5290, 5330, 5370, 5411, 5451, 5491, 5531, 5571, 5611, 5648, 5684, 5720, 5756, 5792, 5828, 5864, 5900, 5935, 5971, 6007, 6043, 6079, 6115, 6151, 6187, 6222, 6258, 6294, 6329, 6365, 6401, 6437, 6473, 6509, 6545, 6581, 6616, 6652, 6687, 6723, 6758, 6794, 6829, 6850"
      },
      {
        "name": "Tank 3 ER",
        "aircraftid": 1,
        "tankid": 3,
        "weights": "250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500, 6750, 7000, 7250, 7500, 7750, 8000, 8250, 8500, 8750, 9000, 9250, 9500, 9750, 10000, 10250, 10500, 10750, 11000, 11250, 11500, 11750, 12000, 12250, 12500, 12750, 13000, 13250, 13500, 13750, 14000, 14250, 14500, 14750, 15000, 15250, 15500, 15750, 16000, 16250, 16500, 16750, 17000, 17250, 17500, 17750, 18000, 18250, 18500, 18750, 19000, 19250, 19500, 19750, 20000, 20250, 20500, 20750, 21000, 21250, 21500, 21750, 22000, 22250, 22500, 22750, 23000, 23250, 23500, 23750, 24000, 24250, 24500, 24750, 25000, 25250, 25500, 25750, 26000, 26250, 26500, 26750, 27000, 27250, 27500, 27750, 28000, 28250, 28500, 28750, 29000, 29250, 29500, 29750, 30000, 30250, 30500, 30750, 31000, 31250, 31500, 31750, 32000, 32250, 32500, 32750, 33000, 33250, 33500, 33750, 34000, 34250, 34500, 34750, 35000, 35250, 35500, 35750, 36000, 36250, 36500, 36750, 37000, 37250, 37500, 37750, 38240, 38740, 39240, 39740, 40240, 40740, 41240, 41740, 42240, 42740, 43240, 43740, 44240, 44740, 45240, 45740, 46240, 46740, 47240, 47740, 48240, 48740, 49240, 49740, 50240, 50740, 51240, 51740, 52240, 52740, 53240, 53740, 54240, 54740, 55240, 55740, 56240, 56740, 57240, 57740, 58240, 58740, 59240, 59740, 60240, 60740, 61240, 61740, 62240, 62740, 63240, 63640, 64240, 64740, 65240, 65740, 66240, 66740, 67240, 67740, 68240, 68740, 69240, 69740, 70240, 70740, 71240, 71740, 72240, 72740, 73240, 73740, 74240, 74640, 75240, 75740, 76240, 76740, 77240, 77740, 78240, 78740, 79240, 79740, 80240, 80740, 81240, 81740, 82240, 82740, 83240, 83740, 84240, 84540",
        "simplemoms": "21, 43, 64, 85, 107, 128, 149, 170, 191, 213, 234, 255, 276, 297, 318, 339, 359, 380, 401, 421, 441, 461, 481, 501, 521, 541, 561, 581, 600, 620, 640, 660, 679, 699, 719, 739, 758, 778, 797, 817, 837, 857, 876, 896, 916, 935, 955, 975, 994, 1014, 1033, 1053, 1073, 1093, 1112, 1132, 1152, 1171, 1191, 1210, 1230, 1250, 1270, 1289, 1309, 1329, 1348, 1368, 1387, 1407, 1427, 1446, 1466, 1486, 1506, 1525, 1545, 1564, 1584, 1604, 1623, 1643, 1663, 1682, 1702, 1721, 1741, 1760, 1780, 1799, 1819, 1839, 1858, 1878, 1897, 1917, 1936, 1956, 1976, 1995, 2014, 2034, 2053, 2072, 2091, 2111, 2130, 2149, 2168, 2187, 2206, 2225, 2244, 2262, 2285, 2308, 2330, 2353, 2376, 2399, 2422, 2444, 2466, 2489, 2511, 2534, 2557, 2579, 2602, 2625, 2647, 2669, 2692, 2714, 2736, 2758, 2781, 2803, 2826, 2848, 2870, 2893, 2915, 2937, 2959, 2982, 3004, 3026, 3049, 3071, 3094, 3137, 3182, 3227, 3271, 3316, 3361, 3405, 3450, 3494, 3539, 3583, 3628, 3672, 3717, 3761, 3805, 3850, 3894, 3939, 3983, 4027, 4072, 4116, 4159, 4203, 4246, 4289, 4332, 4375, 4419, 4462, 4505, 4548, 4589, 4631, 4672, 4713, 4755, 4796, 4837, 4879, 4920, 4961, 5003, 5044, 5085, 5127, 5168, 5209, 5250, 5290, 5330, 5370, 5411, 5451, 5491, 5531, 5571, 5611, 5648, 5684, 5720, 5756, 5792, 5828, 5864, 5900, 5935, 5971, 6007, 6043, 6079, 6115, 6151, 6187, 6222, 6258, 6294, 6329, 6365, 6401, 6437, 6473, 6509, 6545, 6581, 6616, 6652, 6687, 6723, 6758, 6794, 6829, 6850"
      },
      {
        "name": "Tank 4",
        "aircraftid": 1,
        "tankid": 4,
        "weights": "250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500, 6750, 7000, 7250, 7500, 7750, 8000, 8250, 8500, 8750, 9000, 9250, 9500, 9750, 10000, 10250, 10500, 10750, 11000, 11250, 11500, 11750, 12000, 12250, 12500, 12750, 13000, 13250, 13500, 13750, 14000, 14250, 14500, 14750, 15000, 15250, 15500, 15750, 16000, 16250, 16500, 16750, 17000, 17250, 17500, 17750, 18000, 18250, 18500, 18750, 19000, 19250, 19500, 19750, 20000, 20250, 20500, 20750, 21000, 21250, 21500, 21750, 22000, 22250, 22500, 22750, 23000, 23250, 23500, 23750, 24000, 24250, 24500, 24750, 25000, 25250, 25500, 25750, 26000, 26250, 26500, 26750, 27000, 27250, 27500, 27750, 28000, 28250, 28500, 28750, 29000, 29250, 29500, 29750, 30000, 30250, 30500, 30750, 31000, 31250, 31500, 31750, 32000, 32250, 32500, 32750, 33000, 33250, 33500, 33750, 34000, 34250, 34500, 34750, 35000, 35250, 35500, 35750, 36000, 36250, 36500, 36750, 37000, 37250, 37500, 37750, 37760",
        "simplemoms": "28, 56, 84, 112, 140, 168, 196, 222, 248, 274, 300, 326, 353, 379, 405, 430, 456, 482, 508, 534, 559, 585, 610, 636, 661, 687, 712, 738, 763, 789, 814, 839, 864, 889, 915, 940, 965, 990, 1016, 1041, 1066, 1091, 1116, 1141, 1166, 1190, 1215, 1240, 1265, 1290, 1315, 1340, 1365, 1390, 1414, 1439, 1464, 1489, 1514, 1538, 1563, 1588, 1612, 1637, 1662, 1686, 1711, 1736, 1760, 1785, 1810, 1834, 1859, 1883, 1908, 1932, 1957, 1982, 2006, 2031, 2055, 2080, 2104, 2129, 2153, 2178, 2202, 2227, 2251, 2276, 2300, 2325, 2349, 2373, 2398, 2422, 2447, 2471, 2495, 2520, 2544, 2569, 2593, 2617, 2641, 2665, 2689, 2713, 2737, 2761, 2785, 2809, 2833, 2857, 2881, 2905, 2929, 2953, 2977, 3001, 3024, 3048, 3072, 3096, 3119, 3143, 3167, 3191, 3214, 3238, 3262, 3285, 3309, 3332, 3356, 3379, 3403, 3427, 3450, 3474, 3497, 3520, 3543, 3566, 3590, 3613, 3636, 3659, 3682, 3705, 3729, 3730"
      }
    ],
    "glossarys": [
      {
        "aircraftid": 1,
        "glossaryid": 1,
        "name": "MAC",
        "body": "The distance between the leading and trailing edge of the wing is known as the chord. If the leading edge and trailing edge are parallel, the chord of the wing is constant along the wing’s length. However, because the wings on the C17 are both tapered and swept, the chord changes along the span of the wing. The average length of the chord is known as the mean aerodynamic chord (MAC). The MAC of the C17 is 309.5in 1C-17A-5-2(2-28)"
      },
      {
        "aircraftid": 1,
        "glossaryid": 2,
        "name": "Chart C",
        "body": "The Chart C is a record of the aircraft weight and balance that is continuously updated by a qualified weight and balance technician. Some equipment is provided by the manufacturer during aircraft delivery to the Air Force and is included in the aircraft's basic weight. Further, To standardize equipment and its location, items listed in Addenda A Table 2.1 are included in the basic weight of the aircraft."
      },
      {
        "aircraftid": 1,
        "glossaryid": 3,
        "name": "%MAC",
        "body": "The Percent Mean Aerodynamic Chord identifies where the center or gravity is along the chord of the wing. 0% MAC is located at the LEMAC, and 100% MAC is at the TEMAC(Trailing Edge Mean Aerodynamic Chord). The formula for calculating %MAC is (Balance Arm - LEMAC) / MAC) X 100 1C-17A-5-2(2-28)."
      },
      {
        "aircraftid": 1,
        "glossaryid": 4,
        "name": "Reference Datum",
        "body": "The reference datum is a point located 80.5in forward of the nose of the C17. 1C-17A-5-2(2-28)"
      },
      {
        "aircraftid": 1,
        "glossaryid": 5,
        "name": "Fuselage Station (FS)",
        "body": "An imaginary plane, that runs along the length of the aircraft. It is identified by its distance from the reference datum in inches. FS 0 starts at the reference datum. 1C-17A-5-2(2-28)"
      },
      {
        "aircraftid": 1,
        "glossaryid": 6,
        "name": "Balance Arm",
        "body": "The balance arm is the horizontal distance between the reference datum and the center or gravity. Balance arm = total simplified moment X 10,000 / total weight lb."
      },
      {
        "aircraftid": 1,
        "glossaryid": 7,
        "name": "Addenda A",
        "body": "Configurations with common items, such as sidewall seat life vests, are listed in the Addenda A chapter 3. The weight and moment of these common configurations or their items can be added as cargo into the calculator. For the most accurate calculation, if the item is not accounted for in the Chart C, not listed in Addenda A table 2.1 as equipment that is included in the aircraft basic weight, add its weight and FS into the calculator. https://static.e-publishing.af.mil/production/1/af_a3/publication/afman11-2c-17v3add-a/afman11-2c-17v3add-a.pdf"
      },
      {
        "aircraftid": 1,
        "glossaryid": 8,
        "name": "Moment",
        "body": "The moment of an item is weight in lb multiplied by its arm(distance from the reference datum). Moment is measured in inch-pounds. Moment = Weight in lb x arm. Simplified moment = moment/10000. The moment of fuel is measured in simplified moment and can be found in tables 2-5 or 2-9 for ER jets. The weight and moment of items can be found in AFI 11-2C17V3ADD-A and 1C-17A-5-2"
      },
      {
        "aircraftid": 1,
        "glossaryid": 9,
        "name": "Lemac",
        "body": "The Leading Edge of the Mean Aerodynamic Chord or LEMAC is a measurement of how far the leading edge of the wing is from the reference datum. For swept-wing aircraft, the LEMAC is an average of the distance the leading edge of the wing is from the reference datum. The LEMAC of the C17 is located 793.6in from the reference datum. 1C-17A-5-2(2-28)"
      }
    ],
    "configs": [
      {
        "aircraftid": 1,
        "configid": 1,
        "name": "AE-1",
        "configcargos": [
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 1,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 2,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 3,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 4,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 5,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 6,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 7,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 8,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 9,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 10,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 11,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 12,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 13,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 14,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 15,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 16,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 17,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 18,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 19,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 20,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 21,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 22,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 1,
        "configid": 2,
        "name": "AE-2",
        "configcargos": [
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 23,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 24,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 25,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 26,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 27,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 28,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 29,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 30,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 31,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 32,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 33,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 34,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 35,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 12,
            "configcargoid": 36,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 12,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 37,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 38,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 39,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 40,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 41,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 42,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 43,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 44,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 2,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 45,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 1,
        "configid": 3,
        "name": "AE-3",
        "configcargos": [
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 46,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 47,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 48,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 49,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 50,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 51,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 52,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 53,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 54,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 55,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 56,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 57,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 58,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 59,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 60,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 61,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 62,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 63,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 34,
            "configcargoid": 64,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 34,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Kit, Passenger service",
              "weight": 10,
              "fs": 280,
              "category": "Extra"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 65,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 66,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 3,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 67,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 1,
        "configid": 4,
        "name": "AEC-1",
        "configcargos": [
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 68,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 69,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 70,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 71,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 72,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 73,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 74,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 75,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 76,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 77,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 78,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 79,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 80,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 12,
            "configcargoid": 81,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 12,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 82,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 83,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 84,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 85,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 86,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 87,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 88,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 89,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 4,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 90,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 1,
        "configid": 5,
        "name": "C-1",
        "configcargos": [
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 91,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 92,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 93,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 94,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 95,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 96,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 97,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 98,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 99,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 100,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 101,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 102,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 103,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 104,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 105,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 106,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 107,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 108,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 109,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 110,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 111,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 5,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 112,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 1,
        "configid": 6,
        "name": "C-2",
        "configcargos": [
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 113,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 114,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 115,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 116,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 117,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 118,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 119,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 120,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 121,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 122,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 123,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 124,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 125,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 126,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 127,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 128,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 129,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 130,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 131,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 132,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 133,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 6,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 134,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 1,
        "configid": 7,
        "name": "C-3",
        "configcargos": [
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 135,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 136,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 137,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 138,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 139,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 140,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 141,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 142,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 143,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 144,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 145,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 146,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 147,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 148,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 149,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 150,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 151,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 152,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 153,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 154,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 155,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 7,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 156,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 1,
        "configid": 8,
        "name": "P-1",
        "configcargos": [
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 157,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 158,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 159,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 160,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 161,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 162,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 163,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 164,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 165,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 166,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 167,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 168,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 169,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 12,
            "configcargoid": 170,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 12,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 171,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 172,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 173,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 174,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 175,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 176,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 177,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 178,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 8,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 179,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 1,
        "configid": 9,
        "name": "SP-X",
        "configcargos": [
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 180,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 181,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 182,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 183,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 184,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 185,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 186,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 187,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 188,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 189,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 190,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 191,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 192,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 193,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 194,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 195,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 196,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 197,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 198,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 199,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 200,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 9,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 201,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 1,
        "configid": 10,
        "name": "CP-X",
        "configcargos": [
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 202,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 203,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 204,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 205,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 206,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 207,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 208,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 209,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 210,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 211,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 212,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 213,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 214,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 215,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 216,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 217,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 218,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 219,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 220,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 221,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 222,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 10,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 223,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 1,
        "configid": 11,
        "name": "ADP-1",
        "configcargos": [
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 224,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 225,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 226,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 227,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 228,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 229,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 230,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 231,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 232,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 233,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 234,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 235,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 236,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 237,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 238,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 239,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 240,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 241,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 242,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 243,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 244,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 11,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 245,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 1,
        "configid": 12,
        "name": "ADP-2",
        "configcargos": [
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 246,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 247,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 248,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 249,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 250,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 251,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 252,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 253,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 254,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 255,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 256,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 257,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 258,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 259,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 260,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 261,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 262,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 263,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 264,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 265,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 266,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 12,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 267,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 1,
        "configid": 13,
        "name": "ADP-3",
        "configcargos": [
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 268,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 269,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 270,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 271,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 272,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 273,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 274,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 275,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 276,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 277,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 278,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 279,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 280,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 12,
            "configcargoid": 281,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 12,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 282,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 283,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 284,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 285,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 286,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 287,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 288,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 289,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 13,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 290,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 1,
        "configid": 14,
        "name": "ADC-1",
        "configcargos": [
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 291,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 292,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 293,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 294,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 295,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 296,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 297,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 298,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 299,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 300,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 301,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 302,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 303,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 304,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 305,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 306,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 307,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 308,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 309,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 310,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 311,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 14,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 312,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 1,
        "configid": 15,
        "name": "ADC-2",
        "configcargos": [
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 313,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 314,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 315,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 316,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 317,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 318,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 319,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 320,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 321,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 322,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 323,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 324,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 325,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 326,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 327,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 328,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 329,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 330,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 331,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 332,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 333,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 15,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 334,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 1,
        "configid": 16,
        "name": "CDS-1",
        "configcargos": [
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 335,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 336,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 337,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 338,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 339,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 340,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 341,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 342,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 343,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 344,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 345,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 346,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 347,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 348,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 349,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 350,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 351,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 352,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 353,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 354,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 355,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 16,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 356,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 1,
        "configid": 17,
        "name": "DV-1",
        "configcargos": [
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 357,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 358,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 359,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 360,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 361,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 362,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 363,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 364,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 365,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 366,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 367,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 368,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 369,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 12,
            "configcargoid": 370,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 12,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 371,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 372,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 373,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 374,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 375,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 376,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 377,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 378,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 17,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 379,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 1,
        "configid": 18,
        "name": "SD-1",
        "configcargos": [
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 380,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 381,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 382,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 383,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 384,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 385,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 386,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 387,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 388,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 389,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 390,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 391,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 392,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 12,
            "configcargoid": 393,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 12,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 394,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 395,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 396,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 397,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 398,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 399,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 400,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 401,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 18,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 402,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 1,
        "configid": 19,
        "name": "SLC-1",
        "configcargos": [
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 403,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 404,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 405,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 406,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 407,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 408,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 409,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 410,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 411,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 412,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 413,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 414,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 415,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 30,
            "configcargoid": 416,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 30,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "SLIP (unoccupied)",
              "weight": 1350,
              "fs": -1,
              "category": "Extra"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 32,
            "configcargoid": 417,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 32,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "SLICC Conference Capsule",
              "weight": 4660,
              "fs": 685,
              "category": "Extra"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 31,
            "configcargoid": 418,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 31,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "SLICC Berthing Capsule",
              "weight": 3790,
              "fs": 580,
              "category": "Extra"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 12,
            "configcargoid": 419,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 12,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 420,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 421,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 422,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 423,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 424,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 425,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 426,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 427,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 19,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 428,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      }
    ]
  },
  {
    "id": 2,
    "name": "C-17A",
    "fs0": 80.5,
    "fs1": 2168,
    "mom0": 9999,
    "mom1": 50000,
    "weight0": 260000,
    "weight1": 300000,
    "cargoweight1": 300000,
    "lemac": 793.6,
    "mac": 309.5,
    "mommultiplyer": 10000,
    "cargos": [
      {
        "aircraftid": 2,
        "cargoid": 35,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Water Container (5 Gallon)",
        "weight": 40,
        "fs": 358,
        "category": "Steward"
      },
      {
        "aircraftid": 2,
        "cargoid": 36,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Std 2 gal liquid container",
        "weight": 25,
        "fs": 260,
        "category": "Steward"
      },
      {
        "aircraftid": 2,
        "cargoid": 37,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Hot Cup",
        "weight": 3,
        "fs": 260,
        "category": "Steward"
      },
      {
        "aircraftid": 2,
        "cargoid": 38,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Human Waste Clean-up kit",
        "weight": 5,
        "fs": 280,
        "category": "Steward"
      },
      {
        "aircraftid": 2,
        "cargoid": 39,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Blanket Large",
        "weight": 3.5,
        "fs": 280,
        "category": "Steward"
      },
      {
        "aircraftid": 2,
        "cargoid": 40,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Pillow Large w/Case",
        "weight": 2,
        "fs": 280,
        "category": "Steward"
      },
      {
        "aircraftid": 2,
        "cargoid": 41,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Blanket Small",
        "weight": 1,
        "fs": -1,
        "category": "Steward"
      },
      {
        "aircraftid": 2,
        "cargoid": 42,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Pillow Small w/Case",
        "weight": 0.5,
        "fs": -1,
        "category": "Steward"
      },
      {
        "aircraftid": 2,
        "cargoid": 43,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Expendable Supplies",
        "weight": 10,
        "fs": 260,
        "category": "Steward"
      },
      {
        "aircraftid": 2,
        "cargoid": 44,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Passenger Demo Kit",
        "weight": 3,
        "fs": 380,
        "category": "Steward"
      },
      {
        "aircraftid": 2,
        "cargoid": 45,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Pax info card",
        "weight": 3,
        "fs": 280,
        "category": "Steward"
      },
      {
        "aircraftid": 2,
        "cargoid": 46,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "ATGL (Serviced)",
        "weight": 3620,
        "fs": 401,
        "category": "Steward"
      },
      {
        "aircraftid": 2,
        "cargoid": 47,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "LPU-6P Infant Cot",
        "weight": 4,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftid": 2,
        "cargoid": 48,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "A/C Life Preserver",
        "weight": 1.5,
        "fs": -1,
        "category": "Emergency"
      },
      {
        "aircraftid": 2,
        "cargoid": 49,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Protective clothing kit",
        "weight": 36,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftid": 2,
        "cargoid": 50,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "BA-22 Parachute",
        "weight": 28,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftid": 2,
        "cargoid": 51,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "LPU-10P",
        "weight": 4,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftid": 2,
        "cargoid": 52,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "EPOS",
        "weight": 2,
        "fs": -1,
        "category": "Emergency"
      },
      {
        "aircraftid": 2,
        "cargoid": 53,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "PBE",
        "weight": 5,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftid": 2,
        "cargoid": 54,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Survival Vest",
        "weight": 11.5,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftid": 2,
        "cargoid": 55,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Aircrew Body Armor (Level IIIA)",
        "weight": 8.5,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftid": 2,
        "cargoid": 56,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "60 Hz Backup Converter",
        "weight": 43,
        "fs": 252,
        "category": "Extra"
      },
      {
        "aircraftid": 2,
        "cargoid": 57,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Additional Aeromedical Stations",
        "weight": 66,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftid": 2,
        "cargoid": 58,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Seat Pallets DV (5 Seats/Pallet)",
        "weight": 591,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftid": 2,
        "cargoid": 59,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Seat Pallets DV (10 Seats/pallet)",
        "weight": 767,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftid": 2,
        "cargoid": 60,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Seat Pallets Mass (15 Seats/pallet)",
        "weight": 943,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftid": 2,
        "cargoid": 61,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Flares/Flare Cans (Note 1)",
        "weight": 255,
        "fs": 744,
        "category": "Extra"
      },
      {
        "aircraftid": 2,
        "cargoid": 62,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Flare Hazard Placards (Note 1)",
        "weight": 20,
        "fs": 400,
        "category": "Extra"
      },
      {
        "aircraftid": 2,
        "cargoid": 63,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Aircraft Armor (Note 1)",
        "weight": 1125,
        "fs": 217,
        "category": "Extra"
      },
      {
        "aircraftid": 2,
        "cargoid": 64,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "SLIP (unoccupied)",
        "weight": 1350,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftid": 2,
        "cargoid": 65,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "SLICC Berthing Capsule",
        "weight": 3790,
        "fs": 580,
        "category": "Extra"
      },
      {
        "aircraftid": 2,
        "cargoid": 66,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "SLICC Conference Capsule",
        "weight": 4660,
        "fs": 685,
        "category": "Extra"
      },
      {
        "aircraftid": 2,
        "cargoid": 67,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "MX TO File",
        "weight": 30,
        "fs": 305,
        "category": "Extra"
      },
      {
        "aircraftid": 2,
        "cargoid": 68,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Kit, Passenger service",
        "weight": 10,
        "fs": 280,
        "category": "Extra"
      }
    ],
    "tanks": [
      {
        "name": "Tank 1",
        "aircraftid": 2,
        "tankid": 5,
        "weights": "250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500, 6750, 7000, 7250, 7500, 7750, 8000, 8250, 8500, 8750, 9000, 9250, 9500, 9750, 10000, 10250, 10500, 10750, 11000, 11250, 11500, 11750, 12000, 12250, 12500, 12750, 13000, 13250, 13500, 13750, 14000, 14250, 14500, 14750, 15000, 15250, 15500, 15750, 16000, 16250, 16500, 16750, 17000, 17250, 17500, 17750, 18000, 18250, 18500, 18750, 19000, 19250, 19500, 19750, 20000, 20250, 20500, 20750, 21000, 21250, 21500, 21750, 22000, 22250, 22500, 22750, 23000, 23250, 23500, 23750, 24000, 24250, 24500, 24750, 25000, 25250, 25500, 25750, 26000, 26250, 26500, 26750, 27000, 27250, 27500, 27750, 28000, 28250, 28500, 28750, 29000, 29250, 29500, 29750, 30000, 30250, 30500, 30750, 31000, 31250, 31500, 31750, 32000, 32250, 32500, 32750, 33000, 33250, 33500, 33750, 34000, 34250, 34500, 34750, 35000, 35250, 35500, 35750, 36000, 36250, 36500, 36750, 37000, 37250, 37500, 37750, 37760",
        "simplemoms": "28, 56, 84, 112, 140, 168, 196, 222, 248, 274, 300, 326, 353, 379, 405, 430, 456, 482, 508, 534, 559, 585, 610, 636, 661, 687, 712, 738, 763, 789, 814, 839, 864, 889, 915, 940, 965, 990, 1016, 1041, 1066, 1091, 1116, 1141, 1166, 1190, 1215, 1240, 1265, 1290, 1315, 1340, 1365, 1390, 1414, 1439, 1464, 1489, 1514, 1538, 1563, 1588, 1612, 1637, 1662, 1686, 1711, 1736, 1760, 1785, 1810, 1834, 1859, 1883, 1908, 1932, 1957, 1982, 2006, 2031, 2055, 2080, 2104, 2129, 2153, 2178, 2202, 2227, 2251, 2276, 2300, 2325, 2349, 2373, 2398, 2422, 2447, 2471, 2495, 2520, 2544, 2569, 2593, 2617, 2641, 2665, 2689, 2713, 2737, 2761, 2785, 2809, 2833, 2857, 2881, 2905, 2929, 2953, 2977, 3001, 3024, 3048, 3072, 3096, 3119, 3143, 3167, 3191, 3214, 3238, 3262, 3285, 3309, 3332, 3356, 3379, 3403, 3427, 3450, 3474, 3497, 3520, 3543, 3566, 3590, 3613, 3636, 3659, 3682, 3705, 3729, 3730"
      },
      {
        "name": "Tank 2",
        "aircraftid": 2,
        "tankid": 6,
        "weights": "250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500, 6750, 7000, 7250, 7500, 7750, 8000, 8250, 8500, 8750, 9000, 9250, 9500, 9750, 10000, 10250, 10500, 10750, 11000, 11250, 11500, 11750, 12000, 12250, 12500, 12750, 13000, 13250, 13500, 13750, 14000, 14250, 14500, 14750, 15000, 15250, 15500, 15750, 16000, 16250, 16500, 16750, 17000, 17250, 17500, 17750, 18000, 18250, 18500, 18750, 19000, 19250, 19500, 19750, 20000, 20250, 20500, 20750, 21000, 21250, 21500, 21750, 22000, 22250, 22500, 22750, 23000, 23250, 23500, 23750, 24000, 24250, 24500, 24750, 25000, 25250, 25500, 25750, 26000, 26250, 26500, 26750, 27000, 27250, 27500, 27750, 28000, 28250, 28500, 28750, 29000, 29250, 29500, 29750, 30000, 30250, 30500, 30750, 31000, 31250, 31500, 31750, 32000, 32250, 32500, 32750, 33000, 33250, 33500, 33750, 34000, 34250, 34500, 34750, 35000, 35250, 35500, 35750, 36000, 36250, 36500, 36750, 37000, 37250, 37500, 37750, 38240, 38740, 39240, 39740, 40240, 40740, 41240, 41740, 42240, 42740, 43240, 43740, 44240, 44740, 45240, 45740, 46240, 46740, 47240, 47740, 48240, 48740, 49240, 49740, 50240, 50740, 51240, 51740, 52240, 52640",
        "simplemoms": "21, 43, 64, 85, 107, 128, 149, 170, 191, 213, 234, 255, 276, 297, 318, 338, 359, 379, 400, 420, 440, 460, 480, 500, 520, 540, 560, 580, 600, 619, 639, 659, 679, 698, 718, 738, 758, 777, 797, 817, 836, 856, 876, 895, 915, 935, 954, 974, 994, 1013, 1033, 1053, 1072, 1092, 1112, 1131, 1151, 1171, 1190, 1210, 1230, 1249, 1269, 1289, 1308, 1328, 1348, 1367, 1387, 1407, 1426, 1446, 1466, 1485, 1505, 1525, 1544, 1564, 1584, 1603, 1623, 1643, 1662, 1682, 1701, 1721, 1740, 1760, 1780, 1799, 1819, 1838, 1858, 1877, 1897, 1916, 1936, 1955, 1975, 1994, 2013, 2033, 2052, 2072, 2095, 2118, 2141, 2164, 2187, 2209, 2232, 2255, 2277, 2300, 2322, 2345, 2367, 2390, 2412, 2435, 2457, 2480, 2502, 2524, 2547, 2569, 2592, 2614, 2636, 2659, 2681, 2703, 2725, 2748, 2770, 2792, 2815, 2837, 2859, 2882, 2904, 2926, 2948, 2971, 2993, 3015, 3038, 3060, 3082, 3104, 3127, 3170, 3215, 3260, 3304, 3349, 3393, 3438, 3483, 3527, 3571, 3615, 3660, 3704, 3748, 3792, 3836, 3880, 3924, 3969, 4013, 4057, 4101, 4144, 4186, 4227, 4268, 4309, 4350, 4391, 4424"
      },
      {
        "name": "Tank 3",
        "aircraftid": 2,
        "tankid": 7,
        "weights": "250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500, 6750, 7000, 7250, 7500, 7750, 8000, 8250, 8500, 8750, 9000, 9250, 9500, 9750, 10000, 10250, 10500, 10750, 11000, 11250, 11500, 11750, 12000, 12250, 12500, 12750, 13000, 13250, 13500, 13750, 14000, 14250, 14500, 14750, 15000, 15250, 15500, 15750, 16000, 16250, 16500, 16750, 17000, 17250, 17500, 17750, 18000, 18250, 18500, 18750, 19000, 19250, 19500, 19750, 20000, 20250, 20500, 20750, 21000, 21250, 21500, 21750, 22000, 22250, 22500, 22750, 23000, 23250, 23500, 23750, 24000, 24250, 24500, 24750, 25000, 25250, 25500, 25750, 26000, 26250, 26500, 26750, 27000, 27250, 27500, 27750, 28000, 28250, 28500, 28750, 29000, 29250, 29500, 29750, 30000, 30250, 30500, 30750, 31000, 31250, 31500, 31750, 32000, 32250, 32500, 32750, 33000, 33250, 33500, 33750, 34000, 34250, 34500, 34750, 35000, 35250, 35500, 35750, 36000, 36250, 36500, 36750, 37000, 37250, 37500, 37750, 38240, 38740, 39240, 39740, 40240, 40740, 41240, 41740, 42240, 42740, 43240, 43740, 44240, 44740, 45240, 45740, 46240, 46740, 47240, 47740, 48240, 48740, 49240, 49740, 50240, 50740, 51240, 51740, 52240, 52640",
        "simplemoms": "21, 43, 64, 85, 107, 128, 149, 170, 191, 213, 234, 255, 276, 297, 318, 338, 359, 379, 400, 420, 440, 460, 480, 500, 520, 540, 560, 580, 600, 619, 639, 659, 679, 698, 718, 738, 758, 777, 797, 817, 836, 856, 876, 895, 915, 935, 954, 974, 994, 1013, 1033, 1053, 1072, 1092, 1112, 1131, 1151, 1171, 1190, 1210, 1230, 1249, 1269, 1289, 1308, 1328, 1348, 1367, 1387, 1407, 1426, 1446, 1466, 1485, 1505, 1525, 1544, 1564, 1584, 1603, 1623, 1643, 1662, 1682, 1701, 1721, 1740, 1760, 1780, 1799, 1819, 1838, 1858, 1877, 1897, 1916, 1936, 1955, 1975, 1994, 2013, 2033, 2052, 2072, 2095, 2118, 2141, 2164, 2187, 2209, 2232, 2255, 2277, 2300, 2322, 2345, 2367, 2390, 2412, 2435, 2457, 2480, 2502, 2524, 2547, 2569, 2592, 2614, 2636, 2659, 2681, 2703, 2725, 2748, 2770, 2792, 2815, 2837, 2859, 2882, 2904, 2926, 2948, 2971, 2993, 3015, 3038, 3060, 3082, 3104, 3127, 3170, 3215, 3260, 3304, 3349, 3393, 3438, 3483, 3527, 3571, 3615, 3660, 3704, 3748, 3792, 3836, 3880, 3924, 3969, 4013, 4057, 4101, 4144, 4186, 4227, 4268, 4309, 4350, 4391, 4424"
      },
      {
        "name": "Tank 4",
        "aircraftid": 2,
        "tankid": 8,
        "weights": "250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500, 6750, 7000, 7250, 7500, 7750, 8000, 8250, 8500, 8750, 9000, 9250, 9500, 9750, 10000, 10250, 10500, 10750, 11000, 11250, 11500, 11750, 12000, 12250, 12500, 12750, 13000, 13250, 13500, 13750, 14000, 14250, 14500, 14750, 15000, 15250, 15500, 15750, 16000, 16250, 16500, 16750, 17000, 17250, 17500, 17750, 18000, 18250, 18500, 18750, 19000, 19250, 19500, 19750, 20000, 20250, 20500, 20750, 21000, 21250, 21500, 21750, 22000, 22250, 22500, 22750, 23000, 23250, 23500, 23750, 24000, 24250, 24500, 24750, 25000, 25250, 25500, 25750, 26000, 26250, 26500, 26750, 27000, 27250, 27500, 27750, 28000, 28250, 28500, 28750, 29000, 29250, 29500, 29750, 30000, 30250, 30500, 30750, 31000, 31250, 31500, 31750, 32000, 32250, 32500, 32750, 33000, 33250, 33500, 33750, 34000, 34250, 34500, 34750, 35000, 35250, 35500, 35750, 36000, 36250, 36500, 36750, 37000, 37250, 37500, 37750, 37760",
        "simplemoms": "28, 56, 84, 112, 140, 168, 196, 222, 248, 274, 300, 326, 353, 379, 405, 430, 456, 482, 508, 534, 559, 585, 610, 636, 661, 687, 712, 738, 763, 789, 814, 839, 864, 889, 915, 940, 965, 990, 1016, 1041, 1066, 1091, 1116, 1141, 1166, 1190, 1215, 1240, 1265, 1290, 1315, 1340, 1365, 1390, 1414, 1439, 1464, 1489, 1514, 1538, 1563, 1588, 1612, 1637, 1662, 1686, 1711, 1736, 1760, 1785, 1810, 1834, 1859, 1883, 1908, 1932, 1957, 1982, 2006, 2031, 2055, 2080, 2104, 2129, 2153, 2178, 2202, 2227, 2251, 2276, 2300, 2325, 2349, 2373, 2398, 2422, 2447, 2471, 2495, 2520, 2544, 2569, 2593, 2617, 2641, 2665, 2689, 2713, 2737, 2761, 2785, 2809, 2833, 2857, 2881, 2905, 2929, 2953, 2977, 3001, 3024, 3048, 3072, 3096, 3119, 3143, 3167, 3191, 3214, 3238, 3262, 3285, 3309, 3332, 3356, 3379, 3403, 3427, 3450, 3474, 3497, 3520, 3543, 3566, 3590, 3613, 3636, 3659, 3682, 3705, 3729, 3730"
      }
    ],
    "glossarys": [
      {
        "aircraftid": 2,
        "glossaryid": 10,
        "name": "MAC",
        "body": "The distance between the leading and trailing edge of the wing is known as the chord. If the leading edge and trailing edge are parallel, the chord of the wing is constant along the wing’s length. However, because the wings on the C17 are both tapered and swept, the chord changes along the span of the wing. The average length of the chord is known as the mean aerodynamic chord (MAC). The MAC of the C17 is 309.5in 1C-17A-5-2(2-28)"
      },
      {
        "aircraftid": 2,
        "glossaryid": 11,
        "name": "Chart C",
        "body": "The Chart C is a record of the aircraft weight and balance that is continuously updated by a qualified weight and balance technician. Some equipment is provided by the manufacturer during aircraft delivery to the Air Force and is included in the aircraft's basic weight. Further, To standardize equipment and its location, items listed in Addenda A Table 2.1 are included in the basic weight of the aircraft."
      },
      {
        "aircraftid": 2,
        "glossaryid": 12,
        "name": "%MAC",
        "body": "The Percent Mean Aerodynamic Chord identifies where the center or gravity is along the chord of the wing. 0% MAC is located at the LEMAC, and 100% MAC is at the TEMAC(Trailing Edge Mean Aerodynamic Chord). The formula for calculating %MAC is (Balance Arm - LEMAC) / MAC) X 100 1C-17A-5-2(2-28)."
      },
      {
        "aircraftid": 2,
        "glossaryid": 13,
        "name": "Reference Datum",
        "body": "The reference datum is a point located 80.5in forward of the nose of the C17. 1C-17A-5-2(2-28)"
      },
      {
        "aircraftid": 2,
        "glossaryid": 14,
        "name": "Fuselage Station (FS)",
        "body": "An imaginary plane, that runs along the length of the aircraft. It is identified by its distance from the reference datum in inches. FS 0 starts at the reference datum. 1C-17A-5-2(2-28)"
      },
      {
        "aircraftid": 2,
        "glossaryid": 15,
        "name": "Balance Arm",
        "body": "The balance arm is the horizontal distance between the reference datum and the center or gravity. Balance arm = total simplified moment X 10,000 / total weight lb."
      },
      {
        "aircraftid": 2,
        "glossaryid": 16,
        "name": "Addenda A",
        "body": "Configurations with common items, such as sidewall seat life vests, are listed in the Addenda A chapter 3. The weight and moment of these common configurations or their items can be added as cargo into the calculator. For the most accurate calculation, if the item is not accounted for in the Chart C, not listed in Addenda A table 2.1 as equipment that is included in the aircraft basic weight, add its weight and FS into the calculator. https://static.e-publishing.af.mil/production/1/af_a3/publication/afman11-2c-17v3add-a/afman11-2c-17v3add-a.pdf"
      },
      {
        "aircraftid": 2,
        "glossaryid": 17,
        "name": "Moment",
        "body": "The moment of an item is weight in lb multiplied by its arm(distance from the reference datum). Moment is measured in inch-pounds. Moment = Weight in lb x arm. Simplified moment = moment/10000. The moment of fuel is measured in simplified moment and can be found in tables 2-5 or 2-9 for ER jets. The weight and moment of items can be found in AFI 11-2C17V3ADD-A and 1C-17A-5-2"
      },
      {
        "aircraftid": 2,
        "glossaryid": 18,
        "name": "Lemac",
        "body": "The Leading Edge of the Mean Aerodynamic Chord or LEMAC is a measurement of how far the leading edge of the wing is from the reference datum. For swept-wing aircraft, the LEMAC is an average of the distance the leading edge of the wing is from the reference datum. The LEMAC of the C17 is located 793.6in from the reference datum. 1C-17A-5-2(2-28)"
      }
    ],
    "configs": [
      {
        "aircraftid": 2,
        "configid": 20,
        "name": "AE-1",
        "configcargos": [
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 429,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 430,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 431,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 432,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 433,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 434,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 435,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 436,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 437,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 438,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 439,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 440,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 441,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 442,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 443,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 444,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 445,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 446,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 38,
            "configcargoid": 447,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 448,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 449,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 20,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 450,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 2,
        "configid": 21,
        "name": "AE-2",
        "configcargos": [
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 451,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 452,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 453,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 454,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 455,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 456,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 457,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 458,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 459,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 460,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 461,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 462,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 463,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 46,
            "configcargoid": 464,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 46,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 465,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 466,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 467,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 468,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 469,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 38,
            "configcargoid": 470,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 471,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 472,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 21,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 473,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 2,
        "configid": 22,
        "name": "AE-3",
        "configcargos": [
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 474,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 475,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 476,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 477,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 478,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 479,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 480,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 481,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 482,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 483,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 484,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 485,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 486,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 487,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 488,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 489,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 490,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 491,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 68,
            "configcargoid": 492,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 68,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Kit, Passenger service",
              "weight": 10,
              "fs": 280,
              "category": "Extra"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 493,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 494,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 22,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 495,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 2,
        "configid": 23,
        "name": "AEC-1",
        "configcargos": [
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 496,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 497,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 498,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 499,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 500,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 501,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 502,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 503,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 504,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 505,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 506,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 507,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 508,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 46,
            "configcargoid": 509,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 46,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 510,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 511,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 512,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 513,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 514,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 38,
            "configcargoid": 515,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 516,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 517,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 23,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 518,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 2,
        "configid": 24,
        "name": "C-1",
        "configcargos": [
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 519,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 520,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 521,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 522,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 523,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 524,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 525,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 526,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 527,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 528,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 529,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 530,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 531,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 532,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 533,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 534,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 535,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 536,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 38,
            "configcargoid": 537,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 538,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 539,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 24,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 540,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 2,
        "configid": 25,
        "name": "C-2",
        "configcargos": [
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 541,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 542,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 543,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 544,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 545,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 546,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 547,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 548,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 549,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 550,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 551,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 552,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 553,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 554,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 555,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 556,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 557,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 558,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 38,
            "configcargoid": 559,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 560,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 561,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 25,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 562,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 2,
        "configid": 26,
        "name": "C-3",
        "configcargos": [
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 563,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 564,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 565,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 566,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 567,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 568,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 569,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 570,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 571,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 572,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 573,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 574,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 575,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 576,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 577,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 578,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 579,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 580,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 38,
            "configcargoid": 581,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 582,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 583,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 26,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 584,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 2,
        "configid": 27,
        "name": "P-1",
        "configcargos": [
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 585,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 586,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 587,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 588,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 589,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 590,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 591,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 592,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 593,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 594,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 595,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 596,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 597,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 46,
            "configcargoid": 598,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 46,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 599,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 600,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 601,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 602,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 603,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 38,
            "configcargoid": 604,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 605,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 606,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 27,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 607,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 2,
        "configid": 28,
        "name": "SP-X",
        "configcargos": [
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 608,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 609,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 610,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 611,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 612,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 613,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 614,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 615,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 616,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 617,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 618,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 619,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 620,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 621,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 622,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 623,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 624,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 625,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 38,
            "configcargoid": 626,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 627,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 628,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 28,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 629,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 2,
        "configid": 29,
        "name": "CP-X",
        "configcargos": [
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 630,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 631,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 632,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 633,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 634,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 635,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 636,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 637,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 638,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 639,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 640,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 641,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 642,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 643,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 644,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 645,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 646,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 647,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 38,
            "configcargoid": 648,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 649,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 650,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 29,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 651,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 2,
        "configid": 30,
        "name": "ADP-1",
        "configcargos": [
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 652,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 653,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 654,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 655,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 656,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 657,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 658,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 659,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 660,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 661,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 662,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 663,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 664,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 665,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 666,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 667,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 668,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 669,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 38,
            "configcargoid": 670,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 671,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 672,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 30,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 673,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 2,
        "configid": 31,
        "name": "ADP-2",
        "configcargos": [
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 674,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 675,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 676,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 677,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 678,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 679,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 680,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 681,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 682,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 683,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 684,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 685,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 686,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 687,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 688,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 689,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 690,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 691,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 38,
            "configcargoid": 692,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 693,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 694,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 31,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 695,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 2,
        "configid": 32,
        "name": "ADP-3",
        "configcargos": [
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 696,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 697,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 698,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 699,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 700,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 701,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 702,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 703,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 704,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 705,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 706,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 707,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 708,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 46,
            "configcargoid": 709,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 46,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 710,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 711,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 712,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 713,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 714,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 38,
            "configcargoid": 715,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 716,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 717,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 32,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 718,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 2,
        "configid": 33,
        "name": "ADC-1",
        "configcargos": [
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 719,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 720,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 721,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 722,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 723,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 724,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 725,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 726,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 727,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 728,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 729,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 730,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 731,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 732,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 733,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 734,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 735,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 736,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 38,
            "configcargoid": 737,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 738,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 739,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 33,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 740,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 2,
        "configid": 34,
        "name": "ADC-2",
        "configcargos": [
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 741,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 742,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 743,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 744,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 745,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 746,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 747,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 748,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 749,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 750,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 751,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 752,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 753,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 754,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 755,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 756,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 757,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 758,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 38,
            "configcargoid": 759,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 760,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 761,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 34,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 762,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 2,
        "configid": 35,
        "name": "CDS-1",
        "configcargos": [
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 763,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 764,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 765,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 766,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 767,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 768,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 769,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 770,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 771,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 772,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 773,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 774,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 775,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 776,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 777,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 778,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 779,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 780,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 38,
            "configcargoid": 781,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 782,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 783,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 35,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 784,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 2,
        "configid": 36,
        "name": "DV-1",
        "configcargos": [
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 785,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 786,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 787,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 788,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 789,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 790,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 791,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 792,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 793,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 794,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 795,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 796,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 797,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 46,
            "configcargoid": 798,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 46,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 799,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 800,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 801,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 802,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 803,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 38,
            "configcargoid": 804,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 805,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 806,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 36,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 807,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 2,
        "configid": 37,
        "name": "SD-1",
        "configcargos": [
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 808,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 809,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 810,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 811,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 812,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 813,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 814,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 815,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 816,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 817,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 818,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 819,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 820,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 46,
            "configcargoid": 821,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 46,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 822,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 823,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 824,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 825,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 826,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 38,
            "configcargoid": 827,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 828,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 829,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 37,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 830,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      },
      {
        "aircraftid": 2,
        "configid": 38,
        "name": "SLC-1",
        "configcargos": [
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 62,
            "configcargoid": 831,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 61,
            "configcargoid": 832,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 63,
            "configcargoid": 833,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 67,
            "configcargoid": 834,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 54,
            "configcargoid": 835,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 55,
            "configcargoid": 836,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 50,
            "configcargoid": 837,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 53,
            "configcargoid": 838,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 52,
            "configcargoid": 839,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 49,
            "configcargoid": 840,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 48,
            "configcargoid": 841,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 47,
            "configcargoid": 842,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 51,
            "configcargoid": 843,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 64,
            "configcargoid": 844,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 64,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "SLIP (unoccupied)",
              "weight": 1350,
              "fs": -1,
              "category": "Extra"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 66,
            "configcargoid": 845,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 66,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "SLICC Conference Capsule",
              "weight": 4660,
              "fs": 685,
              "category": "Extra"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 65,
            "configcargoid": 846,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 65,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "SLICC Berthing Capsule",
              "weight": 3790,
              "fs": 580,
              "category": "Extra"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 46,
            "configcargoid": 847,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 46,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 43,
            "configcargoid": 848,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 42,
            "configcargoid": 849,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 41,
            "configcargoid": 850,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 40,
            "configcargoid": 851,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 39,
            "configcargoid": 852,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 38,
            "configcargoid": 853,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 37,
            "configcargoid": 854,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 36,
            "configcargoid": 855,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configid": 38,
            "aircraftid": 2,
            "cargoid": 35,
            "configcargoid": 856,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 2,
              "cargoid": 35,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358,
              "category": "Steward"
            }
          }
        ]
      }
    ]
  }
]
''';