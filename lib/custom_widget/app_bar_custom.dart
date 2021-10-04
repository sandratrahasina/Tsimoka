import 'package:flutter/material.dart';

import 'package:tsimoka/utils/_var.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    Key? key,
  }) : super(key: key);

  double getPreferedHeigtSize(){
    return appBarTabletHeigt;
  }

  @override
  Size get preferredSize => Size.fromHeight(70);

  @override
  Widget build(BuildContext context){
    return AppBar(
      backgroundColor : mainThemeColor,
      actions: const <Widget>[
        IconMenu(icon : Icons.notifications,iconsize: 40,), //notif
        IconMenu(icon : Icons.sync,iconsize: 40,), //refresh
        IconMenu(icon : Icons.more_vert,iconsize: 40,), //menu
      ],
    );
  }
}

class IconMenu extends StatelessWidget {
  const IconMenu({
    Key? key,
    required this.icon, required this.iconsize,
  }) : super(key: key);

  final IconData icon;
  final double iconsize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){}, 
        icon: Icon(icon, size: iconsize, color: Colors.white,),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15)
      );
  }
}