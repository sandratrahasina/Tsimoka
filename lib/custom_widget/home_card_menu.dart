import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardMenuHome extends StatelessWidget {
  const CardMenuHome({
    Key? key,
    required this.pathSVG,
    required this.cardName,
  }) : super(key: key);

  final String pathSVG;
  final String cardName;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            //sary
            Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  pathSVG,
                  width: 200, height: 200,
                ),
              ),
            ),
            //soratra
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  cardName,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0,5.0),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
    );
  }
}