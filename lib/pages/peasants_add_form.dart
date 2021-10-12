import 'package:flutter/material.dart';
import 'package:tsimoka/main.dart';

import 'package:tsimoka/utils/_var.dart';
import 'package:tsimoka/custom_widget/app_bar_custom.dart';
import 'package:tsimoka/custom_widget/peasant_unit_list.dart';
import 'package:tsimoka/custom_widget/peasant_search_bar.dart';

import 'package:flutter/scheduler.dart' show timeDilation;

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
    return Center(
      child: Container(
        width: 580,
        child: PeasantAddForm()
      )
    );
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: _PeasantAddformKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //  Information personnelles
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
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
                    const NomFF(),
                    const PrenomFF(),
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
              //  Productions 
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                width: MediaQuery.of(context).size.width,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Productions', style: TextStyle(fontSize: 18, color: myGreen),),
                    Text('Vos produits', style: TextStyle(fontSize: 17, color: mainThemeColor ),),
                    IconButton(
                      onPressed: (){}, 
                      icon: Icon(Icons.add, color: myGreen,size: 30,)
                    ),
                    Text('Certification', style: TextStyle(fontSize: 17, color: mainThemeColor ),),
                    Container(
                      width: 200,
                      child: Column(
                        children: const [
                          certificationCBBio(),
                          certificationCBBioFFL(),
                          certificationCBConventinnel(),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),

              //  Localisation
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
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
                    Text('Localisation', style: TextStyle(fontSize: 18, color: myGreen),),
                    const ZoneDD(),
                    const FokotanyFF(),
                    const ZonePlantationFF(),
                    const DistanceFF()
                  ],
                ),
              ),
              //  Information de contact
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
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
                    Text('Informations de contact', style: TextStyle(fontSize: 18, color: myGreen),),
                    const FiliationFF(),
                    const NumeroFF()
                  ],
                ),
              ),
              //  sary
        
              //  btn terminer
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                width: 200,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green) ,
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    fixedSize: MaterialStateProperty.all<Size>(const Size.fromWidth(350))
                  ),
                  onPressed: () { },
                  child: const Text('Terminer', style: TextStyle(fontSize: 25),),
                ),
              ),
              
            ],
          ),
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
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        label: Text('Nom', style: TextStyle(fontSize: 15, color: mainThemeColor),),
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
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        label: Text('Prenom', style: TextStyle(fontSize: 15, color: mainThemeColor),),
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
          Text('Votre age : ', style: TextStyle(fontSize: 15, color: mainThemeColor),),
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
      iconSize: 20,
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
          child: Text(value, style: TextStyle(fontSize: 15, color: mainThemeColor),),
        );
      }).toList(),
    );
  }
}

//------------------------------------------------------------------------
class ZoneDD extends StatefulWidget {
  const ZoneDD({Key? key}) : super(key: key);

  @override
  State<ZoneDD> createState() => ZoneDDState();
}


class ZoneDDState extends State<ZoneDD> {
  String dropdownValue = 'zone1';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 20,
        elevation: 16,
        style: TextStyle(color: mainThemeColor,),
        underline: Container(
          height: 1,
          color: mainThemeColor,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['zone1', 'zone2']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: TextStyle(fontSize: 15, color: mainThemeColor),),
          );
        }).toList(),
      ),
    );
  }
}

//------------------------------------------------------------------------
class FokotanyFF extends StatelessWidget {
  const FokotanyFF({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        label: Text('Fokotany', style: TextStyle(fontSize: 15, color: mainThemeColor),),
      ),
      validator: (value) {  
        if (value.toString().isEmpty) {  
          return 'Entrer votre Fokotany';  
        }  
        return null;  
      },  
    );
  }
}

//------------------------------------------------------------------------
class ZonePlantationFF extends StatelessWidget {
  const ZonePlantationFF({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        label: Text('Zone de planatation', style: TextStyle(fontSize: 15, color: mainThemeColor),),
      ),
      validator: (value) {  
        if (value.toString().isEmpty) {  
          return 'Entrer votre Zone de plantation';  
        }  
        return null;  
      },  
    );
  }
}

//------------------------------------------------------------------------
class DistanceFF extends StatelessWidget {
  const DistanceFF({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top : 10),
      width: MediaQuery.of(context).size.width-20,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(flex: 9,child: Text('Distance entre habitat et terrain (en km) : ', style: TextStyle(color: mainThemeColor , fontSize: 15), overflow: TextOverflow.ellipsis,)),
          Flexible(
            flex : 1,
            child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                isDense: true,
              ),
              validator: (value) {  
                if (value.toString().isEmpty) {  
                  return 'Entrer la distance qui separe votre habitat du terrain';  
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
class FiliationFF extends StatelessWidget {
  const FiliationFF({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        label: Text('Filiation collecte (Facultatif)', style: TextStyle(fontSize: 15, color: mainThemeColor),),
      ) 
    );
  }
}

//------------------------------------------------------------------------
class NumeroFF extends StatelessWidget {
  const NumeroFF({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        label: Text('Numéro téléphone', style: TextStyle(fontSize: 15, color: mainThemeColor),),
      ),
      validator: (value) {  
        if (value.toString().isEmpty) {  
          return 'Entrer votre numéro de téléphone';  
        }  
        return null;  
      },  
    );
  }
}

//--------------------------------------------------------------------------
class certificationCBBio extends StatefulWidget {
  const certificationCBBio({Key? key}) : super(key: key);

  @override
  State<certificationCBBio> createState() => _certificationCBBioState();
}

class _certificationCBBioState extends State<certificationCBBio> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text('Bio', textAlign: TextAlign.start, style: TextStyle(color: mainThemeColor),),
      value: timeDilation != 1.0,
      onChanged: (bool? value) {
        setState(() {
          timeDilation = value! ? 2.0 : 1.0;
        });
      },
    );
  }
}

//--------------------------------------------------------------------------
class certificationCBBioFFL extends StatefulWidget {
  const certificationCBBioFFL({Key? key}) : super(key: key);

  @override
  State<certificationCBBioFFL> createState() => _certificationCBBioFFLState();
}

class _certificationCBBioFFLState extends State<certificationCBBioFFL> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text('Bio/FFL', textAlign: TextAlign.start, style: TextStyle(color: mainThemeColor),),
      value: timeDilation != 1.0,
      onChanged: (bool? value) {
        setState(() {
          timeDilation = value! ? 2.0 : 1.0;
        });
      },
    );
  }
}

//--------------------------------------------------------------------------
class certificationCBConventinnel extends StatefulWidget {
  const certificationCBConventinnel({Key? key}) : super(key: key);

  @override
  State<certificationCBConventinnel> createState() => _certificationCBConventinnelState();
}

class _certificationCBConventinnelState extends State<certificationCBConventinnel> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text('Conventionnelle', textAlign: TextAlign.start, style: TextStyle(color: mainThemeColor),),
      value: timeDilation != 1.0,
      onChanged: (bool? value) {
        setState(() {
          timeDilation = value! ? 2.0 : 1.0;
        });
      },
    );
  }
}