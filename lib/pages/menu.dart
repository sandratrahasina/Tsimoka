import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
                children:[
                  const SizedBox(height: 20,),
                  IconButton( 
                    onPressed: (){ Navigator.pop(context); }, 
                    icon: const Icon(Icons.close_rounded, color: Colors.red, size: 25,)
                  ),
                  const SizedBox(height: 100,),
                  const SingleMenuEto(label: 'Acceuil', route: '/'),
                  const SingleMenuEto(label: 'Notification', route: '/notification'),
                  const SingleMenuEto(label: 'Se deconnecter', route: '/'),
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
      onTap: () async {
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                final int counter = (prefs.getInt('counter') ?? 0) + 1;
                var _counter = prefs.setInt("counter", counter).then((bool success) {
                  return counter;
                });
                _counter.then((value) {
                  print(value);
                });
        Navigator.popAndPushNamed(context, route );
      },
    );
  }
}