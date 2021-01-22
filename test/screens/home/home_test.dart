import 'package:five_level_one/backend/models/aircraft.dart';
import 'package:five_level_one/backend/models/glossary.dart';
import 'package:five_level_one/backend/models/homeModel.dart';
import 'package:five_level_one/backend/models/moreOp.dart';
import 'package:five_level_one/screens/home/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:five_level_one/backend/services.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';

Widget mk(Widget child){
  return MaterialApp(home:child);
}

//are you mocking me?
class ServicesMock extends Mock implements Services{}
class AircraftMock extends Mock implements Aircraft{}
class HomeModelMock extends Mock implements HomeModel{}
class MoreOpMock extends Mock implements MoreOp{}
class GlossMock extends Mock implements Glossary{}

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

  when(sm.getHomeModel()).thenAnswer((_) async{

    await Future.delayed(Duration(seconds: secToResponse));

    final mo = MoreOpMock();
    when(mo.icon).thenReturn([' ',' ']);
    when(mo.name).thenReturn([' ', ' ']);
    when(mo.url).thenReturn([' ', ' ']);

    final gloss = GlossMock();
    when(gloss.body).thenReturn('body');
    when(gloss.title).thenReturn('title');

    final ret = HomeModelMock();
    when(ret.moreop).thenReturn(mo);
    when(ret.welcome).thenReturn(gloss);

    return ret;
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