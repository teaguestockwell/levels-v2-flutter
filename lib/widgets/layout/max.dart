import 'package:five_level_one/backend/cont.dart';
import 'package:flutter/material.dart';

class Max extends StatelessWidget {
  final Widget child;
  Max({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Spacer(),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: Const.maxCardWidth),
          child: child
        ),
        Spacer()
      ],
    );
  }
}
