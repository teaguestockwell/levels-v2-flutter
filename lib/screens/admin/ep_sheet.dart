import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../constant.dart';
import '../../models/shallow/serializable.dart';
import '../../services/admin_service.dart';
import '../../widgets/input/black_button_admin.dart';
import 'json_table.dart';

class EPSheet extends StatefulWidget {
  final void Function() rebuildCallback;
  final String ep;
  final Map<String, String> reqParam;
  final String title;
  final int airid;
  EPSheet(
      {@required this.ep,
      @required this.reqParam,
      @required this.title,
      @required this.airid,
      @required this.rebuildCallback})
      : super(key: UniqueKey());
  @override
  _EPSheetState createState() => _EPSheetState();
}

class _EPSheetState extends State<EPSheet> {
  String epState;
  String titleState;
  Map<String, String> reqParamState;
  var isNested = false;
  bool isPutting = false;
  Map<String, dynamic> editObj;
  int configIDState;

  @override
  void initState() {
    super.initState();
    epState = this.widget.ep;
    titleState = this.widget.title;
    reqParamState = this.widget.reqParam;
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
      update(
        getAPISerializableOfEP(
          ep: epState,
          obj: baseMap,
          put: (_){}
        ).toJson()
      );
  }

  void put(Map<String, dynamic> obj) async {
    final res = await put1(epState, obj);
    if (res.statusCode == 200) {
      setState(() {
        isPutting = false;
      });
      showMsg('Saved');
      if (obj.containsKey(airPK)) {
        this.widget.rebuildCallback();
      }
    } else {
      showMsg(jsonDecode(res.body)['msg']);
    }
  }

  void delete(Map<String, dynamic> obj) async {
    final res = await delete1(epState, obj);
    if (res.statusCode == 200) {
      setState(() {});
      showMsg('Deleted');
    } else {
      showMsg(jsonDecode(res.body)['msg']);
    }
    if (obj.containsKey(airPK)) {
      this.widget.rebuildCallback();
    }
  }

  void goBack() {
    if (!isPutting) {
      setState(() {
        epState = this.widget.ep;
        titleState = this.widget.title;
        reqParamState = this.widget.reqParam;
        isNested = false;
      });
    } else {
      setState(() {
        isPutting = false;
      });
    }
  }

  /// Wrapper around isPutting state to determine
  /// if a pencil click should edit an obj, or nest deeper
  /// if its a config
  void update(Map<String, dynamic> obj) async {
    editObj = obj;

    if (obj.containsKey(configFK)) {
      setState(() {
        configIDState = obj[configCargoPK];
        epState = configCargosS;
        titleState = obj[searchField] + ' Cargos';
        reqParamState = {configCargoPK: '${obj[configCargoPK]}'};
        isNested = true;
      });
    } else {
      setState(() {
        isPutting = true;
      });
    }
  }

  Widget getForm() {
    return getAPISerializableOfEP(
      ep: epState,
      obj: editObj,
      put: put
    ).getForm();
  }

  List<Widget> getTitle() {
    final w = 150.0;
    final h = 40.0;
    final empty = Container(width: w, height: h);

    final backButton = Container(
        width: w,
        height: h,
        child: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                iconSize: 40.0,
                icon: Icon(IconData(61563, fontFamily: matIcons)),
                onPressed: goBack)));

    final addButton = Container(
        width: w,
        height: h,
        child: BlackButtonAdmin(create,
            text: 'New ${titleState.substring(0, titleState.length - 1)}'));

    // show back button?
    if (isNested || isPutting) {
      // modify title to singular?
      if (isPutting) {
        return [
          backButton,
          Spacer(),
          Text('Edit ${titleState.substring(0, titleState.length - 1)}',
              style: dmTitle1),
          Spacer(),
          empty
        ];
      }
      return [
        backButton,
        Spacer(),
        Text(titleState, style: dmTitle1),
        Spacer(),
        addButton
      ];
    }
    return [
      empty,
      Spacer(),
      Text(titleState, style: dmTitle1),
      Spacer(),
      addButton
    ];
  }

  void showMsg(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 4,
        backgroundColor: Color.fromRGBO(233, 233, 233, 1),
        content: Container(
            height: 200, child: Center(child: Text(error, style: dmbody1)))));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        key: UniqueKey(),
        future: getN(epState, reqParam: reqParamState),
        builder: (context, sh) {
          if (sh.data != null) {
            if (sh.data.length != 0) {
              if (!isPutting) {
                List<dynamic> jsonList = sh.data;
                return Column(children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Row(children: getTitle())),
                  Flexible(
                    child: JsonTable(
                        jsonList: jsonList,
                        ep: epState,
                        delete: delete,
                        edit: update),
                  )
                ]);
              } else {
                return Column(children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Row(children: getTitle())),
                  Flexible(child: getForm())
                ]);
              }
            }
            if (isPutting) {
              return Column(children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Row(children: getTitle())),
                Flexible(child: getForm())
              ]);
            }
            return Column(children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(children: getTitle())),
              Center(
                  child: Text(
                      'No ${titleState} on this Aircraft. Add the first one. ',
                      style: dmTitle1))
            ]);
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(titleState, style: dmTitle1)),
                ),
                CircularProgressIndicator(),
              ],
            );
          }
        });
  }
}
