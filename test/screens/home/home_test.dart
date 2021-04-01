import 'package:five_level_one/models/nested/aircraft.dart';
import 'package:five_level_one/models/nested/general.dart';
import 'package:five_level_one/models/nested/glossary.dart';
import 'package:five_level_one/screens/home/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:five_level_one/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';

Widget mk(Widget child){
  return MaterialApp(home:child);
}

//are you mocking me?
class ServicesMock extends Mock implements UserService{}
class AircraftMock extends Mock implements Aircraft{}
class GlossMock extends Mock implements Glossary{}
class GeneralMock extends Mock implements General{}

ServicesMock getServiceMocks(int secToResponse){
  final sm = ServicesMock();

  when(sm.getAirs()).thenAnswer((_) async {
    List<AircraftMock> ret = [];

    //can you hear me now?
    await Future.delayed(Duration(seconds: secToResponse));

    //thats alot of planes...
    for(int i=0; 1<50; i++){
      final a =AircraftMock();
      when(a.name).thenReturn(i.toString());
      ret.add(a);
    }

    return ret;
  });

  when(sm.getGeneral()).thenAnswer((_) async{

    await Future.delayed(Duration(seconds: secToResponse));

    final gen = GeneralMock();
    when(gen.body).thenReturn('body');
    when(gen.name).thenReturn('title');
    when(gen.role).thenReturn(1);
    when(gen.iconDatas).thenReturn([123,123]);
    when(gen.names).thenReturn(['one','two']);
    when(gen.urls).thenReturn(['url1','url2']);

    return gen;
  });
  
  return sm;
}

void main(){
  testWidgets(
    'given a home, when built, then it will initialy build a loading screen',
    (WidgetTester wt) async {

      //given
      final test = mk(Home(getServiceMocks(10)));

      //when
      await wt.pumpWidget(test);

      //then
      expect(find.byKey(Key('loading')), findsOneWidget);
    });
}