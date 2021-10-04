import 'package:flutter/material.dart';

import 'package:tsimoka/utils/_var.dart';
import 'package:tsimoka/custom_widget/app_bar_custom.dart';
import 'package:tsimoka/custom_widget/peasant_unit_list.dart';
import 'package:tsimoka/custom_widget/peasant_search_bar.dart';

class PeasantsAddScreen extends StatelessWidget{
  const PeasantsAddScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context)  {
    return Container(
      child: Center(
        child: Container(
          width: 1025, 
          child: Scaffold(
            appBar: AppBarCustom(),
            body: MainFrame(),
          ),
        ),
      ),
    );
  }
}

class MainFrame extends StatelessWidget {
  const MainFrame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        if(MediaQuery.of(context).size.width <= maxWidthMobile){//mobile
          return Container(
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username'
              ),
            ),
          );
        }
        else if(MediaQuery.of(context).size.width <= maxWidthTablet){//tablet
          return Container();
        }
        else{
          return Container();
        }
  }
}