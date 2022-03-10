// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:task_app/emtypage.dart';
import 'package:task_app/settings.dart';
import 'package:task_app/ListTodo.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    CardList(),
    BasicTable(),
    MySettings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: pageList[pageIndex],
        bottomNavigationBar: CurvedNavigationBar(
          height: 50.0,
          color: Colors.white,
          backgroundColor: Colors.blue.shade50,
          items: <Widget>[
            Icon(Icons.home, size: 20, color: Colors.lightBlueAccent),
            Icon(Icons.calendar_today, size: 20, color: Colors.lightBlueAccent),
            Icon(Icons.list, size: 20, color: Colors.lightBlueAccent),
          ],
          onTap: (index){
            print(index);
            setState(() {
              pageIndex = index;
            });
          }
        ),
      ),
    );
  }
}

class TOdolist{
  String name;
  TOdolist(this.name);
}

class CardList extends StatelessWidget {
  const CardList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final widgts = <TOdolist>[
      TOdolist('To do list'),
      TOdolist('Shopping list'),
      TOdolist('Important'),
    ];
    return Container(
      decoration:  BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          title: Text('Actuals', style: TextStyle(
            fontSize: 21, 
            //fontWeight: FontWeight.bold, 
          )),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: ListView.builder(
          itemCount: widgts.length,
          itemBuilder: (context, ind) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
                ),
                height: 100,
                width: size.width,
                child: ListTile(
                  title: Text(widgts[ind].name, 
                    style: TextStyle(
                      fontSize: 20, 
                      //fontWeight: FontWeight.bold, 
                      color: Colors.grey[800]
                    )),
                  trailing: Icon(Icons.arrow_right),
                  onTap: (){
                    if (ind == 0) Navigator.pushNamed(context, '/todo'); ////////////////////////////////
                    if (ind == 1) Navigator.pushNamed(context, '/tobuy'); //потом поменять на statefull
                    if (ind == 2) Navigator.pushNamed(context, '/imp'); /////////////////////////////////////
                  },
                )
              ),
            );
          }
        ),
      ),
    );
  }
}