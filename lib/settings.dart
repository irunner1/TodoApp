import 'package:flutter/material.dart';

class MySettings extends StatefulWidget {
  const MySettings({ Key? key }) : super(key: key);

  @override
  _MySettingsState createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  bool valNotify1 = false;
  bool valNotify2 = true;
  bool valNotify3 = false;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }
  onChangeFunction2(bool newValue2) {
    setState(() {
      valNotify2 = newValue2;
    });
  }
  onChangeFunction3(bool newValue3) {
    setState(() {
      valNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        bottom: true,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: 550,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.settings, color: Colors.blueAccent),
                      SizedBox(width: 10.0),
                      Text("Primary options", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Divider(height: 20.0, thickness: 1),
                  SizedBox(height: 10.0),
                  buildAccountOption(context, "Account"),
                  buildAccountOption(context, "Time Format"),
                  buildAccountOption(context, "Widget"),
                  buildAccountOption(context, "Language"),
                  buildAccountOption(context, "Privacy and Security"),
                  SizedBox(height: 40.0),
                  Row(
                    children: [
                      Icon(Icons.settings_phone, color: Colors.blueAccent,),
                      SizedBox(width: 10.0),
                      Text("Secondary options", style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ))
                    ],
                  ),
                  Divider(height: 2.0, thickness: 1),
                  SizedBox(height: 3.0),
                  buildNotificatorOption("Dark theme", valNotify1, onChangeFunction1),
                  buildNotificatorOption("Notifications", valNotify2, onChangeFunction2),
                  buildNotificatorOption("Alligment", valNotify3, onChangeFunction3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildNotificatorOption(String title, bool value, Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold, 
            color: Colors.grey
          )),
          Transform.scale(
            scale: 0.7,
            child: Switch(
              activeColor: Colors.blue,
              //trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangeMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Option 1"),
                Text("Option 2"),
              ],
            ),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                }, 
                child: Text("Close")
              )
            ],
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            )),
            Icon(Icons.arrow_right, color: Colors.grey),
          ],
        ),
      ),

    );
  }
}