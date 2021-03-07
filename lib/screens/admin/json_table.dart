import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'const.dart';
import 'util.dart';

class JsonTable extends StatefulWidget {
  final String ep;
  final List<dynamic> jsonList;
  final void Function(Map<String, dynamic>) delete;
  final void Function(Map<String, dynamic>) edit;

  JsonTable({
    @required this.ep,
    @required this.jsonList,
    @required this.delete,
    @required this.edit,
  }) : super(key: UniqueKey());

  @override
  _JsonTableState createState() => _JsonTableState();
}

class _JsonTableState extends State<JsonTable> {
  final sc = ScrollController();
  List<dynamic> tableSearchState;
  List<String> filteredColumns;
  Widget searchBar;

  @override
  void initState() {
    super.initState();

    // initaly search state will contain all entries
    tableSearchState = List<dynamic>.from(this.widget.jsonList);

    setFilteredColumns();
    setSearchBar();
  }

  @override
  void dispose() {
    sc.dispose();
    super.dispose();
  }

  void setSearchBar() {
    searchBar = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        height: 30,
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextField(
          style: dmDisabled,
          onChanged: onSearch,
          decoration: InputDecoration(
            hintText: 'Search ${searchField.capitalize()}',
            border: InputBorder.none,
            icon: Icon(
              IconData(59828, fontFamily: matIcons),
            ),
          ),
        ),
      ),
    );
  }

  void setFilteredColumns() {
    // use the first row to filter
    final Map<String, dynamic> map = this.widget.jsonList[0];

    // dont include key that contain id
    final filter0 = map.keys.where((x) => !x.contains(rmKey));

    // dont include keys that have long values
    final filter1 = filter0.where((x) => map[x].toString().length < 50);

    // keys will be alphabetical
    final filter2 = filter1.toList()..sort();

    // name will be first key
    final filter3 = filter2..removeWhere((x) => x == searchField)..insert(0, searchField);

    // there will be a max of 5 keys
    filteredColumns = filter3.take(5).toList();
  }

  Widget getCell(String body) {
    return Expanded(
        flex: 5,
        child: Container(
            height: 60,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(body, style: dmbody1))));
  }

  Widget getIconButtonCell({
    @required int iconData,
    @required Map<String, dynamic> obj,
    @required Function(Map<String, dynamic>) onPressed,
  }) {
    return Container(
      width: 35,
      height: 35,
      child: IconButton(
        onPressed: () => onPressed(obj),
        icon: Icon(IconData(iconData, fontFamily: matIcons)),
      ),
    );
  }

  void onSearch(String searchText) {
    if (searchText.isEmpty) {
      setState(
          () => tableSearchState = List<dynamic>.from(this.widget.jsonList));
    } else {
      setState(() => tableSearchState = this
          .widget
          .jsonList
          .where(
              (x) => x[searchField].toUpperCase().contains(searchText.toUpperCase()))
          .toList());
    }
  }

  Widget buildTitle() {
    final cells = <Widget>[];

    filteredColumns.forEach((k) {
      // flexible space before each cell
      cells.add(Spacer());

      cells.add(getCell(k.capitalize()));
    });

    // add empty cells to align edit and delete icons
    cells.add(Container(width: 35));
    cells.add(Container(width: 35));

    // flexible at end of row
    cells.add(Spacer());

    return Container(
      height: 58,
      decoration: BoxDecoration(
          color: Color.fromRGBO(233, 233, 233, 1),
          borderRadius: BorderRadius.all(Radius.circular(3))),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: cells),
    );
  }

  Widget getRowAtIndex(int i) {
    final objInRowAsMap = tableSearchState[i] as Map<String, dynamic>;
    final objValues =
        filteredColumns.map((k) => objInRowAsMap[k].toString()).toList();
    final cells = <Widget>[];

    objValues.forEach((k) {
      // flexible space before each cell
      cells.add(Spacer());

      cells.add(getCell(k));
    });

    // delete icon
    cells.add(getIconButtonCell(
        iconData: 59043, obj: objInRowAsMap, onPressed: this.widget.delete));

    // edit icon
    cells.add(getIconButtonCell(
        iconData: 57623, obj: objInRowAsMap, onPressed: this.widget.edit));

    // flexible space at end of row
    cells.add(Spacer());

    return Row(children: cells);
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(padding: EdgeInsets.only(bottom: 20), child: searchBar),
      buildTitle(),
      Flexible(
        child: CupertinoScrollbar(
          thickness: 5,
          controller: sc,
          isAlwaysShown: true,
          child: ListView.separated(
            controller: sc,
            itemCount: tableSearchState.length,
            itemBuilder: (_, i) => getRowAtIndex(i),
            separatorBuilder: (_, x) => Divider(
              thickness: 2,
            ),
          ),
        ),
      )
    ]);
  }
}
