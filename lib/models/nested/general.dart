import 'package:flutter/foundation.dart';

class General{
  final List<String> names ;
  final List<int> iconDatas;
  final List<String> urls;
  final int role;
  final String name;
  final String body;

  General.fromJson(Map<String,dynamic> json):
    names = [],
    iconDatas = [],
    urls = [],
    name = json['name'],
    body = json['body'],
    role = json['role'] {
      List<dynamic> namesJson = json['names'];
      namesJson.forEach((x) => names.add(x as String));

      List<dynamic> iconDatasJson = json['iconDatas'];
      iconDatasJson.forEach((x) => iconDatas.add(x as int));

      List<dynamic> urlsJson = json['urls'];
      urlsJson.forEach((x) => urls.add(x as String));
    }

  /// used for popup menus like aircraft selector, and more options menue
  General.forPopupModal({
    @required this.iconDatas,
    @required this.names,
    @required this.urls,
  }) :
  role = 1,
  name = '',
  body = '';
}
