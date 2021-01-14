import '../../widgets/display/text.dart';
import '../../utils.dart';
import 'package:flutter/material.dart';

class LeadingMDS extends StatelessWidget {
  final String text;
  final IntCallBack onPressed;

  LeadingMDS({@required this.text, @required this.onPressed})
      : assert(text != null),
        assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8),
        child: Row(children: [
          IconButton(icon: Icon(Icons.flight), onPressed: onPressed),
          Expanded(child: Tex(text)),
        ]));
  }
}
