import 'package:flutter/foundation.dart';

enum Role{
  User,
  Admin,
  Db
}
class General{
  final Role role;
  final List<int> icondatas;
  final List<String> names;
  final List<String> urls;
  final String title;
  final String body;

  General.fromJson(Map<String,dynamic> json):
    names = json['names'],
    icondatas = json['icondatas'],
    urls = json['urls'],
    title = json['title'],
    body = json['body'],
    role = json['role'];

  /// used for popup menus like aircraft selector, and more options menue
  General.forPopupModal({
    @required this.icondatas,
    @required this.names,
    @required this.urls,
  }) :
  role = Role.User,
  title = '',
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

    ret['title'] = title;
    ret['body'] = body;
    ret['role'] = role;
    return ret;
  }
}
