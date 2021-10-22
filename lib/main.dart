import 'package:flutter/material.dart';

import 'package:tsimoka/utils/_var.dart';

import 'package:tsimoka/pages/home_screen.dart';
import 'package:tsimoka/pages/peasants_list_screen.dart';
import 'package:tsimoka/pages/peasants_add_form.dart';
import 'package:tsimoka/pages/peasants_add_done.dart';

import 'package:tsimoka/pages/notification_screen.dart';
import 'package:tsimoka/pages/menu.dart';

import 'package:tsimoka/pages/sing_in.dart';

import 'package:tsimoka/pages/scan_qr_code.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    late Future<int> _counter;

    Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    _counter = prefs.setInt("counter", counter).then((bool success) {
      return counter;
    });
  }

    return MaterialApp(
      title: 'Tsimoka',
      theme: ThemeData(
        primarySwatch: myGreen,
      ),
      initialRoute: '/signin',
      routes: {
        '/signin' : (context) => SingInScreen(),
        '/': (context) => const HomeScreen(),
        '/peasantsList': (context) => const PeasantsListScreen(),
        '/peasantsAdd' : (context) => const PeasantsAddScreen(),
        //'/peasantsAdd/addPic' : (context) => const ImageTakerMenu(),
        '/peasantsAddDone' : (context) => const PeasantsAddDone(),

        '/notification' : (context) => const NotificationScreen(),
        '/menu' : (context) => const MenuScreen(),

        '/scanQRcode' : (context) =>  QRScanPage(),

        
      },
    );
  }
}