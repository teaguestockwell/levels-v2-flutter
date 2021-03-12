import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import '../../constant.dart';
import '../../models/shallow/serializable.dart';
import '../../widgets/input/black_button_admin.dart';
import 'json_table.dart';

class EPSheet extends StatefulWidget {
  final String ep;
  final int airid;
  final String title;
  final void Function() rebuildCallback;
  final Future<List<dynamic>> Function(String,{Map<String,String> reqParam}) getN;
  final Future<Response> Function(String,Map<String,dynamic>) put1;
  final String apiResErrorMsgKey;
  final Future<Response> Function(String,Map<String, dynamic>) delete1;
  EPSheet({
    @required this.ep,
    @required this.title,
    @required this.airid,
    @required this.rebuildCallback,
    @required this.getN,
    @required this.put1,
    @required this.apiResErrorMsgKey,
    @required this.delete1
  }) : super(key: UniqueKey());
  @override
  EPSheetState createState() => EPSheetState();
}

class EPSheetState extends State<EPSheet> {
  String epState;
  String titleState;
  Map<String, String> reqParamState;
  Map<String, dynamic> objState;
  int configIDState;
  bool isPuttingState;
  bool isNestedState;

  @override
  void initState() {
    super.initState();
    isPuttingState = false;
    isNestedState = false;
    epState = this.widget.ep;
    titleState = this.widget.title;
    reqParamState = {topLvlEPPK: this.widget.airid.toString()};
  }

  /// create is a wrapper arund update that sets the model
  /// to its initState before updating
  void create() {
    // pass state of config to model
    final baseMap = <String, dynamic>{topLvlEPPK: this.widget.airid};
    if (epState == configCargosS) {
      baseMap[configCargoPK] = configIDState;
    }

    // map => model => map to set initState
    update(getAPISerializableOfEP(ep: epState, obj: baseMap, put: (_) {})
        .toJson());
  }

  void put(Map<String, dynamic> obj) async {
    final res = await this.widget.put1(epState, obj);
    if (res.statusCode == 200) {
      setState(() => isPuttingState = false);
      showMsg('Saved');
      if (obj.containsKey(airPK)) {
        this.widget.rebuildCallback();
      }
    } else {
      showMsg(jsonDecode(res.body)[this.widget.apiResErrorMsgKey]);
    }
  }

  void delete(Map<String, dynamic> obj) async {
    final res = await this.widget.delete1(epState, obj);
    if (res.statusCode == 200) {
      setState(() {});
      showMsg('Deleted');
    } else {
      showMsg(jsonDecode(res.body)[this.widget.apiResErrorMsgKey]);
    }
    if (obj.containsKey(airPK)) {
      this.widget.rebuildCallback();
    }
  }

  void goBack() {
    if (!isPuttingState) {
      setState(() {
        epState = this.widget.ep;
        titleState = this.widget.title;
        reqParamState = {topLvlEPPK: this.widget.airid.toString()};
        isNestedState = false;
      });
    } else {
      setState(() {
        isPuttingState = false;
      });
    }
  }

  /// Wrapper around isPutting state to determine
  /// if a pencil click should edit an obj, or nest deeper
  /// if its a config
  void update(Map<String, dynamic> obj) async {
    objState = obj;

    if (obj.containsKey(configFK)) {
      setState(() {
        configIDState = obj[configCargoPK];
        epState = configCargosS;
        titleState = obj[searchField] + ' Cargos';
        reqParamState = {configCargoPK: '${obj[configCargoPK]}'};
        isNestedState = true;
      });
    } else {
      setState(() {
        isPuttingState = true;
      });
    }
  }

  Widget getForm() {
    return getAPISerializableOfEP(ep: epState, obj: objState, put: put)
      .getForm();
  }

  List<Widget> getTitle() {
    const w = 150.0;
    const h = 40.0;
    final empty = Container(width: 150.0, height: 40.0);

    final backButton = Container(
      width: w,
      height: h,
      child: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          onPressed: goBack,
          iconSize: 40.0,
          icon: Icon(
            IconData(
              61563,
              fontFamily: matIcons
            )
          )
        ),
      )
    );

    final addButton =  Container(
      width: w,
      height: h,
      child: BlackButtonAdmin(
        create,
        text: 'New ${titleState.substring(0, titleState.length - 1)}'
      )
    );

    // modify title to singular && show back button
    if (isPuttingState) {
      return [
        backButton,
        Spacer(),
        Text(
          'Edit ${titleState.substring(0, titleState.length - 1)}',
          style: dmTitle1
        ),
        Spacer(),
        empty
      ];
    }

    // show back button
    else if(isNestedState){
      return [
        backButton,
        Spacer(),
        Text(titleState, style: dmTitle1),
        Spacer(),
        addButton
      ];
    }

    // do not show back button
    else{
      return [
        empty,
        Spacer(),
        Text(titleState, style: dmTitle1),
        Spacer(),
        addButton
      ];
    }
  }

  void showMsg(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 4,
        backgroundColor: Color.fromRGBO(233, 233, 233, 1),
        content: Container(
          height: 200,
          child: Center(
            child: Text(error ?? 'Error', style: dmbody1)
          )
        )
      )
    );
  }

  Widget getOn200(List<dynamic> jsonList) {
    return Column(
      key: Key('json'),
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              children: getTitle()
            )
        ),
        Flexible(
          child: JsonTable(
            jsonList: jsonList,
            ep: epState,
            onDelete: delete,
            onEdit: put
          ),
        )
      ]
    );
  }

  Widget getOn200IsPutting() {
    return Column(
      key: Key('putting'),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Row(
            children: getTitle()
          )
        ),
        Flexible(
          child: getForm()
        )
      ]
    );
  }

  Widget getOnLoading() {
    return Column(
      key: Key('loading'),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(titleState, style: dmTitle1)
          ),
        ),
        CircularProgressIndicator(),
      ],
    );
  }

  Widget getOn200Empty() {
    return Column(
      key: Key('empty'),
      children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Row(
          children: getTitle()
        )
      ),
      Center(
        child: Text('No ${titleState} on this Aircraft. Add the first one. ',
        style: dmTitle1
        )
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        key: UniqueKey(),
        future: this.widget.getN(epState, reqParam: reqParamState),
        builder: (_, sh) {
          final res = sh.data;
          if (res == null) {
            return getOnLoading();
          } else if (isPuttingState) {
            return getOn200IsPutting();
          } else if (res.length == 0) {
            return getOn200Empty();
          } else {
            return getOn200(sh.data);
          }
        });
  }
}
