import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tsimoka/utils/_var.dart';
import 'package:tsimoka/custom_widget/home_app_bar_custom.dart';
import 'package:tsimoka/custom_widget/home_card_menu.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
    return LayoutBuilder(
      builder: (context,constraints){
        print(constraints);
        if(constraints.maxWidth <= maxWidthMobile){//mobile
          return Stack(
            children: [
              const CustomHomeAppBar(),
              Container(
                child: MenuCardContainerHome(),
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              )
            ],
          );
        }
        else if(constraints.maxWidth <= 1024){//tablet
          return Stack(
            children: [
              const CustomHomeAppBar(),
              Container(
                child: MenuCardContainerHome(),
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              )
            ],
          );
        }
        else{//tablet
          return Center(
            child: Container(
              width: 1024,
              child: Stack(
                children: [
                  const CustomHomeAppBar(),
                  Container(
                    child: MenuCardContainerHome(),
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  )
                ],
              ),
            ),
          );
        }
      }
    );
  }
}


class MenuCardContainerHome extends StatelessWidget {
  const MenuCardContainerHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).size.width <= maxWidthMobile){//mobile
      return Intermediaire(sWidth: 300, cac: 1, crossSpacing: 20, mainSpacing: 20 ,);
    }
    else if(MediaQuery.of(context).size.width <= 1024){//tablet
      return Intermediaire(sWidth: 600, cac: 2, crossSpacing: 80, mainSpacing: 80 ,);
    }
    else{//tablet
      return Intermediaire(sWidth: 700, cac: 2, crossSpacing: 90, mainSpacing: 90 ,);
    }
  }
}

class Intermediaire extends StatelessWidget {
  const Intermediaire({
    Key? key, required this.sWidth, required this.cac, required this.crossSpacing, required this.mainSpacing,
  }) : super(key: key);

  final double sWidth;
  final int cac;
  final double crossSpacing;
  final double mainSpacing;

  @override
  Widget build(BuildContext context) {
    if(cac == 1){
      return Stack(
        children: [
          //-----------------------------
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Expanded(flex: 1, 
                    child: Icon(Icons.arrow_circle_up_outlined, color: Colors.white, size: 30)
                  ),
                  Spacer(flex: 2),
                  Expanded(flex: 3, 
                    child: Icon(Icons.arrow_circle_down_outlined, color: Colors.black, size: 30)
                  ),

                ],
              )
            ),
          ),
          //-----------------------------
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width*2/3+50,
              color : Colors.amberAccent,
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
              margin: const EdgeInsets.all(30),
              // child: ListWheelScrollView(
              //   itemExtent: 250,
              //   magnification: 0.01,
              //   overAndUnderCenterOpacity: 0.99,
              //   diameterRatio: 3.5,
              //   children: <Widget>[
              //         TextButton(
              //           onPressed: () { print("coucou"); },
              //           child: Text("coucou"),
              //         ),
              //         CardMenuHome(pathSVG: 'assets/icons/farmer.svg', cardName: 'paysans',),
              //         CardMenuHome(pathSVG: 'assets/icons/fir.svg', cardName: 'Parcelles',),
              //         CardMenuHome(pathSVG: 'assets/icons/group.svg', cardName: 'Accompagements',),
              //         CardMenuHome(pathSVG: 'assets/icons/vegetables.svg', cardName: 'Recoltes',),                  
              //       ],
              // ),
              child:  GridView.count(
                childAspectRatio: 0.9,
                primary: false,
                padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
                crossAxisSpacing: crossSpacing,
                mainAxisSpacing: mainSpacing,
                crossAxisCount: cac,
                children: const <Widget>[
                  CardMenuHome(pathSVG: 'assets/icons/farmer.svg', cardName: 'paysans',),
                  CardMenuHome(pathSVG: 'assets/icons/fir.svg', cardName: 'Parcelles',),
                  CardMenuHome(pathSVG: 'assets/icons/group.svg', cardName: 'Accompagements',),
                  CardMenuHome(pathSVG: 'assets/icons/vegetables.svg', cardName: 'Recoltes',),                  
                ],
              )
            ),
          ),
          //-----------------------------
        ]
      );
    }
    else{
      return Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 100, 20, 20),
          width: sWidth,
          child:  GridView.count(
              childAspectRatio: 0.8,
              primary: false,
              padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
              crossAxisSpacing: crossSpacing,
              mainAxisSpacing: mainSpacing,
              crossAxisCount: cac,
              children: const <Widget>[
                CardMenuHome(pathSVG: 'assets/icons/farmer.svg', cardName: 'paysans',),
                CardMenuHome(pathSVG: 'assets/icons/fir.svg', cardName: 'Parcelles',),
                CardMenuHome(pathSVG: 'assets/icons/group.svg', cardName: 'Accompagements',),
                CardMenuHome(pathSVG: 'assets/icons/vegetables.svg', cardName: 'Recoltes',),                  
              ],
            )
        ),
      );
    }
  }
}
