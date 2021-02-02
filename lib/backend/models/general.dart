class General{
  final List<int> icondatas;
  final List<String> urls;
  final String title;
  final String body;
  final Role role;
  General.fromJson(Map<String,dynamic> json):
    icondatas = json['icondatas'],
    urls = json['urls'],
    title = json['title'],
    body = json['body'],
    role = json['role'];

  Map<String, dynamic> get json {
    Map<String, dynamic> ret = {};

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

enum Role{
  USER,
  ADMIN,
  DB
}