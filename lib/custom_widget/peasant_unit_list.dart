import 'package:flutter/material.dart';

import 'package:tsimoka/utils/_var.dart';

class PeasantUnitList extends StatelessWidget {
  const PeasantUnitList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow:  [
              BoxShadow(
                color: myGrey,
                offset: const Offset(1.5,2.0),
                blurRadius: 1,
                spreadRadius: 1,
              ),
            ],
      ),
      height: 70, 
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //const Spacer(flex:1),
            Expanded(
              flex: 1,
              child: Container(
                width: 60.0, height: 60.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://i.imgur.com/BoN9kdC.png")
                    )
                )
              ),
            ),

            Expanded(
              flex: 5,
              child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Name FirstName', style: TextStyle(color: mainThemeColor, fontSize: 20, fontWeight: FontWeight.bold),),
                    Text('Profession, Local Post', style: TextStyle(color: mainThemeColor, fontSize: 15, fontWeight: FontWeight.normal),),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
                //alignment: Alignment.centerRight,
                width: 50.0, height: 50.0,
                decoration: BoxDecoration(
                    //color: Colors.amber,
                    shape: BoxShape.circle,
                    border: Border.all(color: myGreen)
                ),
                child: Icon(
                  Icons.navigate_next,
                  color: myGreen,
                  size: 30,
                ),
              ),
            ),
            //const Spacer(flex:1),
          ],
        ),
      )
    );
  }
}