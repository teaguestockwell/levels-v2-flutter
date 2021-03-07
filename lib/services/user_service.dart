import 'package:http/http.dart';
import '../constant.dart';
import '../models/nested/aircraft.dart';
import '../models/nested/general.dart';
import 'isolate.dart';

class UserService{

Future<General> getGeneral() async {
  final res =  await get(baseurl + 'general');
  return General.fromJson(
    await decodeJsonIsolate<Map<String,dynamic>>(res.body)
  );
}

Future<List<Aircraft>> getAirs() async {
  final res =  await get(baseurl + 'aircraft');
  final jsonMap = await decodeJsonIsolate<List<dynamic>>(res.body);
  return jsonMap.map((air){
    try{
      return Aircraft.fromJson(air as Map<String,dynamic>);
    // ignore: avoid_catches_without_on_clauses
    }catch(e){}
  }).toList();
  }
}