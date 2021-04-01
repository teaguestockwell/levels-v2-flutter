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
    "cargoWeight1": 300000,
    "lemac": 793.6,
    "mac": 309.5,
    "mommultiplyer": 10000,
    "cargos": [
      {
        "aircraftId": 1,
        "cargoId": 1,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Water Container (5 Gallon)",
        "weight": 40,
        "fs": 358,
        "category": "Steward"
      },
      {
        "aircraftId": 1,
        "cargoId": 2,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Std 2 gal liquid container",
        "weight": 25,
        "fs": 260,
        "category": "Steward"
      },
      {
        "aircraftId": 1,
        "cargoId": 3,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Hot Cup",
        "weight": 3,
        "fs": 260,
        "category": "Steward"
      },
      {
        "aircraftId": 1,
        "cargoId": 4,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Human Waste Clean-up kit",
        "weight": 5,
        "fs": 280,
        "category": "Steward"
      },
      {
        "aircraftId": 1,
        "cargoId": 5,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Blanket Large",
        "weight": 3.5,
        "fs": 280,
        "category": "Steward"
      },
      {
        "aircraftId": 1,
        "cargoId": 6,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Pillow Large w/Case",
        "weight": 2,
        "fs": 280,
        "category": "Steward"
      },
      {
        "aircraftId": 1,
        "cargoId": 7,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Blanket Small",
        "weight": 1,
        "fs": -1,
        "category": "Steward"
      },
      {
        "aircraftId": 1,
        "cargoId": 8,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Pillow Small w/Case",
        "weight": 0.5,
        "fs": -1,
        "category": "Steward"
      },
      {
        "aircraftId": 1,
        "cargoId": 9,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Expendable Supplies",
        "weight": 10,
        "fs": 260,
        "category": "Steward"
      },
      {
        "aircraftId": 1,
        "cargoId": 10,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Passenger Demo Kit",
        "weight": 3,
        "fs": 380,
        "category": "Steward"
      },
      {
        "aircraftId": 1,
        "cargoId": 11,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Pax info card",
        "weight": 3,
        "fs": 280,
        "category": "Steward"
      },
      {
        "aircraftId": 1,
        "cargoId": 12,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "ATGL (Serviced)",
        "weight": 3620,
        "fs": 401,
        "category": "Steward"
      },
      {
        "aircraftId": 1,
        "cargoId": 13,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "LPU-6P Infant Cot",
        "weight": 4,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftId": 1,
        "cargoId": 14,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "A/C Life Preserver",
        "weight": 1.5,
        "fs": -1,
        "category": "Emergency"
      },
      {
        "aircraftId": 1,
        "cargoId": 15,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Protective clothing kit",
        "weight": 36,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftId": 1,
        "cargoId": 16,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "BA-22 Parachute",
        "weight": 28,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftId": 1,
        "cargoId": 17,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "LPU-10P",
        "weight": 4,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftId": 1,
        "cargoId": 18,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "EPOS",
        "weight": 2,
        "fs": -1,
        "category": "Emergency"
      },
      {
        "aircraftId": 1,
        "cargoId": 19,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "PBE",
        "weight": 5,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftId": 1,
        "cargoId": 20,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Survival Vest",
        "weight": 11.5,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftId": 1,
        "cargoId": 21,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Aircrew Body Armor (Level IIIA)",
        "weight": 8.5,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftId": 1,
        "cargoId": 22,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "60 Hz Backup Converter",
        "weight": 43,
        "fs": 252,
        "category": "Extra"
      },
      {
        "aircraftId": 1,
        "cargoId": 23,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Additional Aeromedical Stations",
        "weight": 66,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftId": 1,
        "cargoId": 24,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Seat Pallets DV (5 Seats/Pallet)",
        "weight": 591,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftId": 1,
        "cargoId": 25,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Seat Pallets DV (10 Seats/pallet)",
        "weight": 767,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftId": 1,
        "cargoId": 26,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Seat Pallets Mass (15 Seats/pallet)",
        "weight": 943,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftId": 1,
        "cargoId": 27,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Flares/Flare Cans (Note 1)",
        "weight": 255,
        "fs": 744,
        "category": "Extra"
      },
      {
        "aircraftId": 1,
        "cargoId": 28,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Flare Hazard Placards (Note 1)",
        "weight": 20,
        "fs": 400,
        "category": "Extra"
      },
      {
        "aircraftId": 1,
        "cargoId": 29,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "Aircraft Armor (Note 1)",
        "weight": 1125,
        "fs": 217,
        "category": "Extra"
      },
      {
        "aircraftId": 1,
        "cargoId": 30,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "SLIP (unoccupied)",
        "weight": 1350,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftId": 1,
        "cargoId": 31,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "SLICC Berthing Capsule",
        "weight": 3790,
        "fs": 580,
        "category": "Extra"
      },
      {
        "aircraftId": 1,
        "cargoId": 32,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "SLICC Conference Capsule",
        "weight": 4660,
        "fs": 685,
        "category": "Extra"
      },
      {
        "aircraftId": 1,
        "cargoId": 33,
        "updated": "2021-03-13T05:05:14.565Z",
        "updatedBy": "unknown",
        "name": "MX TO File",
        "weight": 30,
        "fs": 305,
        "category": "Extra"
      },
      {
        "aircraftId": 1,
        "cargoId": 34,
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
        "aircraftId": 1,
        "tankId": 1,
        "weightsCSV": "250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500, 6750, 7000, 7250, 7500, 7750, 8000, 8250, 8500, 8750, 9000, 9250, 9500, 9750, 10000, 10250, 10500, 10750, 11000, 11250, 11500, 11750, 12000, 12250, 12500, 12750, 13000, 13250, 13500, 13750, 14000, 14250, 14500, 14750, 15000, 15250, 15500, 15750, 16000, 16250, 16500, 16750, 17000, 17250, 17500, 17750, 18000, 18250, 18500, 18750, 19000, 19250, 19500, 19750, 20000, 20250, 20500, 20750, 21000, 21250, 21500, 21750, 22000, 22250, 22500, 22750, 23000, 23250, 23500, 23750, 24000, 24250, 24500, 24750, 25000, 25250, 25500, 25750, 26000, 26250, 26500, 26750, 27000, 27250, 27500, 27750, 28000, 28250, 28500, 28750, 29000, 29250, 29500, 29750, 30000, 30250, 30500, 30750, 31000, 31250, 31500, 31750, 32000, 32250, 32500, 32750, 33000, 33250, 33500, 33750, 34000, 34250, 34500, 34750, 35000, 35250, 35500, 35750, 36000, 36250, 36500, 36750, 37000, 37250, 37500, 37750, 37760",
        "simpleMomsCSV": "28, 56, 84, 112, 140, 168, 196, 222, 248, 274, 300, 326, 353, 379, 405, 430, 456, 482, 508, 534, 559, 585, 610, 636, 661, 687, 712, 738, 763, 789, 814, 839, 864, 889, 915, 940, 965, 990, 1016, 1041, 1066, 1091, 1116, 1141, 1166, 1190, 1215, 1240, 1265, 1290, 1315, 1340, 1365, 1390, 1414, 1439, 1464, 1489, 1514, 1538, 1563, 1588, 1612, 1637, 1662, 1686, 1711, 1736, 1760, 1785, 1810, 1834, 1859, 1883, 1908, 1932, 1957, 1982, 2006, 2031, 2055, 2080, 2104, 2129, 2153, 2178, 2202, 2227, 2251, 2276, 2300, 2325, 2349, 2373, 2398, 2422, 2447, 2471, 2495, 2520, 2544, 2569, 2593, 2617, 2641, 2665, 2689, 2713, 2737, 2761, 2785, 2809, 2833, 2857, 2881, 2905, 2929, 2953, 2977, 3001, 3024, 3048, 3072, 3096, 3119, 3143, 3167, 3191, 3214, 3238, 3262, 3285, 3309, 3332, 3356, 3379, 3403, 3427, 3450, 3474, 3497, 3520, 3543, 3566, 3590, 3613, 3636, 3659, 3682, 3705, 3729, 3730"
      },
      {
        "name": "Tank 2 ER",
        "aircraftId": 1,
        "tankId": 2,
        "weightsCSV": "250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500, 6750, 7000, 7250, 7500, 7750, 8000, 8250, 8500, 8750, 9000, 9250, 9500, 9750, 10000, 10250, 10500, 10750, 11000, 11250, 11500, 11750, 12000, 12250, 12500, 12750, 13000, 13250, 13500, 13750, 14000, 14250, 14500, 14750, 15000, 15250, 15500, 15750, 16000, 16250, 16500, 16750, 17000, 17250, 17500, 17750, 18000, 18250, 18500, 18750, 19000, 19250, 19500, 19750, 20000, 20250, 20500, 20750, 21000, 21250, 21500, 21750, 22000, 22250, 22500, 22750, 23000, 23250, 23500, 23750, 24000, 24250, 24500, 24750, 25000, 25250, 25500, 25750, 26000, 26250, 26500, 26750, 27000, 27250, 27500, 27750, 28000, 28250, 28500, 28750, 29000, 29250, 29500, 29750, 30000, 30250, 30500, 30750, 31000, 31250, 31500, 31750, 32000, 32250, 32500, 32750, 33000, 33250, 33500, 33750, 34000, 34250, 34500, 34750, 35000, 35250, 35500, 35750, 36000, 36250, 36500, 36750, 37000, 37250, 37500, 37750, 38240, 38740, 39240, 39740, 40240, 40740, 41240, 41740, 42240, 42740, 43240, 43740, 44240, 44740, 45240, 45740, 46240, 46740, 47240, 47740, 48240, 48740, 49240, 49740, 50240, 50740, 51240, 51740, 52240, 52740, 53240, 53740, 54240, 54740, 55240, 55740, 56240, 56740, 57240, 57740, 58240, 58740, 59240, 59740, 60240, 60740, 61240, 61740, 62240, 62740, 63240, 63640, 64240, 64740, 65240, 65740, 66240, 66740, 67240, 67740, 68240, 68740, 69240, 69740, 70240, 70740, 71240, 71740, 72240, 72740, 73240, 73740, 74240, 74640, 75240, 75740, 76240, 76740, 77240, 77740, 78240, 78740, 79240, 79740, 80240, 80740, 81240, 81740, 82240, 82740, 83240, 83740, 84240, 84540",
        "simpleMomsCSV": "21, 43, 64, 85, 107, 128, 149, 170, 191, 213, 234, 255, 276, 297, 318, 339, 359, 380, 401, 421, 441, 461, 481, 501, 521, 541, 561, 581, 600, 620, 640, 660, 679, 699, 719, 739, 758, 778, 797, 817, 837, 857, 876, 896, 916, 935, 955, 975, 994, 1014, 1033, 1053, 1073, 1093, 1112, 1132, 1152, 1171, 1191, 1210, 1230, 1250, 1270, 1289, 1309, 1329, 1348, 1368, 1387, 1407, 1427, 1446, 1466, 1486, 1506, 1525, 1545, 1564, 1584, 1604, 1623, 1643, 1663, 1682, 1702, 1721, 1741, 1760, 1780, 1799, 1819, 1839, 1858, 1878, 1897, 1917, 1936, 1956, 1976, 1995, 2014, 2034, 2053, 2072, 2091, 2111, 2130, 2149, 2168, 2187, 2206, 2225, 2244, 2262, 2285, 2308, 2330, 2353, 2376, 2399, 2422, 2444, 2466, 2489, 2511, 2534, 2557, 2579, 2602, 2625, 2647, 2669, 2692, 2714, 2736, 2758, 2781, 2803, 2826, 2848, 2870, 2893, 2915, 2937, 2959, 2982, 3004, 3026, 3049, 3071, 3094, 3137, 3182, 3227, 3271, 3316, 3361, 3405, 3450, 3494, 3539, 3583, 3628, 3672, 3717, 3761, 3805, 3850, 3894, 3939, 3983, 4027, 4072, 4116, 4159, 4203, 4246, 4289, 4332, 4375, 4419, 4462, 4505, 4548, 4589, 4631, 4672, 4713, 4755, 4796, 4837, 4879, 4920, 4961, 5003, 5044, 5085, 5127, 5168, 5209, 5250, 5290, 5330, 5370, 5411, 5451, 5491, 5531, 5571, 5611, 5648, 5684, 5720, 5756, 5792, 5828, 5864, 5900, 5935, 5971, 6007, 6043, 6079, 6115, 6151, 6187, 6222, 6258, 6294, 6329, 6365, 6401, 6437, 6473, 6509, 6545, 6581, 6616, 6652, 6687, 6723, 6758, 6794, 6829, 6850"
      },
      {
        "name": "Tank 3 ER",
        "aircraftId": 1,
        "tankId": 3,
        "weightsCSV": "250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500, 6750, 7000, 7250, 7500, 7750, 8000, 8250, 8500, 8750, 9000, 9250, 9500, 9750, 10000, 10250, 10500, 10750, 11000, 11250, 11500, 11750, 12000, 12250, 12500, 12750, 13000, 13250, 13500, 13750, 14000, 14250, 14500, 14750, 15000, 15250, 15500, 15750, 16000, 16250, 16500, 16750, 17000, 17250, 17500, 17750, 18000, 18250, 18500, 18750, 19000, 19250, 19500, 19750, 20000, 20250, 20500, 20750, 21000, 21250, 21500, 21750, 22000, 22250, 22500, 22750, 23000, 23250, 23500, 23750, 24000, 24250, 24500, 24750, 25000, 25250, 25500, 25750, 26000, 26250, 26500, 26750, 27000, 27250, 27500, 27750, 28000, 28250, 28500, 28750, 29000, 29250, 29500, 29750, 30000, 30250, 30500, 30750, 31000, 31250, 31500, 31750, 32000, 32250, 32500, 32750, 33000, 33250, 33500, 33750, 34000, 34250, 34500, 34750, 35000, 35250, 35500, 35750, 36000, 36250, 36500, 36750, 37000, 37250, 37500, 37750, 38240, 38740, 39240, 39740, 40240, 40740, 41240, 41740, 42240, 42740, 43240, 43740, 44240, 44740, 45240, 45740, 46240, 46740, 47240, 47740, 48240, 48740, 49240, 49740, 50240, 50740, 51240, 51740, 52240, 52740, 53240, 53740, 54240, 54740, 55240, 55740, 56240, 56740, 57240, 57740, 58240, 58740, 59240, 59740, 60240, 60740, 61240, 61740, 62240, 62740, 63240, 63640, 64240, 64740, 65240, 65740, 66240, 66740, 67240, 67740, 68240, 68740, 69240, 69740, 70240, 70740, 71240, 71740, 72240, 72740, 73240, 73740, 74240, 74640, 75240, 75740, 76240, 76740, 77240, 77740, 78240, 78740, 79240, 79740, 80240, 80740, 81240, 81740, 82240, 82740, 83240, 83740, 84240, 84540",
        "simpleMomsCSV": "21, 43, 64, 85, 107, 128, 149, 170, 191, 213, 234, 255, 276, 297, 318, 339, 359, 380, 401, 421, 441, 461, 481, 501, 521, 541, 561, 581, 600, 620, 640, 660, 679, 699, 719, 739, 758, 778, 797, 817, 837, 857, 876, 896, 916, 935, 955, 975, 994, 1014, 1033, 1053, 1073, 1093, 1112, 1132, 1152, 1171, 1191, 1210, 1230, 1250, 1270, 1289, 1309, 1329, 1348, 1368, 1387, 1407, 1427, 1446, 1466, 1486, 1506, 1525, 1545, 1564, 1584, 1604, 1623, 1643, 1663, 1682, 1702, 1721, 1741, 1760, 1780, 1799, 1819, 1839, 1858, 1878, 1897, 1917, 1936, 1956, 1976, 1995, 2014, 2034, 2053, 2072, 2091, 2111, 2130, 2149, 2168, 2187, 2206, 2225, 2244, 2262, 2285, 2308, 2330, 2353, 2376, 2399, 2422, 2444, 2466, 2489, 2511, 2534, 2557, 2579, 2602, 2625, 2647, 2669, 2692, 2714, 2736, 2758, 2781, 2803, 2826, 2848, 2870, 2893, 2915, 2937, 2959, 2982, 3004, 3026, 3049, 3071, 3094, 3137, 3182, 3227, 3271, 3316, 3361, 3405, 3450, 3494, 3539, 3583, 3628, 3672, 3717, 3761, 3805, 3850, 3894, 3939, 3983, 4027, 4072, 4116, 4159, 4203, 4246, 4289, 4332, 4375, 4419, 4462, 4505, 4548, 4589, 4631, 4672, 4713, 4755, 4796, 4837, 4879, 4920, 4961, 5003, 5044, 5085, 5127, 5168, 5209, 5250, 5290, 5330, 5370, 5411, 5451, 5491, 5531, 5571, 5611, 5648, 5684, 5720, 5756, 5792, 5828, 5864, 5900, 5935, 5971, 6007, 6043, 6079, 6115, 6151, 6187, 6222, 6258, 6294, 6329, 6365, 6401, 6437, 6473, 6509, 6545, 6581, 6616, 6652, 6687, 6723, 6758, 6794, 6829, 6850"
      },
      {
        "name": "Tank 4",
        "aircraftId": 1,
        "tankId": 4,
        "weightsCSV": "250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500, 6750, 7000, 7250, 7500, 7750, 8000, 8250, 8500, 8750, 9000, 9250, 9500, 9750, 10000, 10250, 10500, 10750, 11000, 11250, 11500, 11750, 12000, 12250, 12500, 12750, 13000, 13250, 13500, 13750, 14000, 14250, 14500, 14750, 15000, 15250, 15500, 15750, 16000, 16250, 16500, 16750, 17000, 17250, 17500, 17750, 18000, 18250, 18500, 18750, 19000, 19250, 19500, 19750, 20000, 20250, 20500, 20750, 21000, 21250, 21500, 21750, 22000, 22250, 22500, 22750, 23000, 23250, 23500, 23750, 24000, 24250, 24500, 24750, 25000, 25250, 25500, 25750, 26000, 26250, 26500, 26750, 27000, 27250, 27500, 27750, 28000, 28250, 28500, 28750, 29000, 29250, 29500, 29750, 30000, 30250, 30500, 30750, 31000, 31250, 31500, 31750, 32000, 32250, 32500, 32750, 33000, 33250, 33500, 33750, 34000, 34250, 34500, 34750, 35000, 35250, 35500, 35750, 36000, 36250, 36500, 36750, 37000, 37250, 37500, 37750, 37760",
        "simpleMomsCSV": "28, 56, 84, 112, 140, 168, 196, 222, 248, 274, 300, 326, 353, 379, 405, 430, 456, 482, 508, 534, 559, 585, 610, 636, 661, 687, 712, 738, 763, 789, 814, 839, 864, 889, 915, 940, 965, 990, 1016, 1041, 1066, 1091, 1116, 1141, 1166, 1190, 1215, 1240, 1265, 1290, 1315, 1340, 1365, 1390, 1414, 1439, 1464, 1489, 1514, 1538, 1563, 1588, 1612, 1637, 1662, 1686, 1711, 1736, 1760, 1785, 1810, 1834, 1859, 1883, 1908, 1932, 1957, 1982, 2006, 2031, 2055, 2080, 2104, 2129, 2153, 2178, 2202, 2227, 2251, 2276, 2300, 2325, 2349, 2373, 2398, 2422, 2447, 2471, 2495, 2520, 2544, 2569, 2593, 2617, 2641, 2665, 2689, 2713, 2737, 2761, 2785, 2809, 2833, 2857, 2881, 2905, 2929, 2953, 2977, 3001, 3024, 3048, 3072, 3096, 3119, 3143, 3167, 3191, 3214, 3238, 3262, 3285, 3309, 3332, 3356, 3379, 3403, 3427, 3450, 3474, 3497, 3520, 3543, 3566, 3590, 3613, 3636, 3659, 3682, 3705, 3729, 3730"
      }
    ],
    "glossarys": [
      {
        "aircraftId": 1,
        "glossaryId": 1,
        "name": "MAC",
        "body": "The distance between the leading and trailing edge of the wing is known as the chord. If the leading edge and trailing edge are parallel, the chord of the wing is constant along the wing’s length. However, because the wings on the C17 are both tapered and swept, the chord changes along the span of the wing. The average length of the chord is known as the mean aerodynamic chord (MAC). The MAC of the C17 is 309.5in 1C-17A-5-2(2-28)"
      },
      {
        "aircraftId": 1,
        "glossaryId": 2,
        "name": "Chart C",
        "body": "The Chart C is a record of the aircraft weight and balance that is continuously updated by a qualified weight and balance technician. Some equipment is provided by the manufacturer during aircraft delivery to the Air Force and is included in the aircraft's basic weight. Further, To standardize equipment and its location, items listed in Addenda A Table 2.1 are included in the basic weight of the aircraft."
      },
      {
        "aircraftId": 1,
        "glossaryId": 3,
        "name": "%MAC",
        "body": "The Percent Mean Aerodynamic Chord identifies where the center or gravity is along the chord of the wing. 0% MAC is located at the LEMAC, and 100% MAC is at the TEMAC(Trailing Edge Mean Aerodynamic Chord). The formula for calculating %MAC is (Balance Arm - LEMAC) / MAC) X 100 1C-17A-5-2(2-28)."
      },
      {
        "aircraftId": 1,
        "glossaryId": 4,
        "name": "Reference Datum",
        "body": "The reference datum is a point located 80.5in forward of the nose of the C17. 1C-17A-5-2(2-28)"
      },
      {
        "aircraftId": 1,
        "glossaryId": 5,
        "name": "Fuselage Station (FS)",
        "body": "An imaginary plane, that runs along the length of the aircraft. It is identified by its distance from the reference datum in inches. FS 0 starts at the reference datum. 1C-17A-5-2(2-28)"
      },
      {
        "aircraftId": 1,
        "glossaryId": 6,
        "name": "Balance Arm",
        "body": "The balance arm is the horizontal distance between the reference datum and the center or gravity. Balance arm = total simplified moment X 10,000 / total weight lb."
      },
      {
        "aircraftId": 1,
        "glossaryId": 7,
        "name": "Addenda A",
        "body": "Configurations with common items, such as sidewall seat life vests, are listed in the Addenda A chapter 3. The weight and moment of these common configurations or their items can be added as cargo into the calculator. For the most accurate calculation, if the item is not accounted for in the Chart C, not listed in Addenda A table 2.1 as equipment that is included in the aircraft basic weight, add its weight and FS into the calculator. https://static.e-publishing.af.mil/production/1/af_a3/publication/afman11-2c-17v3add-a/afman11-2c-17v3add-a.pdf"
      },
      {
        "aircraftId": 1,
        "glossaryId": 8,
        "name": "Moment",
        "body": "The moment of an item is weight in lb multiplied by its arm(distance from the reference datum). Moment is measured in inch-pounds. Moment = Weight in lb x arm. Simplified moment = moment/10000. The moment of fuel is measured in simplified moment and can be found in tables 2-5 or 2-9 for ER jets. The weight and moment of items can be found in AFI 11-2C17V3ADD-A and 1C-17A-5-2"
      },
      {
        "aircraftId": 1,
        "glossaryId": 9,
        "name": "Lemac",
        "body": "The Leading Edge of the Mean Aerodynamic Chord or LEMAC is a measurement of how far the leading edge of the wing is from the reference datum. For swept-wing aircraft, the LEMAC is an average of the distance the leading edge of the wing is from the reference datum. The LEMAC of the C17 is located 793.6in from the reference datum. 1C-17A-5-2(2-28)"
      }
    ],
    "configs": [
      {
        "aircraftId": 1,
        "configId": 1,
        "name": "AE-1",
        "configCargos": [
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 1,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 2,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 3,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 4,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 5,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 6,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 7,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 8,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 9,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 10,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 11,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 12,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 13,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 14,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 15,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 16,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 17,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 18,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 4,
            "configCargoId": 19,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 20,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 21,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 1,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 22,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
        "aircraftId": 1,
        "configId": 2,
        "name": "AE-2",
        "configCargos": [
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 23,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 24,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 25,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 26,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 27,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 28,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 29,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 30,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 31,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 32,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 33,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 34,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 35,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 12,
            "configCargoId": 36,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 12,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 37,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 38,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 39,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 40,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 41,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 4,
            "configCargoId": 42,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 43,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 44,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 2,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 45,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
        "aircraftId": 1,
        "configId": 3,
        "name": "AE-3",
        "configCargos": [
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 46,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 47,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 48,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 49,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 50,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 51,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 52,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 53,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 54,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 55,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 56,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 57,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 58,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 59,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 60,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 61,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 62,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 63,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 34,
            "configCargoId": 64,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 34,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Kit, Passenger service",
              "weight": 10,
              "fs": 280,
              "category": "Extra"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 65,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 66,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 3,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 67,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
        "aircraftId": 1,
        "configId": 4,
        "name": "AEC-1",
        "configCargos": [
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 68,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 69,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 70,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 71,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 72,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 73,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 74,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 75,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 76,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 77,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 78,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 79,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 80,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 12,
            "configCargoId": 81,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 12,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 82,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 83,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 84,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 85,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 86,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 4,
            "configCargoId": 87,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 88,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 89,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 4,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 90,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
        "aircraftId": 1,
        "configId": 5,
        "name": "C-1",
        "configCargos": [
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 91,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 92,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 93,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 94,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 95,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 96,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 97,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 98,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 99,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 100,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 101,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 102,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 103,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 104,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 105,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 106,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 107,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 108,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 4,
            "configCargoId": 109,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 110,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 111,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 5,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 112,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
        "aircraftId": 1,
        "configId": 6,
        "name": "C-2",
        "configCargos": [
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 113,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 114,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 115,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 116,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 117,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 118,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 119,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 120,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 121,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 122,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 123,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 124,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 125,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 126,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 127,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 128,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 129,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 130,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 4,
            "configCargoId": 131,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 132,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 133,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 6,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 134,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
        "aircraftId": 1,
        "configId": 7,
        "name": "C-3",
        "configCargos": [
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 135,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 136,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 137,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 138,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 139,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 140,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 141,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 142,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 143,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 144,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 145,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 146,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 147,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 148,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 149,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 150,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 151,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 152,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 4,
            "configCargoId": 153,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 154,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 155,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 7,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 156,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
        "aircraftId": 1,
        "configId": 8,
        "name": "P-1",
        "configCargos": [
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 157,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 158,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 159,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 160,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 161,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 162,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 163,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 164,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 165,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 166,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 167,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 168,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 169,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 12,
            "configCargoId": 170,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 12,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 171,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 172,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 173,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 174,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 175,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 4,
            "configCargoId": 176,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 177,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 178,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 8,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 179,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
        "aircraftId": 1,
        "configId": 9,
        "name": "SP-X",
        "configCargos": [
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 180,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 181,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 182,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 183,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 184,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 185,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 186,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 187,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 188,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 189,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 190,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 191,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 192,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 193,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 194,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 195,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 196,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 197,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 4,
            "configCargoId": 198,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 199,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 200,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 9,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 201,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
        "aircraftId": 1,
        "configId": 10,
        "name": "CP-X",
        "configCargos": [
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 202,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 203,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 204,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 205,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 206,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 207,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 208,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 209,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 210,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 211,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 212,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 213,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 214,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 215,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 216,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 217,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 218,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 219,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 4,
            "configCargoId": 220,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 221,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 222,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 10,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 223,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
        "aircraftId": 1,
        "configId": 11,
        "name": "ADP-1",
        "configCargos": [
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 224,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 225,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 226,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 227,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 228,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 229,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 230,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 231,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 232,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 233,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 234,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 235,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 236,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 237,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 238,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 239,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 240,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 241,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 4,
            "configCargoId": 242,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 243,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 244,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 11,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 245,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
        "aircraftId": 1,
        "configId": 12,
        "name": "ADP-2",
        "configCargos": [
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 246,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 247,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 248,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 249,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 250,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 251,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 252,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 253,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 254,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 255,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 256,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 257,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 258,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 259,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 260,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 261,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 262,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 263,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 4,
            "configCargoId": 264,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 265,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 266,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 12,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 267,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
        "aircraftId": 1,
        "configId": 13,
        "name": "ADP-3",
        "configCargos": [
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 268,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 269,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 270,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 271,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 272,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 273,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 274,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 275,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 276,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 277,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 278,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 279,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 280,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 12,
            "configCargoId": 281,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 12,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 282,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 283,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 284,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 285,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 286,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 4,
            "configCargoId": 287,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 288,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 289,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 13,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 290,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
        "aircraftId": 1,
        "configId": 14,
        "name": "ADC-1",
        "configCargos": [
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 291,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 292,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 293,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 294,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 295,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 296,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 297,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 298,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 299,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 300,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 301,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 302,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 303,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 304,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 305,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 306,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 307,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 308,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 4,
            "configCargoId": 309,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 310,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 311,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 14,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 312,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
        "aircraftId": 1,
        "configId": 15,
        "name": "ADC-2",
        "configCargos": [
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 313,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 314,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 315,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 316,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 317,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 318,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 319,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 320,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 321,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 322,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 323,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 324,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 325,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 326,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 327,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 328,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 329,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 330,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 4,
            "configCargoId": 331,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 332,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 333,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 15,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 334,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
        "aircraftId": 1,
        "configId": 16,
        "name": "CDS-1",
        "configCargos": [
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 335,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 336,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 337,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 338,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 339,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 340,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 341,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 342,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 343,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 344,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 345,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 346,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 347,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 348,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 349,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 350,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 351,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 352,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 4,
            "configCargoId": 353,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 354,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 355,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 16,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 356,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
        "aircraftId": 1,
        "configId": 17,
        "name": "DV-1",
        "configCargos": [
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 357,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 358,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 359,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 360,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 361,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 362,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 363,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 364,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 365,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 366,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 367,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 368,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 369,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 12,
            "configCargoId": 370,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 12,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 371,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 372,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 373,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 374,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 375,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 4,
            "configCargoId": 376,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 377,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 378,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 17,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 379,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
        "aircraftId": 1,
        "configId": 18,
        "name": "SD-1",
        "configCargos": [
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 380,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 381,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 382,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 383,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 384,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 385,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 386,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 387,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 388,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 389,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 390,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 391,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 392,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 12,
            "configCargoId": 393,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 12,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 394,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 395,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 396,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 397,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 398,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 4,
            "configCargoId": 399,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 400,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 401,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 18,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 402,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
        "aircraftId": 1,
        "configId": 19,
        "name": "SLC-1",
        "configCargos": [
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 28,
            "configCargoId": 403,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 28,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 27,
            "configCargoId": 404,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 27,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 29,
            "configCargoId": 405,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 29,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 33,
            "configCargoId": 406,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 33,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 20,
            "configCargoId": 407,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 20,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 21,
            "configCargoId": 408,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 21,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 16,
            "configCargoId": 409,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 16,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 19,
            "configCargoId": 410,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 19,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 18,
            "configCargoId": 411,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 18,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 15,
            "configCargoId": 412,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 15,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 14,
            "configCargoId": 413,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 14,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 13,
            "configCargoId": 414,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 13,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 17,
            "configCargoId": 415,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 17,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 30,
            "configCargoId": 416,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 30,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "SLIP (unoccupied)",
              "weight": 1350,
              "fs": -1,
              "category": "Extra"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 32,
            "configCargoId": 417,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 32,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "SLICC Conference Capsule",
              "weight": 4660,
              "fs": 685,
              "category": "Extra"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 31,
            "configCargoId": 418,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 31,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "SLICC Berthing Capsule",
              "weight": 3790,
              "fs": 580,
              "category": "Extra"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 12,
            "configCargoId": 419,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 12,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 9,
            "configCargoId": 420,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 9,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 8,
            "configCargoId": 421,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 8,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 7,
            "configCargoId": 422,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 7,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 6,
            "configCargoId": 423,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 6,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 5,
            "configCargoId": 424,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 5,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 4,
            "configCargoId": 425,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 4,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 3,
            "configCargoId": 426,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 3,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 2,
            "configCargoId": 427,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 2,
              "updated": "2021-03-13T05:05:14.565Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 19,
            "aircraftId": 1,
            "cargoId": 1,
            "configCargoId": 428,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 1,
              "cargoId": 1,
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
    "cargoWeight1": 300000,
    "lemac": 793.6,
    "mac": 309.5,
    "mommultiplyer": 10000,
    "cargos": [
      {
        "aircraftId": 2,
        "cargoId": 35,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Water Container (5 Gallon)",
        "weight": 40,
        "fs": 358,
        "category": "Steward"
      },
      {
        "aircraftId": 2,
        "cargoId": 36,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Std 2 gal liquid container",
        "weight": 25,
        "fs": 260,
        "category": "Steward"
      },
      {
        "aircraftId": 2,
        "cargoId": 37,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Hot Cup",
        "weight": 3,
        "fs": 260,
        "category": "Steward"
      },
      {
        "aircraftId": 2,
        "cargoId": 38,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Human Waste Clean-up kit",
        "weight": 5,
        "fs": 280,
        "category": "Steward"
      },
      {
        "aircraftId": 2,
        "cargoId": 39,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Blanket Large",
        "weight": 3.5,
        "fs": 280,
        "category": "Steward"
      },
      {
        "aircraftId": 2,
        "cargoId": 40,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Pillow Large w/Case",
        "weight": 2,
        "fs": 280,
        "category": "Steward"
      },
      {
        "aircraftId": 2,
        "cargoId": 41,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Blanket Small",
        "weight": 1,
        "fs": -1,
        "category": "Steward"
      },
      {
        "aircraftId": 2,
        "cargoId": 42,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Pillow Small w/Case",
        "weight": 0.5,
        "fs": -1,
        "category": "Steward"
      },
      {
        "aircraftId": 2,
        "cargoId": 43,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Expendable Supplies",
        "weight": 10,
        "fs": 260,
        "category": "Steward"
      },
      {
        "aircraftId": 2,
        "cargoId": 44,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Passenger Demo Kit",
        "weight": 3,
        "fs": 380,
        "category": "Steward"
      },
      {
        "aircraftId": 2,
        "cargoId": 45,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Pax info card",
        "weight": 3,
        "fs": 280,
        "category": "Steward"
      },
      {
        "aircraftId": 2,
        "cargoId": 46,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "ATGL (Serviced)",
        "weight": 3620,
        "fs": 401,
        "category": "Steward"
      },
      {
        "aircraftId": 2,
        "cargoId": 47,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "LPU-6P Infant Cot",
        "weight": 4,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftId": 2,
        "cargoId": 48,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "A/C Life Preserver",
        "weight": 1.5,
        "fs": -1,
        "category": "Emergency"
      },
      {
        "aircraftId": 2,
        "cargoId": 49,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Protective clothing kit",
        "weight": 36,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftId": 2,
        "cargoId": 50,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "BA-22 Parachute",
        "weight": 28,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftId": 2,
        "cargoId": 51,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "LPU-10P",
        "weight": 4,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftId": 2,
        "cargoId": 52,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "EPOS",
        "weight": 2,
        "fs": -1,
        "category": "Emergency"
      },
      {
        "aircraftId": 2,
        "cargoId": 53,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "PBE",
        "weight": 5,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftId": 2,
        "cargoId": 54,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Survival Vest",
        "weight": 11.5,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftId": 2,
        "cargoId": 55,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Aircrew Body Armor (Level IIIA)",
        "weight": 8.5,
        "fs": 280,
        "category": "Emergency"
      },
      {
        "aircraftId": 2,
        "cargoId": 56,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "60 Hz Backup Converter",
        "weight": 43,
        "fs": 252,
        "category": "Extra"
      },
      {
        "aircraftId": 2,
        "cargoId": 57,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Additional Aeromedical Stations",
        "weight": 66,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftId": 2,
        "cargoId": 58,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Seat Pallets DV (5 Seats/Pallet)",
        "weight": 591,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftId": 2,
        "cargoId": 59,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Seat Pallets DV (10 Seats/pallet)",
        "weight": 767,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftId": 2,
        "cargoId": 60,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Seat Pallets Mass (15 Seats/pallet)",
        "weight": 943,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftId": 2,
        "cargoId": 61,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Flares/Flare Cans (Note 1)",
        "weight": 255,
        "fs": 744,
        "category": "Extra"
      },
      {
        "aircraftId": 2,
        "cargoId": 62,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Flare Hazard Placards (Note 1)",
        "weight": 20,
        "fs": 400,
        "category": "Extra"
      },
      {
        "aircraftId": 2,
        "cargoId": 63,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "Aircraft Armor (Note 1)",
        "weight": 1125,
        "fs": 217,
        "category": "Extra"
      },
      {
        "aircraftId": 2,
        "cargoId": 64,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "SLIP (unoccupied)",
        "weight": 1350,
        "fs": -1,
        "category": "Extra"
      },
      {
        "aircraftId": 2,
        "cargoId": 65,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "SLICC Berthing Capsule",
        "weight": 3790,
        "fs": 580,
        "category": "Extra"
      },
      {
        "aircraftId": 2,
        "cargoId": 66,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "SLICC Conference Capsule",
        "weight": 4660,
        "fs": 685,
        "category": "Extra"
      },
      {
        "aircraftId": 2,
        "cargoId": 67,
        "updated": "2021-03-13T05:05:19.481Z",
        "updatedBy": "unknown",
        "name": "MX TO File",
        "weight": 30,
        "fs": 305,
        "category": "Extra"
      },
      {
        "aircraftId": 2,
        "cargoId": 68,
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
        "aircraftId": 2,
        "tankId": 5,
        "weightsCSV": "250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500, 6750, 7000, 7250, 7500, 7750, 8000, 8250, 8500, 8750, 9000, 9250, 9500, 9750, 10000, 10250, 10500, 10750, 11000, 11250, 11500, 11750, 12000, 12250, 12500, 12750, 13000, 13250, 13500, 13750, 14000, 14250, 14500, 14750, 15000, 15250, 15500, 15750, 16000, 16250, 16500, 16750, 17000, 17250, 17500, 17750, 18000, 18250, 18500, 18750, 19000, 19250, 19500, 19750, 20000, 20250, 20500, 20750, 21000, 21250, 21500, 21750, 22000, 22250, 22500, 22750, 23000, 23250, 23500, 23750, 24000, 24250, 24500, 24750, 25000, 25250, 25500, 25750, 26000, 26250, 26500, 26750, 27000, 27250, 27500, 27750, 28000, 28250, 28500, 28750, 29000, 29250, 29500, 29750, 30000, 30250, 30500, 30750, 31000, 31250, 31500, 31750, 32000, 32250, 32500, 32750, 33000, 33250, 33500, 33750, 34000, 34250, 34500, 34750, 35000, 35250, 35500, 35750, 36000, 36250, 36500, 36750, 37000, 37250, 37500, 37750, 37760",
        "simpleMomsCSV": "28, 56, 84, 112, 140, 168, 196, 222, 248, 274, 300, 326, 353, 379, 405, 430, 456, 482, 508, 534, 559, 585, 610, 636, 661, 687, 712, 738, 763, 789, 814, 839, 864, 889, 915, 940, 965, 990, 1016, 1041, 1066, 1091, 1116, 1141, 1166, 1190, 1215, 1240, 1265, 1290, 1315, 1340, 1365, 1390, 1414, 1439, 1464, 1489, 1514, 1538, 1563, 1588, 1612, 1637, 1662, 1686, 1711, 1736, 1760, 1785, 1810, 1834, 1859, 1883, 1908, 1932, 1957, 1982, 2006, 2031, 2055, 2080, 2104, 2129, 2153, 2178, 2202, 2227, 2251, 2276, 2300, 2325, 2349, 2373, 2398, 2422, 2447, 2471, 2495, 2520, 2544, 2569, 2593, 2617, 2641, 2665, 2689, 2713, 2737, 2761, 2785, 2809, 2833, 2857, 2881, 2905, 2929, 2953, 2977, 3001, 3024, 3048, 3072, 3096, 3119, 3143, 3167, 3191, 3214, 3238, 3262, 3285, 3309, 3332, 3356, 3379, 3403, 3427, 3450, 3474, 3497, 3520, 3543, 3566, 3590, 3613, 3636, 3659, 3682, 3705, 3729, 3730"
      },
      {
        "name": "Tank 2",
        "aircraftId": 2,
        "tankId": 6,
        "weightsCSV": "250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500, 6750, 7000, 7250, 7500, 7750, 8000, 8250, 8500, 8750, 9000, 9250, 9500, 9750, 10000, 10250, 10500, 10750, 11000, 11250, 11500, 11750, 12000, 12250, 12500, 12750, 13000, 13250, 13500, 13750, 14000, 14250, 14500, 14750, 15000, 15250, 15500, 15750, 16000, 16250, 16500, 16750, 17000, 17250, 17500, 17750, 18000, 18250, 18500, 18750, 19000, 19250, 19500, 19750, 20000, 20250, 20500, 20750, 21000, 21250, 21500, 21750, 22000, 22250, 22500, 22750, 23000, 23250, 23500, 23750, 24000, 24250, 24500, 24750, 25000, 25250, 25500, 25750, 26000, 26250, 26500, 26750, 27000, 27250, 27500, 27750, 28000, 28250, 28500, 28750, 29000, 29250, 29500, 29750, 30000, 30250, 30500, 30750, 31000, 31250, 31500, 31750, 32000, 32250, 32500, 32750, 33000, 33250, 33500, 33750, 34000, 34250, 34500, 34750, 35000, 35250, 35500, 35750, 36000, 36250, 36500, 36750, 37000, 37250, 37500, 37750, 38240, 38740, 39240, 39740, 40240, 40740, 41240, 41740, 42240, 42740, 43240, 43740, 44240, 44740, 45240, 45740, 46240, 46740, 47240, 47740, 48240, 48740, 49240, 49740, 50240, 50740, 51240, 51740, 52240, 52640",
        "simpleMomsCSV": "21, 43, 64, 85, 107, 128, 149, 170, 191, 213, 234, 255, 276, 297, 318, 338, 359, 379, 400, 420, 440, 460, 480, 500, 520, 540, 560, 580, 600, 619, 639, 659, 679, 698, 718, 738, 758, 777, 797, 817, 836, 856, 876, 895, 915, 935, 954, 974, 994, 1013, 1033, 1053, 1072, 1092, 1112, 1131, 1151, 1171, 1190, 1210, 1230, 1249, 1269, 1289, 1308, 1328, 1348, 1367, 1387, 1407, 1426, 1446, 1466, 1485, 1505, 1525, 1544, 1564, 1584, 1603, 1623, 1643, 1662, 1682, 1701, 1721, 1740, 1760, 1780, 1799, 1819, 1838, 1858, 1877, 1897, 1916, 1936, 1955, 1975, 1994, 2013, 2033, 2052, 2072, 2095, 2118, 2141, 2164, 2187, 2209, 2232, 2255, 2277, 2300, 2322, 2345, 2367, 2390, 2412, 2435, 2457, 2480, 2502, 2524, 2547, 2569, 2592, 2614, 2636, 2659, 2681, 2703, 2725, 2748, 2770, 2792, 2815, 2837, 2859, 2882, 2904, 2926, 2948, 2971, 2993, 3015, 3038, 3060, 3082, 3104, 3127, 3170, 3215, 3260, 3304, 3349, 3393, 3438, 3483, 3527, 3571, 3615, 3660, 3704, 3748, 3792, 3836, 3880, 3924, 3969, 4013, 4057, 4101, 4144, 4186, 4227, 4268, 4309, 4350, 4391, 4424"
      },
      {
        "name": "Tank 3",
        "aircraftId": 2,
        "tankId": 7,
        "weightsCSV": "250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500, 6750, 7000, 7250, 7500, 7750, 8000, 8250, 8500, 8750, 9000, 9250, 9500, 9750, 10000, 10250, 10500, 10750, 11000, 11250, 11500, 11750, 12000, 12250, 12500, 12750, 13000, 13250, 13500, 13750, 14000, 14250, 14500, 14750, 15000, 15250, 15500, 15750, 16000, 16250, 16500, 16750, 17000, 17250, 17500, 17750, 18000, 18250, 18500, 18750, 19000, 19250, 19500, 19750, 20000, 20250, 20500, 20750, 21000, 21250, 21500, 21750, 22000, 22250, 22500, 22750, 23000, 23250, 23500, 23750, 24000, 24250, 24500, 24750, 25000, 25250, 25500, 25750, 26000, 26250, 26500, 26750, 27000, 27250, 27500, 27750, 28000, 28250, 28500, 28750, 29000, 29250, 29500, 29750, 30000, 30250, 30500, 30750, 31000, 31250, 31500, 31750, 32000, 32250, 32500, 32750, 33000, 33250, 33500, 33750, 34000, 34250, 34500, 34750, 35000, 35250, 35500, 35750, 36000, 36250, 36500, 36750, 37000, 37250, 37500, 37750, 38240, 38740, 39240, 39740, 40240, 40740, 41240, 41740, 42240, 42740, 43240, 43740, 44240, 44740, 45240, 45740, 46240, 46740, 47240, 47740, 48240, 48740, 49240, 49740, 50240, 50740, 51240, 51740, 52240, 52640",
        "simpleMomsCSV": "21, 43, 64, 85, 107, 128, 149, 170, 191, 213, 234, 255, 276, 297, 318, 338, 359, 379, 400, 420, 440, 460, 480, 500, 520, 540, 560, 580, 600, 619, 639, 659, 679, 698, 718, 738, 758, 777, 797, 817, 836, 856, 876, 895, 915, 935, 954, 974, 994, 1013, 1033, 1053, 1072, 1092, 1112, 1131, 1151, 1171, 1190, 1210, 1230, 1249, 1269, 1289, 1308, 1328, 1348, 1367, 1387, 1407, 1426, 1446, 1466, 1485, 1505, 1525, 1544, 1564, 1584, 1603, 1623, 1643, 1662, 1682, 1701, 1721, 1740, 1760, 1780, 1799, 1819, 1838, 1858, 1877, 1897, 1916, 1936, 1955, 1975, 1994, 2013, 2033, 2052, 2072, 2095, 2118, 2141, 2164, 2187, 2209, 2232, 2255, 2277, 2300, 2322, 2345, 2367, 2390, 2412, 2435, 2457, 2480, 2502, 2524, 2547, 2569, 2592, 2614, 2636, 2659, 2681, 2703, 2725, 2748, 2770, 2792, 2815, 2837, 2859, 2882, 2904, 2926, 2948, 2971, 2993, 3015, 3038, 3060, 3082, 3104, 3127, 3170, 3215, 3260, 3304, 3349, 3393, 3438, 3483, 3527, 3571, 3615, 3660, 3704, 3748, 3792, 3836, 3880, 3924, 3969, 4013, 4057, 4101, 4144, 4186, 4227, 4268, 4309, 4350, 4391, 4424"
      },
      {
        "name": "Tank 4",
        "aircraftId": 2,
        "tankId": 8,
        "weightsCSV": "250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500, 6750, 7000, 7250, 7500, 7750, 8000, 8250, 8500, 8750, 9000, 9250, 9500, 9750, 10000, 10250, 10500, 10750, 11000, 11250, 11500, 11750, 12000, 12250, 12500, 12750, 13000, 13250, 13500, 13750, 14000, 14250, 14500, 14750, 15000, 15250, 15500, 15750, 16000, 16250, 16500, 16750, 17000, 17250, 17500, 17750, 18000, 18250, 18500, 18750, 19000, 19250, 19500, 19750, 20000, 20250, 20500, 20750, 21000, 21250, 21500, 21750, 22000, 22250, 22500, 22750, 23000, 23250, 23500, 23750, 24000, 24250, 24500, 24750, 25000, 25250, 25500, 25750, 26000, 26250, 26500, 26750, 27000, 27250, 27500, 27750, 28000, 28250, 28500, 28750, 29000, 29250, 29500, 29750, 30000, 30250, 30500, 30750, 31000, 31250, 31500, 31750, 32000, 32250, 32500, 32750, 33000, 33250, 33500, 33750, 34000, 34250, 34500, 34750, 35000, 35250, 35500, 35750, 36000, 36250, 36500, 36750, 37000, 37250, 37500, 37750, 37760",
        "simpleMomsCSV": "28, 56, 84, 112, 140, 168, 196, 222, 248, 274, 300, 326, 353, 379, 405, 430, 456, 482, 508, 534, 559, 585, 610, 636, 661, 687, 712, 738, 763, 789, 814, 839, 864, 889, 915, 940, 965, 990, 1016, 1041, 1066, 1091, 1116, 1141, 1166, 1190, 1215, 1240, 1265, 1290, 1315, 1340, 1365, 1390, 1414, 1439, 1464, 1489, 1514, 1538, 1563, 1588, 1612, 1637, 1662, 1686, 1711, 1736, 1760, 1785, 1810, 1834, 1859, 1883, 1908, 1932, 1957, 1982, 2006, 2031, 2055, 2080, 2104, 2129, 2153, 2178, 2202, 2227, 2251, 2276, 2300, 2325, 2349, 2373, 2398, 2422, 2447, 2471, 2495, 2520, 2544, 2569, 2593, 2617, 2641, 2665, 2689, 2713, 2737, 2761, 2785, 2809, 2833, 2857, 2881, 2905, 2929, 2953, 2977, 3001, 3024, 3048, 3072, 3096, 3119, 3143, 3167, 3191, 3214, 3238, 3262, 3285, 3309, 3332, 3356, 3379, 3403, 3427, 3450, 3474, 3497, 3520, 3543, 3566, 3590, 3613, 3636, 3659, 3682, 3705, 3729, 3730"
      }
    ],
    "glossarys": [
      {
        "aircraftId": 2,
        "glossaryId": 10,
        "name": "MAC",
        "body": "The distance between the leading and trailing edge of the wing is known as the chord. If the leading edge and trailing edge are parallel, the chord of the wing is constant along the wing’s length. However, because the wings on the C17 are both tapered and swept, the chord changes along the span of the wing. The average length of the chord is known as the mean aerodynamic chord (MAC). The MAC of the C17 is 309.5in 1C-17A-5-2(2-28)"
      },
      {
        "aircraftId": 2,
        "glossaryId": 11,
        "name": "Chart C",
        "body": "The Chart C is a record of the aircraft weight and balance that is continuously updated by a qualified weight and balance technician. Some equipment is provided by the manufacturer during aircraft delivery to the Air Force and is included in the aircraft's basic weight. Further, To standardize equipment and its location, items listed in Addenda A Table 2.1 are included in the basic weight of the aircraft."
      },
      {
        "aircraftId": 2,
        "glossaryId": 12,
        "name": "%MAC",
        "body": "The Percent Mean Aerodynamic Chord identifies where the center or gravity is along the chord of the wing. 0% MAC is located at the LEMAC, and 100% MAC is at the TEMAC(Trailing Edge Mean Aerodynamic Chord). The formula for calculating %MAC is (Balance Arm - LEMAC) / MAC) X 100 1C-17A-5-2(2-28)."
      },
      {
        "aircraftId": 2,
        "glossaryId": 13,
        "name": "Reference Datum",
        "body": "The reference datum is a point located 80.5in forward of the nose of the C17. 1C-17A-5-2(2-28)"
      },
      {
        "aircraftId": 2,
        "glossaryId": 14,
        "name": "Fuselage Station (FS)",
        "body": "An imaginary plane, that runs along the length of the aircraft. It is identified by its distance from the reference datum in inches. FS 0 starts at the reference datum. 1C-17A-5-2(2-28)"
      },
      {
        "aircraftId": 2,
        "glossaryId": 15,
        "name": "Balance Arm",
        "body": "The balance arm is the horizontal distance between the reference datum and the center or gravity. Balance arm = total simplified moment X 10,000 / total weight lb."
      },
      {
        "aircraftId": 2,
        "glossaryId": 16,
        "name": "Addenda A",
        "body": "Configurations with common items, such as sidewall seat life vests, are listed in the Addenda A chapter 3. The weight and moment of these common configurations or their items can be added as cargo into the calculator. For the most accurate calculation, if the item is not accounted for in the Chart C, not listed in Addenda A table 2.1 as equipment that is included in the aircraft basic weight, add its weight and FS into the calculator. https://static.e-publishing.af.mil/production/1/af_a3/publication/afman11-2c-17v3add-a/afman11-2c-17v3add-a.pdf"
      },
      {
        "aircraftId": 2,
        "glossaryId": 17,
        "name": "Moment",
        "body": "The moment of an item is weight in lb multiplied by its arm(distance from the reference datum). Moment is measured in inch-pounds. Moment = Weight in lb x arm. Simplified moment = moment/10000. The moment of fuel is measured in simplified moment and can be found in tables 2-5 or 2-9 for ER jets. The weight and moment of items can be found in AFI 11-2C17V3ADD-A and 1C-17A-5-2"
      },
      {
        "aircraftId": 2,
        "glossaryId": 18,
        "name": "Lemac",
        "body": "The Leading Edge of the Mean Aerodynamic Chord or LEMAC is a measurement of how far the leading edge of the wing is from the reference datum. For swept-wing aircraft, the LEMAC is an average of the distance the leading edge of the wing is from the reference datum. The LEMAC of the C17 is located 793.6in from the reference datum. 1C-17A-5-2(2-28)"
      }
    ],
    "configs": [
      {
        "aircraftId": 2,
        "configId": 20,
        "name": "AE-1",
        "configCargos": [
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 429,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 430,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 431,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 432,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 433,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 434,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 435,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 436,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 437,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 438,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 439,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 440,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 441,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 442,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 443,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 444,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 445,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 446,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 38,
            "configCargoId": 447,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 448,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 449,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 20,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 450,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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
        "aircraftId": 2,
        "configId": 21,
        "name": "AE-2",
        "configCargos": [
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 451,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 452,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 453,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 454,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 455,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 456,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 457,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 458,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 459,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 460,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 461,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 462,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 463,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 46,
            "configCargoId": 464,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 46,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 465,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 466,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 467,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 468,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 469,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 38,
            "configCargoId": 470,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 471,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 472,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 21,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 473,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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
        "aircraftId": 2,
        "configId": 22,
        "name": "AE-3",
        "configCargos": [
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 474,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 475,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 476,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 477,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 478,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 479,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 480,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 481,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 482,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 483,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 484,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 485,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 486,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 487,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 488,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 489,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 490,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 491,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 68,
            "configCargoId": 492,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 68,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Kit, Passenger service",
              "weight": 10,
              "fs": 280,
              "category": "Extra"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 493,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 494,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 22,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 495,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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
        "aircraftId": 2,
        "configId": 23,
        "name": "AEC-1",
        "configCargos": [
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 496,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 497,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 498,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 499,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 500,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 501,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 502,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 503,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 504,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 505,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 506,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 507,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 508,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 46,
            "configCargoId": 509,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 46,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 510,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 511,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 512,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 513,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 514,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 38,
            "configCargoId": 515,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 516,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 517,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 23,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 518,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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
        "aircraftId": 2,
        "configId": 24,
        "name": "C-1",
        "configCargos": [
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 519,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 520,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 521,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 522,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 523,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 524,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 525,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 526,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 527,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 528,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 529,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 530,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 531,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 532,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 533,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 534,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 535,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 536,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 38,
            "configCargoId": 537,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 538,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 539,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 24,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 540,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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
        "aircraftId": 2,
        "configId": 25,
        "name": "C-2",
        "configCargos": [
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 541,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 542,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 543,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 544,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 545,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 546,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 547,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 548,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 549,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 550,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 551,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 552,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 553,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 554,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 555,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 556,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 557,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 558,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 38,
            "configCargoId": 559,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 560,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 561,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 25,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 562,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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
        "aircraftId": 2,
        "configId": 26,
        "name": "C-3",
        "configCargos": [
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 563,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 564,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 565,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 566,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 567,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 568,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 569,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 570,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 571,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 572,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 573,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 574,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 575,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 576,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 577,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 578,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 579,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 580,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 38,
            "configCargoId": 581,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 582,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 583,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 26,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 584,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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
        "aircraftId": 2,
        "configId": 27,
        "name": "P-1",
        "configCargos": [
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 585,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 586,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 587,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 588,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 589,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 590,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 591,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 592,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 593,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 594,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 595,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 596,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 597,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 46,
            "configCargoId": 598,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 46,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 599,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 600,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 601,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 602,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 603,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 38,
            "configCargoId": 604,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 605,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 606,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 27,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 607,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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
        "aircraftId": 2,
        "configId": 28,
        "name": "SP-X",
        "configCargos": [
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 608,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 609,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 610,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 611,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 612,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 613,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 614,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 615,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 616,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 617,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 618,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 619,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 620,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 621,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 622,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 623,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 624,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 625,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 38,
            "configCargoId": 626,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 627,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 628,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 28,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 629,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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
        "aircraftId": 2,
        "configId": 29,
        "name": "CP-X",
        "configCargos": [
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 630,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 631,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 632,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 633,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 634,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 635,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 636,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 637,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 638,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 639,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 640,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 641,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 642,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 643,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 644,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 645,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 646,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 647,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 38,
            "configCargoId": 648,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 649,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 650,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 29,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 651,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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
        "aircraftId": 2,
        "configId": 30,
        "name": "ADP-1",
        "configCargos": [
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 652,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 653,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 654,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 655,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 656,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 657,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 658,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 659,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 660,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 661,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 662,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 663,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 664,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 665,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 666,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 667,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 668,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 669,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 38,
            "configCargoId": 670,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 671,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 672,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 30,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 673,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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
        "aircraftId": 2,
        "configId": 31,
        "name": "ADP-2",
        "configCargos": [
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 674,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 675,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 676,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 677,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 678,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 679,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 680,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 681,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 682,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 683,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 684,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 685,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 686,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 687,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 688,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 689,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 690,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 691,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 38,
            "configCargoId": 692,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 693,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 694,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 31,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 695,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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
        "aircraftId": 2,
        "configId": 32,
        "name": "ADP-3",
        "configCargos": [
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 696,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 697,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 698,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 699,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 700,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 701,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 702,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 703,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 704,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 705,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 706,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 707,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 708,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 46,
            "configCargoId": 709,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 46,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 710,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 711,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 712,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 713,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 714,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 38,
            "configCargoId": 715,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 716,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 717,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 32,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 718,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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
        "aircraftId": 2,
        "configId": 33,
        "name": "ADC-1",
        "configCargos": [
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 719,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 720,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 721,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 722,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 723,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 724,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 725,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 726,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 727,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 728,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 729,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 730,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 731,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 732,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 733,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 734,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 735,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 736,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 38,
            "configCargoId": 737,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 738,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 739,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 33,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 740,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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
        "aircraftId": 2,
        "configId": 34,
        "name": "ADC-2",
        "configCargos": [
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 741,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 742,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 743,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 744,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 745,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 746,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 747,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 748,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 749,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 750,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 751,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 752,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 753,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 754,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 755,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 756,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 757,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 758,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 38,
            "configCargoId": 759,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 760,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 761,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 34,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 762,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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
        "aircraftId": 2,
        "configId": 35,
        "name": "CDS-1",
        "configCargos": [
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 763,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 764,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 765,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 766,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 767,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 768,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 769,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 770,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 771,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 772,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 773,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 774,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 775,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 776,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 777,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 778,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 779,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 780,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 38,
            "configCargoId": 781,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 782,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 783,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 35,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 784,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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
        "aircraftId": 2,
        "configId": 36,
        "name": "DV-1",
        "configCargos": [
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 785,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 786,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 787,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 788,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 789,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 790,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 791,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 792,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 793,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 794,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 795,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 796,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 797,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 46,
            "configCargoId": 798,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 46,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 799,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 800,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 801,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 802,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 803,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 38,
            "configCargoId": 804,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 805,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 806,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 36,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 807,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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
        "aircraftId": 2,
        "configId": 37,
        "name": "SD-1",
        "configCargos": [
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 808,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 809,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 810,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 811,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 812,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 813,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 814,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 815,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 816,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 817,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 818,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 819,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 820,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 46,
            "configCargoId": 821,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 46,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 822,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 823,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 824,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 825,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 826,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 38,
            "configCargoId": 827,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 828,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 829,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 37,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 830,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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
        "aircraftId": 2,
        "configId": 38,
        "name": "SLC-1",
        "configCargos": [
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 62,
            "configCargoId": 831,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 62,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400,
              "category": "Extra"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 61,
            "configCargoId": 832,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 61,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744,
              "category": "Extra"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 63,
            "configCargoId": 833,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 63,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217,
              "category": "Extra"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 67,
            "configCargoId": 834,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 67,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "MX TO File",
              "weight": 30,
              "fs": 305,
              "category": "Extra"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 54,
            "configCargoId": 835,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 54,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 55,
            "configCargoId": 836,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 55,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 50,
            "configCargoId": 837,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 50,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 53,
            "configCargoId": 838,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 53,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "PBE",
              "weight": 5,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 52,
            "configCargoId": 839,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 52,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "EPOS",
              "weight": 2,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 49,
            "configCargoId": 840,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 49,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 48,
            "configCargoId": 841,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 48,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1,
              "category": "Emergency"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 47,
            "configCargoId": 842,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 47,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 51,
            "configCargoId": 843,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 51,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280,
              "category": "Emergency"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 64,
            "configCargoId": 844,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 64,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "SLIP (unoccupied)",
              "weight": 1350,
              "fs": -1,
              "category": "Extra"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 66,
            "configCargoId": 845,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 66,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "SLICC Conference Capsule",
              "weight": 4660,
              "fs": 685,
              "category": "Extra"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 65,
            "configCargoId": 846,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 65,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "SLICC Berthing Capsule",
              "weight": 3790,
              "fs": 580,
              "category": "Extra"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 46,
            "configCargoId": 847,
            "fs": 401,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 46,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "ATGL (Serviced)",
              "weight": 3620,
              "fs": 401,
              "category": "Steward"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 43,
            "configCargoId": 848,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 43,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 42,
            "configCargoId": 849,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 42,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 41,
            "configCargoId": 850,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 41,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1,
              "category": "Steward"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 40,
            "configCargoId": 851,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 40,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 39,
            "configCargoId": 852,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 39,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 38,
            "configCargoId": 853,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 38,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280,
              "category": "Steward"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 37,
            "configCargoId": 854,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 37,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 36,
            "configCargoId": 855,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 36,
              "updated": "2021-03-13T05:05:19.481Z",
              "updatedBy": "unknown",
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260,
              "category": "Steward"
            }
          },
          {
            "configId": 38,
            "aircraftId": 2,
            "cargoId": 35,
            "configCargoId": 856,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftId": 2,
              "cargoId": 35,
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