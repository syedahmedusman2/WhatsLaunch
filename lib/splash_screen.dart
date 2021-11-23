// ignore: file_names
import 'package:flutter/material.dart';
import 'package:whatsapplauncher/home.dart';


class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
    super.initState();
    Future.delayed(Duration(milliseconds: 2500), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Home()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
              padding: const EdgeInsets.all(17),
              child: Container(child: Center(child: Image.asset('assets/whatsapplogo.png')))
               ),
               const Text("Send WhatsApp message without saving number", style: TextStyle(
                 fontWeight: FontWeight.w300,  fontSize: 15, color: Colors.black, wordSpacing: 2.4,
               ),)

      ],)
      
    );
  }
}