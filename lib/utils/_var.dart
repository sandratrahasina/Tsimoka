import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

//------------------------------------------------------------------------------------
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;
  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

MaterialColor mainThemeColor =  createMaterialColor(HexColor("#364A5E")); //Blue

MaterialColor myGreen =  createMaterialColor(HexColor("#99B815")); 

MaterialColor myGrey =  createMaterialColor(HexColor("#E6E6E6")); 

MaterialColor myRed =  createMaterialColor(HexColor("#EB202E")); 

//------------------------------------------------------------------------------------
//size atao balise
double maxWidthMobile = 630;
double maxWidthTablet = 1024;

//appBar height
double appBarMobileHeigt = 150;
double appBarTabletHeigt = 300;