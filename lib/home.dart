// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic countryCode = '+92';
  TextEditingController phoneController = TextEditingController();
  dynamic phoneNum;
  dynamic fullPhoneNumber;
launchWhatsApp() async {
  final link = WhatsAppUnilink(
    phoneNumber: '+923352640168',
    text: "Hey! I'm inquiring about the apartment listing",
  );
  // Convert the WhatsAppUnilink instance to a string.
  // Use either Dart's string interpolation or the toString() method.
  // The "launch" method is part of "url_launcher".
  await launch('$link');
}
  validateZero() {
    if (phoneController.text.length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white70,
        content: Text(
          'Please Enter PhoneNumber',
          style: TextStyle(color: Colors.black),
        ),
        duration: Duration(seconds: 2),
      ));
    } else  {
      if (phoneController.text[0] == '0') {
        setState(() {
          phoneNum = phoneController.text.substring(1);
        });
        final link = WhatsAppUnilink(
    phoneNumber: '$countryCode$phoneNum',
    text: "Hey! I'm inquiring about the apartment listing",
  );
  
 launch('$link');
        // print(phoneNum);
      } else {
        setState(() {
          phoneNum = phoneController.text;
          final link = WhatsAppUnilink(
    phoneNumber: '$countryCode$phoneNum',
    text: "Hey! I'm inquiring about the apartment listing",
  );
  
 launch('$link');
        });
        // print(phoneNum);
      }

      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp Launcher'),
        backgroundColor: Colors.green,
      ),
      body: Column( children: [
        Padding(
        
          padding: const EdgeInsets.fromLTRB(0, 45, 0,25),
          child: SizedBox(
            height:230,
            width: 230,
            child: Image(image: AssetImage('assets/whatsapplogo.png'))
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(30) //                 <--- border radius here
                  ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CountryCodePicker(
                    initialSelection: "PK",
                    favorite: ["+92", "PK"],
                    flagWidth: 25,
                    onChanged: (value) {
                      setState(() {
                        countryCode = value;
                      });
                      print(countryCode);
                    },
                    // textOverflow: TextOverflow.fade,
                    //  alignLeft: true,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Enter Phone Number',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        OutlineButton(
          onPressed: () {
            validateZero();
          },
          child: Text("Launch"),
        )
      ]),
    );
  }
}
