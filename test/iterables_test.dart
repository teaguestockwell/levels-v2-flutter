import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
void main(){
  test(
    'given a map that contains a false vale, when iterated though the new way, it will return false',
    (){
      //given
        final r = Random();
        final m = <int,bool>{};
        for(int i=0;i<100;i++){m[i] = r.nextBool();}

      //when

      //are all the values true?
      final ret = !m.values.contains(false);

      //then 
      expect(ret,false);
    });

    test(
    'given a map that contains a false vale, when iterated though the old way, it will return false',
    (){
      //given
        final r = Random();
        final m = <int,bool>{};
        for(int i=0;i<100;i++){m[i] = r.nextBool();}

      //when

      //are all the values true?
      var ret = true;
      m.forEach((_,v) {if(!v) {ret = false;} });

      //then 
      expect(ret,false);
    });
}