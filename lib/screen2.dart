import 'package:five_level_one/home.dart';
import 'package:five_level_one/model.dart';
import 'package:five_level_one/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  Aircraft air;
  Screen2(this.air);
  @override
  Widget build(BuildContext context) {
    return PerMacScreen(air);
  }
}
