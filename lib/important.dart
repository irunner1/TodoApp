import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

class Important extends StatefulWidget {
  const Important({ Key? key }) : super(key: key);

  @override
  _ImportantState createState() => _ImportantState();
}

class _ImportantState extends State<Important> {
  
  List toBuy = [];
  String todoStr = '';

  // void initFirebase() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await Firebase.initializeApp();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   initFirebase();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Важное'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.blue.shade50,
      body: Column(children: [
        Row(children: <Widget>[
          Expanded(
            child: Card(
              child: InkWell(
                splashColor: Colors.blue.shade100,
                onTap: (){
                  print('tapped');
                  //будет открываться странца с заметкой
                },
                child: const SizedBox(
                  height: 190,
                  width: 150,
                  child: Text('Заметка 1'),
                )
              )
            ),
          ),
          Expanded(
            child: Card(
              child: InkWell(
                splashColor: Colors.blue.shade100,
                onTap: (){
                  print('tapped');
                  //будет открываться страница с заметкой
                },
                child: const SizedBox(
                  height: 190,
                  width: 150,
                  child: Text('Пароли'),
                )
              )
            ),
          ),
        ],),
        Row(children: <Widget>[        
          Expanded(
            child: Card(
              child: InkWell(
                splashColor: Colors.blue.shade100,
                onTap: (){
                  print('tapped');
                  //будет открываться странца с заметкой
                },
                child: const SizedBox(
                  height: 190,
                  width: 50,
                  child: Text('Заметка 2'),
                )
              )
            ),
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain, // otherwise the logo will be tiny
              //child: FlutterLogo(),
             ),
          ),
        ],)
      ],)
      
    );
  }
}