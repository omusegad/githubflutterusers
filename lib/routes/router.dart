import 'package:flutter/material.dart';
import 'package:hubb/pages/home.dart';
import 'package:hubb/routes/router_const.dart';


class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case HomeRouter:
        return MaterialPageRoute(builder: (context) => Home() );
      default:
        return MaterialPageRoute(builder: (context) => Errorroute() );

    }
  }
  
} 

class Errorroute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child:Text('UNDEFINED ROUTE ')
      )
    );
  }
}