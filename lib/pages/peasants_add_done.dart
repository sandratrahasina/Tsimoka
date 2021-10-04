
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';


// import 'package:tsimoka/utils/_var.dart';
// import 'package:tsimoka/custom_widget/app_bar_custom.dart';


// import 'package:provider/provider.dart';
// import 'package:tsimoka/main.dart';

// class PeasantsAddDone extends StatelessWidget{
//   const PeasantsAddDone({Key? key}): super(key: key);

//   @override
//   Widget build(BuildContext context)  {
//     return Container(
//       child: Center(
//         child: Container(
//           width: 1025, 
//           child: Scaffold(
//             appBar: AppBarCustom(),
//             body: MainFrame(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MainFrame extends StatelessWidget {
//   const MainFrame({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final ScreenSizeInfo ssf = context.read<ScreenSizeInfo>();
//     return LayoutBuilder(
//       builder: (context,constraints){
//         print(" heght  : " + ssf.screenHeight.toString() + "  ,  width  :" + ssf.screenWidth.toString());
//         if(constraints.maxWidth <= maxWidthMobile){//mobile
//           return Container(
//             color: Colors.amber,
//           );
//         }
//         else if(constraints.maxWidth <= maxWidthTablet){//tablet
//           return Center(
//             child: Column(
//               children: [
//                 Spacer(flex:3),
//                 Container(
//                   child: Container(
//                     // width: 200, height: 200,
//                     alignment: Alignment.center,
//                     child: SvgPicture.asset(
//                       'assets/icons/complete.svg',
//                       width: 200, height: 200,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   ),
//                 Spacer(flex:1),
//                 Text('Personne bien ajoutée', style: TextStyle(
//                       fontSize: 35,
//                     ),
//                   ),
//                 Spacer(flex:1),
//                 TextButton(
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(Colors.green) ,
//                     foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                     fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(350))
//                   ),
//                   onPressed: () { },
//                   child: Text('Ajouter à nouveau', style: TextStyle(fontSize: 25),),
//                 ),
//                 Spacer(flex:1),
//                 TextButton(
//                   style: ButtonStyle(
//                     foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
//                   ),
//                   onPressed: () { },
//                   child: Text('retour à l acceuil', style: TextStyle(fontSize: 25),),
//                 ),

//                 Spacer(flex:3),

//               ]
//                 ),
//           );
//         }
//         else{
//           return Container(color: Colors.green, );
//         }
//       }
//     );
//   }
// }
