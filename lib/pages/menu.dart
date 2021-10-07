import 'package:flutter/material.dart';
import 'package:tsimoka/utils/_var.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MainFrame()
      )
    );
  }
}

//back-ground
//---------------------------------------------------------------------------------------
class MainFrame extends StatelessWidget {
  const MainFrame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainThemeColor,
      alignment: Alignment.center,
      child: SizedBox(
        height: 450,
        child: Center(
          child: Drawer(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: ListView(
                children: [
                  SizedBox(height: 20,),
                  IconButton( 
                    onPressed: (){ Navigator.pop(context); }, 
                    icon: Icon(Icons.close_rounded, color: Colors.red, size: 25,)
                  ),
                  SizedBox(height: 100,),
                  SingleMenuEto(label: 'Acceuil', route: '/'),
                  SingleMenuEto(label: 'Notification', route: '/notification'),
                  SingleMenuEto(label: 'Se deconnecter', route: '/'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SingleMenuEto extends StatelessWidget {
  const SingleMenuEto({
    Key? key, required this.label, required this.route,
  }) : super(key: key);

  final String label;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label, style: TextStyle(color: mainThemeColor, fontSize: 30), textAlign: TextAlign.center,),
      onTap: () {
        // Update the state of the app
        // ...
        // Then close the drawer
        Navigator.popAndPushNamed(context, route );
      },
    );
  }
}