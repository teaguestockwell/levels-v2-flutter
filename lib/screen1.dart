import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      CCards('Distance',DistanceBody()),
    ]);
  }
}