import 'package:flutter/material.dart';

import 'package:tsimoka/utils/_var.dart';
import 'package:tsimoka/custom_widget/app_bar_custom.dart';
import 'package:tsimoka/custom_widget/peasant_unit_list.dart';
import 'package:tsimoka/custom_widget/peasant_search_bar.dart';

class PeasantsListScreen extends StatelessWidget{
  const PeasantsListScreen({Key? key}): super(key: key);

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
          return PeasantsList();
        }
        else if(MediaQuery.of(context).size.width <= maxWidthTablet){//tablet
          return PeasantsList();
        }
        else{
          return PeasantsList();
        }
  }
}

class PeasantsList extends StatelessWidget {
  const PeasantsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SearchBarCustom(),
          Container(
            height: MediaQuery.of(context).size.height-200,
            child: ListView(
              children: const [
                PeasantUnitList(),
                PeasantUnitList(),
                PeasantUnitList(),
                PeasantUnitList(),
                PeasantUnitList(),
                PeasantUnitList(),
                PeasantUnitList(),
                PeasantUnitList(),
                PeasantUnitList(),
                PeasantUnitList(),
              ],
            ),
          )
        ],
      ),);
  }
}


