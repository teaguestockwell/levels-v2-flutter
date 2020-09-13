import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets.dart';
import 'services.dart';
import 'model.dart';

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Glossary>>.value(
    value: DatabaseService().glossary,
    child: GlossaryList());
  }
}
