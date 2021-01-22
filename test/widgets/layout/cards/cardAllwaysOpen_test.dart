import 'package:five_level_one/widgets/layout/cards/cardAllwaysOpen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: child);
}

void main() {
  testWidgets('given a card allways open, when drawn, diplay all children',
      (WidgetTester wt) async {
    List<Key> keys = [];
//given
    List<Widget> children = [];

    //populate children and keys
    for (int i = 0; i < 20; i++) {
      final key = UniqueKey();
      keys.add(key);
      children.add(Container(
        height: 500,
        key: key,
      ));
    }
    //because cardaa is non scrollable
    //wrap in scroll container to prenvent overflow in testing
    final test = SingleChildScrollView(child:CardAllwaysOpen(
      children: children,
      color: Colors.cyan,
      title: 'title',
    ));

    final wrapper = makeWidgetTestable(test);

//when
    await wt.pumpWidget(wrapper);

//then
    for (Key key in keys) {
      //expect only one of each child in the tree
      expect(find.byKey(key), findsOneWidget);
    }
  });
}
