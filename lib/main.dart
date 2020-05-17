import 'package:flutter/material.dart';
import 'package:hubb/pages/home.dart';
import 'package:hubb/routes/router.dart';
import 'package:hubb/routes/router_const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:HomeRouter,
      onGenerateRoute: Router.generateRoute,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

