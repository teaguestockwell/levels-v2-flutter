import 'package:flutter/foundation.dart';

/// used as a model for a more options modal.
/// the name url and icons are all passed to this modal
class MoreOp {
  final List<dynamic> name, url, icon;
  MoreOp({
    @required this.name,
    @required this.url,
    @required this.icon,
  });
}