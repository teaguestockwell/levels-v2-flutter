import 'package:flutter/material.dart';

import '../../constant.dart';
import '../display/text.dart';
import 'align_padding.dart';

class CardAllwaysOpen extends StatelessWidget {
  /// passed to columns children
  final List<Widget> children;

  /// the color of the title
  final Color color;

  /// the name displayed at the top of the card
  final String name;

  CardAllwaysOpen(
      {@required this.name, @required this.children, @required this.color});

  @override
  Widget build(BuildContext context) {
    return 
        Padding(
            padding:
                EdgeInsets.fromLTRB(cardP, cardP, cardP, 0.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Card(
                    color: cardColor,
                    shape: Border(
                        top: BorderSide(
                      color: cardColor,
                      width: cardTabSize,
                    )),
                    child: Column(
                      children: [
                        AlignPadding(
                            3.0,
                            Alignment.center,
                            Container(
                                height: cardTabSize,
                                child: Center(
                                    child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: Tex(
                                    name,
                                    fontWeight: FontWeight.normal,
                                    color: color,
                                  ),
                                )))),
                        Column(
                          children: children,
                        )
                      ],
                    )))
    );
  }
}
