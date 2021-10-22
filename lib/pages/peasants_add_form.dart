import 'package:flutter/material.dart';
import 'package:tsimoka/main.dart';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'package:tsimoka/utils/_var.dart';
import 'package:tsimoka/custom_widget/app_bar_custom.dart';
import 'package:tsimoka/custom_widget/peasant_unit_list.dart';
import 'package:tsimoka/custom_widget/peasant_search_bar.dart';

import 'package:flutter/scheduler.dart' show timeDilation;

import 'package:provider/provider.dart';

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

  // ignore: non_constant_identifier_names
  final _PeasantAddformKey = GlobalKey<FormState>();  

  final nomCtrl = TextEditingController();
  final prenomCtrl = TextEditingController();
  final fokotanyCtrl = TextEditingController();
  final zonePlantationCtrl = TextEditingController();
  final distanceCtrl = TextEditingController();
  final filiationCtrl = TextEditingController();
  final numeroCtrl = TextEditingController();
  final ageCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ModelProviderSary(),
        child: Container(
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
                      NomFF(control : nomCtrl),
                      PrenomFF(control : prenomCtrl),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GenreDD(),
                          AgeFF(control : ageCtrl)
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
                        width: MediaQuery.of(context).size.width,
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
                      ZoneDD(),
                      FokotanyFF(control : fokotanyCtrl),
                      ZonePlantationFF(control : zonePlantationCtrl),
                      DistanceFF(control : distanceCtrl)
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
                      FiliationFF(control : filiationCtrl),
                      NumeroFF(control : numeroCtrl)
                    ],
                  ),
                ),
                //  sary
                Divider(thickness: 5,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  alignment: Alignment.center,
                  child: SaryAddContainer(),
                ),
                
          
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
                    onPressed: () { print(this.nomCtrl.value);},
                    child: const Text('Terminer', style: TextStyle(fontSize: 25),),
                  ),
                ),
                
              ],
            ),
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
    required  this.control,
  }) : super(key: key);

  final TextEditingController control;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: control,
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
    Key? key,required  this.control,
  }) : super(key: key);

  final TextEditingController control;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: control,
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
    Key? key,required  this.control,
  }) : super(key: key);

  final TextEditingController control;

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
              controller: control,
              keyboardType: TextInputType.number,
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
  const GenreDD({Key? key,}) : super(key: key);
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
    Key? key, required this.control,
  }) : super(key: key);

  final TextEditingController control;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: control,
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
    Key? key, required this.control,
  }) : super(key: key);

  final TextEditingController control;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: control,
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
    Key? key, required this.control,
  }) : super(key: key);

  final TextEditingController control;

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
              controller: control,
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
    Key? key, required this.control,
  }) : super(key: key);

  final TextEditingController control;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: control,
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
    Key? key, required this.control, 
  }) : super(key: key);

  final TextEditingController control;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: control,
      keyboardType: TextInputType.phone,
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

//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------

class ModelProviderSary extends ChangeNotifier
{
  List<File> _allSary = <File>[];

  void addSary(File x){
    _allSary.add(x);

    notifyListeners();
  }

  void deleteSary(int index){
    _allSary.remove(_allSary[index]);

    notifyListeners();
  }
}

//--------------------------------------------------------------------------
class SaryAddbtn extends StatefulWidget {
  const SaryAddbtn({
    Key? key,
  }) : super(key: key);

  @override
  State<SaryAddbtn> createState() => _SaryAddbtnState();
}

class _SaryAddbtnState extends State<SaryAddbtn> {
  var imagePicker;
  var type;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelProviderSary>(
      builder: (context, provider, child){
        return (
          Container(
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
            height: 100, width: 100,
            child : ImageAff(ImageSourceType.camera),
          )
        ); 
      }
    );
  }
}

//--------------------------------------------------------------------------
class PDPAddbtn extends StatefulWidget {
  const PDPAddbtn({
    Key? key,
  }) : super(key: key);

  @override
  State<PDPAddbtn> createState() => PDPAddbtnState();
}

class PDPAddbtnState extends State<PDPAddbtn> {
  var imagePicker;
  var type;
  var image;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelProviderSary>(
      builder: (context, provider, child){
        return (
          Container(
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
            height: 100, width: 100,
            child : PDPAff(ImageSourceType.camera),
          )
        ); 
      }
    );
  }
}

