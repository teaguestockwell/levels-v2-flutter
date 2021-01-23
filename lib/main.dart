import 'package:flutter/material.dart';
import 'backend/services.dart';
import 'screens/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home:Home(Services())
    )
  );
}