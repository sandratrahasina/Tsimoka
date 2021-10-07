import 'package:flutter/material.dart';

import 'package:tsimoka/utils/_var.dart';

import 'package:tsimoka/pages/home_screen.dart';
import 'package:tsimoka/pages/peasants_list_screen.dart';
import 'package:tsimoka/pages/peasants_add_form.dart';
import 'package:tsimoka/pages/peasants_add_done.dart';

import 'package:tsimoka/pages/notification_screen.dart';
import 'package:tsimoka/pages/menu.dart';

import 'package:tsimoka/pages/scan_qr_code.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tsimoka',
      theme: ThemeData(
        primarySwatch: myGreen,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/peasantsList': (context) => const PeasantsListScreen(),
        '/peasantsAdd' : (context) => const PeasantsAddScreen(),
        '/peasantsAddDone' : (context) => const PeasantsAddDone(),

        '/notification' : (context) => const NotificationScreen(),
        '/menu' : (context) => const MenuScreen(),

        '/scanQRcode' : (context) =>  QRScanPage(),
      },
    );
  }
}