//--------------------------------------------------------------------------
class ContainerSary extends StatelessWidget {
  const ContainerSary({
    Key? key,
    required  image,
  }) : _image = image, super(key: key);

  final _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, height: 100,
      margin: EdgeInsets.all(5),
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
      child: _image != null
        ? Image.file(
            _image,
            width: 100.0, height: 100.0,
            fit: BoxFit.fitHeight,
          )
        : Container( decoration: BoxDecoration( color: Colors.amberAccent),
          width: 100, height: 100,
          child: Icon(
            Icons.camera_alt,
            color: Colors.grey[800],
          ),
        ),
    );
  }
}

//--------------------------------------------------------------------------
class SaryAddContainer extends StatelessWidget {
  const SaryAddContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelProviderSary>(
      builder: (context, provider, child){
        return (
          Container(
            width: MediaQuery.of(context).size.width,
            child: SizedBox(
              width : MediaQuery.of(context).size.width,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                
                children: [
                  PDPAddbtn(),
                  SizedBox(width: 20,),
                  SaryAddbtn(),
                  Wrap(
                    children: List.generate(
                      provider._allSary.length, (index){
                        return ContainerSary(image: provider._allSary[index]);
                      } 
                    ),
                  ),
                ],
              ),
            ),
          )
        );
      }
    );
  }
}
//--------------------------------------------------------------------------
enum ImageSourceType {galerie, camera}
//--------------------------------------------------------------------------
class ImageAff extends StatefulWidget {
  final type;
  ImageAff(this.type);

  @override
  ImageAffState createState() => ImageAffState(type);
}

class ImageAffState extends State<ImageAff> {
  var _image;
  var imagePicker;
  var type;

  ImageAffState(this.type);

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelProviderSary>(
      builder: (context, provider, child){
        return (
          Container(
            //margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            width: 100, height: 100,
            child: Column(
                children: <Widget>[
                  Spacer(flex: 1,),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        var source = type == ImageSourceType.camera
                          ? ImageSource.camera
                          : ImageSource.gallery;
                        XFile image = await imagePicker.pickImage(
                          source: source, 
                          imageQuality: 50, 
                          preferredCameraDevice: CameraDevice.front);
                        setState(() {
                          provider._allSary.add(File(image.path));
                        });
                      },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: _image != null
                        ? Image.file(
                          _image,
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.fitHeight,
                        )
                        : Container(
                          decoration: BoxDecoration(
                              color:Colors.white),
                          width: 100,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.add_a_photo, color: mainThemeColor, ),
                              Text('Prendre des photos', style: TextStyle(color: myGreen), textAlign: TextAlign.center,),
                            ],
                          ),
                        ),
                    ),
                  ),
                ),
                Spacer(flex: 1,)
              ],
            ),
          )
        );
      }
    );
  }
}
//---------------------------------------------------------
class PDPAff extends StatefulWidget {
  final type;
  PDPAff(this.type);

  @override
  PDPAffState createState() => PDPAffState(type);
}

class PDPAffState extends State<PDPAff> {
  var _imagePDP;
  var imagePicker;
  var type;

  PDPAffState(this.type);

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelProviderSary>(
      builder: (context, provider, child){
        return (
          Container(
            //margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            width: 100, height: 100,
            child: Column(
                children: <Widget>[
                  Spacer(flex: 1,),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        var source = type == ImageSourceType.camera
                          ? ImageSource.camera
                          : ImageSource.gallery;
                        XFile image = await imagePicker.pickImage(
                          source: source, 
                          imageQuality: 50, 
                          preferredCameraDevice: CameraDevice.front);
                        setState(() {
                          _imagePDP = File(image.path);
                        });
                      },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: _imagePDP != null
                        ? Image.file(
                          _imagePDP,
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.fitHeight,
                        )
                        : Container(
                          decoration: const BoxDecoration(
                              color:Colors.white),
                          width: 100,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.person_add_sharp, color: mainThemeColor, ),
                              Text('Prendre un photo de profil', style: TextStyle(color: myGreen), textAlign: TextAlign.center,),
                            ],
                          ),
                        ),
                    ),
                  ),
                ),
                Spacer(flex: 1,)
              ],
            ),
          )
        );
      }
    );
  }
}
