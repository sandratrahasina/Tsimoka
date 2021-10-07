import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

import 'package:tsimoka/utils/_var.dart';

class SearchBarCustom extends StatelessWidget{
  const SearchBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
        if(MediaQuery.of(context).size.width <= maxWidthMobile){//mobile
          return Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child :Stack(
              children: [
                Row(
                  children: const [
                    Spacer(flex: 1,),
                    roundedIconBC(icon : Icons.qr_code, unitSize: 2, route: '/scanQRcode'),
                    Spacer(flex: 3,),
                    roundedIconBC(icon : Icons.add, unitSize: 2, route: '/peasantsAdd'), 
                    Spacer(flex: 1,),
                    ],
                ),
                Row(
                  children: const [
                    Spacer(flex:1),
                    AnimatedSearcBar(),
                    Spacer(flex:1),
                  ],
                ),
              ],
            )
          );
        }
        else if(MediaQuery.of(context).size.width <= maxWidthTablet){//tablet
          return Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(flex:1),
                Expanded(
                  flex: 15, 
                  child: Container(margin : const EdgeInsets.only(left:20), child: SearchBarBC()),
                ),
                const Spacer(flex:1),
                Expanded(
                  flex: 5, 
                  child: Row(
                    children: const [
                      Spacer(flex:1),
                      roundedIconBC(icon : Icons.qr_code, unitSize: 2, route: '/scanQRcode'), 
                      Spacer(flex:3),
                      roundedIconBC(icon : Icons.add, unitSize: 2, route: '/peasantsAdd'), 
                      Spacer(flex:1),
                    ],
                    
                  ),
                ),
                const Spacer(flex:1),
              ]
            )
          );
        }
        else{
          return Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(flex:1),
                Expanded(
                  flex: 15, 
                  child: Container(margin : const EdgeInsets.only(left:10), child: SearchBarBC()),

                ),
                const Spacer(flex:1),
                Expanded(
                  flex: 5, 
                  child: Row(
                    children: const [
                      Spacer(flex:1),
                      roundedIconBC(icon : Icons.qr_code, unitSize: 2, route: '/scanQRcode'), 
                      Spacer(flex:3),
                      roundedIconBC(icon : Icons.add, unitSize: 2, route: '/peasantsAdd'), 
                      Spacer(flex:1),
                    ],
                  ),
                ),  
                const Spacer(flex:1),      
              ]
            )
          );
        }
  }
}

class AnimatedSearcBar extends StatefulWidget {
  const AnimatedSearcBar({Key? key}) : super(key: key);

  @override
  AnimatedSearcBar_AppState createState() => AnimatedSearcBar_AppState();
}

// ignore: camel_case_types
class AnimatedSearcBar_AppState extends State<AnimatedSearcBar> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: myGrey,
            offset: const Offset(1.0,2.0),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0, right: 7, left: 7),
        child: AnimSearchBar(
          
          prefixIcon: Icon(Icons.search, size : 40, color: myGreen,),
          width: MediaQuery.of(context).size.width - 60,
          textController: textController,
          onSuffixTap: () {
            setState(() {
              textController.clear();
            });
          },
        ),
      ),
    );
  }
}

class SearchBarBC extends StatelessWidget {
  const SearchBarBC({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: 200,
      child: Center(
        child: TextFormField(
            initialValue: 'Recherche',
            decoration: InputDecoration(
              fillColor : Colors.white,
              focusColor : mainThemeColor ,
              hoverColor : myGrey ,
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 5.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(50), 
                )
              ),
            suffixIcon: IconButton(
              onPressed : (){},
              icon : Icon(Icons.search_outlined, size : 30, color: mainThemeColor,),
            ),
           ),
         ),
      ),
    );
  }
}

// ignore: camel_case_types
class roundedIconBC extends StatelessWidget {
  const roundedIconBC({
    Key? key, required this.icon, required this.unitSize, required this.route
  }) : super(key: key);

  final IconData icon;
  final double unitSize; 
  final String route;
  //ilaina rehefa version mobile de atao kely kokoa ny hangezan'ilay icon

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: myGrey,
              offset: const Offset(1.0,2.0),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        width: 30*unitSize, height: 30*unitSize,
        child: IconButton(
          onPressed: (){
            Navigator.pushNamed(context, route );
          },
          icon: Icon(icon, size: 20*unitSize, color: myGreen)
        )
      ),
    );
  }
}
