import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:tsimoka/utils/_var.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {

  const CustomHomeAppBar({
    Key? key,
  }) : super(key: key);

  double getPreferedHeigtSize(){
    //var s = MediaQuery.of(context).size.width;
    return appBarTabletHeigt;
  }

  @override
  Widget build(BuildContext context) {

    return AppBar(
      leading: Icon(Icons.chevron_left_outlined, size: 40, color: Colors.transparent, ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      flexibleSpace: Container(
        child: Stack(
          children: <Widget>[
            //ilay contenant bleu
            CustomAppBarContainer(theme: mainThemeColor, sizeHeight: getPreferedHeigtSize(),),
            //ilay tena appbar
            CustomAppBar(theme: mainThemeColor )
          ]
        )
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(getPreferedHeigtSize());

}

//---------------------------------------------------------------------------------------
class CustomAppBarContainer extends StatelessWidget {
  const CustomAppBarContainer({
    Key? key,
    required this.theme,
    required this.sizeHeight,
  }) : super(key: key);

  final MaterialColor theme;
  final double sizeHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        color: theme,
        boxShadow: [ BoxShadow(color: theme, spreadRadius: 1), ],
      ),
    );
    
  }
}

//---------------------------------------------------------------------------------------
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final MaterialColor theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60, 
      color : theme,
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Align(alignment: Alignment.centerLeft, child: InfoPers()),
          ),
          Expanded(
            flex:2,
            child: Align( alignment: Alignment.centerRight, child: menuCombo(), )
          )
        ],
      )
    );
  }
}

//---------------------------------------------------------------------------------------
class InfoPers extends StatelessWidget {
  const InfoPers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sary = Container(
      width: 50.0, height: 50.0,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage("https://i.imgur.com/BoN9kdC.png")
          )
      )
    );

    var soratra = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Name FirstName', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
          Text('Profession, Local Post', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),),
        ],
      ),
    );

    return LayoutBuilder(
      builder: (context,constraints){
        if(MediaQuery.of(context).size.width <= 374){
          return Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(alignment: Alignment.centerLeft, child: sary)
              ],
            ),
          );
        }
        else if(MediaQuery.of(context).size.width <= maxWidthMobile){//mobile
          return Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(alignment: Alignment.centerLeft, child: soratra)
              ],
            ),
          );
        }
        else{ //tablet et plus
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: sary), 
                Expanded(flex: 4, child: soratra)
              ],
            ),
          );
        }
      }
    );

    
  }
}

//---------------------------------------------------------------------------------------
class menuCombo extends StatelessWidget {
  const menuCombo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        if(MediaQuery.of(context).size.width <= maxWidthMobile){//mobile
          return IconMenu(icon : Icons.menu, iconsize: 40, route: '/menu');
        }
        else {//tablet
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              IconMenu(icon : Icons.notifications, iconsize: 40, route: '/notification'), //notif
              IconMenu(icon : Icons.sync, iconsize: 40, route: '/refresh'), //refresh
              IconMenu(icon : Icons.more_vert,iconsize: 40, route: '/menu'), //menu
            ],
          );
        }
      }
    );
  }
}

//---------------------------------------------------------------------------------------
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