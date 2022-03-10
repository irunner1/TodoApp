import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List todoList = [];
  String todoStr = '';

  
  @override
  void initState(){
    super.initState();

    todoList.addAll(['Записаться на йогу', 'Выбрать кеды', 'Выучить flutter']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список дел'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.blue.shade50,
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(todoList[index]),
            child: Card(
              child: ListTile(
                title: Text(todoList[index]),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.deepOrange,
                  ),
                  onPressed: (){
                    setState((){
                      todoList.removeAt(index);
                    });
                  }
                ),
              ), 
            ),
            onDismissed: (direction) {
              setState((){
                todoList.removeAt(index);
              });
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
        onPressed: (){
          setState(() {
            showDialog(context: context, builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Добавить задание'),
                content: TextField(
                  onChanged: (String str){
                    setState(() {
                      todoStr = str;
                    });                    
                  }
                ),
                actions: [
                  ElevatedButton(onPressed: () {
                    todoList.add(todoStr);
                    Navigator.of(context).pop();
                  }, child: Text('Добавить'))
                ],
              );
            }); 
          });
        },
      ),
    );
  }
}