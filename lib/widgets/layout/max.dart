import 'package:flutter/material.dart';

class Max extends StatelessWidget {
  final double w,h;
  final Widget child;
  Max({
    @required this.child, 
    this.w = double.infinity,
    this.h = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}