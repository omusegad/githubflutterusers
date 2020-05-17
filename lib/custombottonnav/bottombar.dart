import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFF15161E),
      elevation: 5.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
       mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
        children: <Widget>[
         IconButton(icon: Icon(Icons.menu, color: Color(0xFF3a4a69), size:30.0), onPressed: null,),
         IconButton( icon: Icon(Icons.account_box,color: Color(0xFF3a4a69), size:30.0), onPressed: null,),
         IconButton( icon: FaIcon(FontAwesomeIcons.accessibleIcon, color: Color(0xFF3a4a69), size:30.0), onPressed: null,),
         IconButton( icon: FaIcon(FontAwesomeIcons.accessibleIcon, color: Color(0xFF3a4a69), size:30.0), onPressed: null,)
      ],),
       
      );
  }
}

