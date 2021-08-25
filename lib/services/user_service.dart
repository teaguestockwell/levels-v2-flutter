import 'package:http/http.dart';
import '../constant.dart';
import '../models/nested/aircraft.dart';
import '../models/nested/general.dart';
import 'isolate.dart';

class UserService{

Future<General> getGeneral() async {

  return General.fromJson({
    'role': 6,
    'name': 'App Dev',
    'names': ['Help/Contact', 'About Developer'],
    'body': 'Please be reminded that this app is intended for reference, and education purposes only. While careful consideration has been taken creating this app, we do not warrant, represent or guarantee that the material published on this app, as well as the calculations made, are in all respects accurate, complete or current. To the extent permitted by law, we exclude any liability, including any liability for negligence,  for loss, damage, or bodily injury arising from the reliance on material and calculations made in this application. It is your sole responsibility to make sure all proper measures are taken to ensure safety.',
    'iconDatas': [59478, 57360], // flutter material icon data
    'urls': [
      'https://forms.gle/Bbqvubn6gwC6fRnc8',
      'https://teaguestockwell.com',
    ],
  });
}

Future<List<Aircraft>> getAirs() async {
  final res =  await get(baseurl + 'aircraft/deep');
  final jsonMap = await decodeJsonIsolate<Map<String,dynamic>>(res.body);
  final List<dynamic> airList = jsonMap['aircrafts'];
  return airList.map((air){
    try{
      return Aircraft.fromJson(air as Map<String,dynamic>);
    // ignore: avoid_catches_without_on_clauses
    }catch(e){}
  }).toList();
  }
}