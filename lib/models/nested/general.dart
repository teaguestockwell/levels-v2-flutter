import 'package:flutter/foundation.dart';

class General{
  final List<String> names ;
  final List<int> icondatas;
  final List<String> urls;
  final int role;
  final String name;
  final String body;

  General.fromJson(Map<String,dynamic> json):
    names = [],
    icondatas = [],
    urls = [],
    name = json['name'],
    body = json['body'],
    role = json['role'] {
      List<dynamic> namesJson = json['names'];
      namesJson.forEach((x) => names.add(x as String));

      List<dynamic> iconDatasJson = json['icondatas'];
      iconDatasJson.forEach((x) => icondatas.add(x as int));

      List<dynamic> urlsJson = json['urls'];
      urlsJson.forEach((x) => urls.add(x as String));
    }

  /// used for popup menus like aircraft selector, and more options menue
  General.forPopupModal({
    @required this.icondatas,
    @required this.names,
    @required this.urls,
  }) :
  role = 1,
  name = '',
  body = '';

  Map<String, dynamic> get json {
    Map<String, dynamic> ret = {};

    var namelist = [];
    names.forEach((x) => namelist.add(x));
    ret['names'] = namelist;

    var icondatalist = [];
    icondatas.forEach((x) => icondatalist.add(x));
    ret['icondatas'] = icondatalist;

    var urlslist = [];
    urls.forEach((x) => urlslist.add(x));
    ret['urls'] = urlslist;

    ret['name'] = name;
    ret['body'] = body;
    ret['role'] = role;
    return ret;
  }
}
