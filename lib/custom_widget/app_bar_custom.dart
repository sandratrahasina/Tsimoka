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
      leading: IconMenu( icon : Icons.chevron_left_outlined, iconsize: 40, route : 'return' ),
      actions: const <Widget>[
        IconMenu(icon : Icons.notifications, iconsize: 40, route: '/notification'), //notif
        IconMenu(icon : Icons.sync, iconsize: 40, route: '/refresh'), //refresh
        IconMenu(icon : Icons.more_vert,iconsize: 40, route: '/menu'), //menu
      ],
    );
  }
}

class IconMenu extends StatelessWidget {
  const IconMenu({
    Key? key,
    required this.icon, required this.iconsize, required this.route,
  }) : super(key: key);

  final IconData icon;
  final double iconsize;
  final String route;

  @override
  Widget build(BuildContext context) {
    if(route == 'return'){
      return IconButton(
        onPressed: (){
           Navigator.pop(context);
        }, 
        icon: Icon(icon, size: iconsize, color: Colors.white,),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15)
      );
    }
    else{
      return IconButton(
        onPressed: (){
           Navigator.pushNamed(context, route);
        }, 
        icon: Icon(icon, size: iconsize, color: Colors.white,),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15)
      );
    }    
  }
}