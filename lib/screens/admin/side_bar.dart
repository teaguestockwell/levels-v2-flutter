import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../services/admin_service.dart';
import '../../util.dart';
import '../../widgets/input/future_dropdown_button.dart';
import 'ep_sheet.dart';

class SideBar extends StatefulWidget {
  @override
  SideBarState createState() => SideBarState();
}

class SideBarState extends State<SideBar> {
  FutureDropDownButton drop;
  int airPKState = 0;
  int menuIdxState = 0;
  int buildCount = 0; // to test rebuilds

  @override
  void initState() {
    super.initState();
    drop = getAirDropDown();
  }

  void panelTapped(int i) => setState(() => menuIdxState = i);

  /// used to callback an rebuild airdropdown so when air is deleted the dropdown is updated
  void rebuild() => setState(() => drop = getAirDropDown());

  void setAirState(Map<String, dynamic> obj) {
    setState(() => airPKState = obj[airPK]);
  }

  String getTitle(int i) => topEPs[i].capitalize() + 's';

  Widget getAirDropDown() => FutureDropDownButton(
        onEmptyMSG: '0 Aircraft',
        future: getN(aircraftS),
        onChange: setAirState,
        apiModelPK: airPK,
      );

  Widget getTile(int i, double pad) {
    if (i == menuIdxState) {
      return ListTile(
          key: Key('sidebar menu item ${i}'),
          title: Padding(
            padding: EdgeInsets.only(left: pad),
            child: Text(getTitle(i), style: dmSelected),
          ),
          onTap: () {
            panelTapped(i);
          });
    }
    return ListTile(
        key: Key('sidebar menu item ${i}'),
        title: Padding(
          padding: EdgeInsets.only(left: pad),
          child: Text(getTitle(i), style: dmDisabled),
        ),
        onTap: () {
          panelTapped(i);
        });
  }

  @override
  Widget build(_) {
    buildCount++;
    return Theme(
      data: ThemeData(),
      child: Scaffold(
        body: Container(
            child: Row(children: [
          Container(
              width: 250,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Material(
                  shadowColor: Colors.black.withOpacity(0.15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15.0),
                        child: Text('All Aircraft', style: dmTitle2),
                      ),
                      getTile(0, 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('Master Settings', style: dmTitle2),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: drop),
                      Flexible(
                          child: ListView.builder(
                        itemCount: topEPs.length - 1,
                        itemBuilder: (_, i) => getTile(i + 1, 15.0),
                      )),
                    ],
                  ))),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: EPSheet(
                apiResErrorMsgKey: apiErrorKey,
                put1: put1,
                delete1: delete1,
                getN: getN,
                rebuildCallback: rebuild,
                airid: airPKState,
                ep: topEPs[menuIdxState],
                title: getTitle(menuIdxState)),
          ))
        ])),
      ),
    );
  }
}
