import 'package:flutter/material.dart';

class MenuTabs extends StatefulWidget {
  
  @override
  _MenuTabsState createState() => _MenuTabsState();
}

class _MenuTabsState extends State<MenuTabs>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 8);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
          bottom: TabBar(
        controller: controller,
        isScrollable: true,
        tabs: <Widget>[
          Text('Home'),
          Text('About'),
          Text('Services'),
          Text('Bills'),
          Text('Phones'),
          Text('Money'),
          Text('Car'),
          Text('Bikes'),
        ],
      )),
      body: SafeArea(
          child: TabBarView(
            controller: controller,
              children: [
                  Text('Home'),
                  Text('About'),
                  Text('Services'),
                  Text('Bills'),
                  Text('Phones'),
                  Text('Money'),
                  Text('Car'),
                  Text('Bikes'),
                
                ])),
    );
  }
}

