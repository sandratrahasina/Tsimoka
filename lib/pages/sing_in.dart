import 'package:flutter/material.dart';
import 'package:tsimoka/utils/_var.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:tsimoka/controller/network_service.dart';


class SingInScreen extends StatelessWidget{
  const SingInScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context)  {
    return Container(
      color : mainThemeColor,
      child: Center(
        child: Container(
          color : mainThemeColor,
          width: 580, 
          child: Scaffold(
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
    return Container(
      color : mainThemeColor,
      child: Center(child: SingIn())
    );
  }
}

class SingIn extends StatefulWidget{
    const SingIn({
    Key? key,
  }) : super(key: key);

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {

  bool _obscureText = true;

  void toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final _SingInformKey = GlobalKey<FormState>();

  final controlemail = TextEditingController();
  final controlpassword = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 600,
      color : mainThemeColor,
      child: Column(
        children: [
          //titre+logo
          const Text('TSIMOKA + logo', style: TextStyle(
            fontFamily: '',
            fontSize: 50,
          )),
          //space
          SizedBox(
            height: 120,
          ),
          //email TF
          Container(
            padding : const EdgeInsets.symmetric(horizontal: 10,),
            decoration : const  BoxDecoration(
              color : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: TextFormField(
              style: TextStyle(color: mainThemeColor, fontSize: 20),
              controller : controlemail,
              decoration: InputDecoration(
                label: Text('Email', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500 , color: mainThemeColor),),
              ) 
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //password TF
          Container(
            padding : const EdgeInsets.symmetric(horizontal: 10,),
            decoration : const  BoxDecoration(
              color : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //mdp
                Flexible(
                  child: TextFormField(
                    obscureText: _obscureText ,
                    style: TextStyle(color: mainThemeColor, fontSize: 20),
                    controller: controlpassword,
                
                    decoration: InputDecoration(
                      //border: UnderlineInputBorder(),
                      label: Text('Mot de passe', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500 , color: mainThemeColor),),
                    ) 
                  ),
                ),
                SizedBox(
                  width: 35,
                  child: IconButton(icon : _obscureText ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined), 
                    onPressed: () {  toggleVisibility(); },
                  ),
                )
              ],
            ),
          ),
          //forgot
          Container(
            height: 70,
            alignment: Alignment.centerRight,
            child: Text('mot de passe oublier?', textAlign: TextAlign.end, style : TextStyle(color : Colors.white))
          ),
          //btn login
          Container(
            width: 200,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green) ,
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () async {
                NetworkService ns = NetworkService();
                try{
                  Response rs = await ns.dio.post(ns.baseUrl + 'api/login_check', data : {
                    'username' : controlemail.text,
                    'password' : controlpassword.text
                    }, options:Options(headers: {
                      'content-Type' : 'application/json'
                  }));

                  print("_______________________________");

                  var coucou = rs.data;

                  print(coucou['token']);
                  print(coucou['data']);
                  print(coucou['data']['nom']);

                } on DioError catch (e) {
                  
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Ereur"),
                      content: Text(""),
                    )
                );
                }
                
                

            
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: const Text('Se connecter', style: TextStyle(fontSize: 20),)
              ),
            ),
          ),
        ],
      ),
    );
  }
}



















// Container(
//             width: 200,
//             child: TextButton(
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all<Color>(Colors.green) ,
//                 foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//               ),
//               onPressed: () async {
//                 print("counter");
                

//                 late Future<int> _counter;
//                 final SharedPreferences prefs = await SharedPreferences.getInstance();
//                 final int counter = (prefs.getInt('counter') ?? 0) + 1;
//                 _counter = prefs.setInt("counter", counter).then((bool success) {
//                   return counter;
//                 });
//                 _counter.then((value) {
//                   print(value);
//                 });

                
//                 var dio = Dio();
//                 final response = await dio.get('https://opensky-network.org/api/states/all?time=1458564121&icao24=3c6444');
//                 print(response.data);

//                 print("_______________________________");

//                 NetworkService ns = NetworkService();

//                 Response rs = await ns.dio.post(ns.baseUrl + 'api/login_check', data : {
//                   'username' : controlemail.text,
//                   'password' : controlpassword.text
//                 }, options:Options(headers: {
//                   'content-Type' : 'application/json'
//                 }));

//                 print("_______________________________");

//                 var coucou = rs.data;

//                 print(coucou['token']);
//                 print(coucou['data']);
//                 print(coucou['data']['nom']);
//               },
//               child: Container(
//                 height: 50,
//                 alignment: Alignment.center,
//                 child: const Text('Se connecter', style: TextStyle(fontSize: 20),)
//               ),
//             ),
//           ),

