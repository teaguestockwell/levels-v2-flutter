import 'package:five_level_one/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Phoenix(child: Home()));
}