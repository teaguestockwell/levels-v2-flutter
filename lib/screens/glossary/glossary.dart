import '../../widgets/display/rowCenterText.dart';
import '../../widgets/layout/cards/ccard.dart';
import '../../backend/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlossaryScreen extends StatefulWidget {
  final List<Glossary> glossarys;

  GlossaryScreen(this.glossarys): super(key: PageStorageKey(UniqueKey()));
  _GlossaryScreenState createState() => _GlossaryScreenState();
  }

class _GlossaryScreenState extends State<GlossaryScreen> {
  final sc = ScrollController();

  @override
  void dispose() {
    sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
        isAlwaysShown: true,
        controller: sc,
        child: ListView.builder(
            controller: sc, //ony render on screen widgets-recycle viewer
            itemCount: this.widget.glossarys.length,
            itemBuilder: (BuildContext context, int i) {
              return CCard(
                title: this.widget.glossarys[i].title,
                children: [RowCenterText(this.widget.glossarys[i].body)],
                initOpen: true,
            );}));
  }
}
