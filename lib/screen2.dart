
import 'services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: CustomButton("copy Doc", onPressed: ()=> {DatabaseService().copyDoc()},)
    );
  }
}