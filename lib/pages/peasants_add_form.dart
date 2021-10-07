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
          return PeasantAddForm();
        }
        else if(MediaQuery.of(context).size.width <= maxWidthTablet){//tablet
          return Container();
        }
        else{
          return Container();
        }
  }
}

class PeasantAddForm extends StatefulWidget {
  const PeasantAddForm({
    Key? key,
  }) : super(key: key);

  @override
  State<PeasantAddForm> createState() => _PeasantAddFormState();
}

class _PeasantAddFormState extends State<PeasantAddForm> {

  final _PeasantAddformKey = GlobalKey<FormState>();  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: _PeasantAddformKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.9,0.5),
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Information personnelles', style: TextStyle(fontSize: 18, color: myGreen),),
                  NomFF(),
                  PrenomFF(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      GenreDD(),
                      AgeFF()
                    ],
                  )
                ],
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}

//------------------------------------------------------------------------
class NomFF extends StatelessWidget {
  const NomFF({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        label: Text('Nom', style: TextStyle(fontSize: 15),),
      ),
      validator: (value) {  
        if (value.toString().isEmpty) {  
          return 'Entrer votre nom';  
        }  
        return null;  
      },  
    );
  }
}

//------------------------------------------------------------------------
class PrenomFF extends StatelessWidget {
  const PrenomFF({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        label: Text('Prenom', style: TextStyle(fontSize: 15),),
      ),
      validator: (value) {  
        if (value.toString().isEmpty) {  
          return 'Entrer votre prenom';  
        }  
        return null;  
      },  
    );
  }
}

//------------------------------------------------------------------------
class AgeFF extends StatelessWidget {
  const AgeFF({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text('Votre age : ', style: TextStyle(fontSize: 15),),
          SizedBox(
            width: 30,
            child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                isDense: true,
              ),
              validator: (value) {  
                if (value.toString().isEmpty) {  
                  return 'Entrer votre age';  
                }  
                return null;  
              },  
            ),
          ),
        ],
      ),
    );
  }
}

//------------------------------------------------------------------------
class GenreDD extends StatefulWidget {
  const GenreDD({Key? key}) : super(key: key);

  @override
  State<GenreDD> createState() => GenreDDState();
}


class GenreDDState extends State<GenreDD> {
  String dropdownValue = 'Homme';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: mainThemeColor),
      underline: Container(
        height: 1,
        color: mainThemeColor,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Homme', 'Femme']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: const TextStyle(fontSize: 15),),
        );
      }).toList(),
    );
  }
}

