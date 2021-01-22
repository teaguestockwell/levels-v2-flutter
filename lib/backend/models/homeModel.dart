import 'package:flutter/foundation.dart';
import 'glossary.dart';
import 'moreOp.dart';

///home screen model
class HomeModel{
  final Glossary welcome;
  final MoreOp moreop;
  HomeModel({
    @required this.welcome,
    @required this.moreop
  }) : assert(welcome != null), assert(moreop != null);
}