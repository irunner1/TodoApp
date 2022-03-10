import 'package:flutter/material.dart';

class ToBuy extends StatefulWidget {
  const ToBuy({ Key? key }) : super(key: key);

  @override
  _ToBuyState createState() => _ToBuyState();
}

class _ToBuyState extends State<ToBuy> {
  
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
  void initState(){
    super.initState();

    toBuy.addAll(['Купить молока', 'Купить яйца', 'Купить сыр']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список покупок'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.blue.shade50,
      body: ListView.builder(
        itemCount: toBuy.length, //snapshot.data!.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(toBuy[index]), //snapshot.data!.docs[index].id
            child: Card(
              color: Colors.white,
              child: ListTile(
                title: Text(toBuy[index]), //snapshot.data!.docs[index].get('item')
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.deepOrange,
                  ),
                  onPressed: (){
                    //FirebaseFirestore.instance.collection('items').doc(snapshot.data!.docs[index].id).delete();
                    setState((){
                      toBuy.removeAt(index);
                    });
                  }
                ),
              ), 
            ),
            onDismissed: (direction) {
              // FirebaseFirestore.instance.collection('items').doc(snapshot.data!.docs[index].id).delete();
              setState((){
                toBuy.removeAt(index);
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
                    // FirebaseFirestore.instance.collection('items').add({'item': todoStr});
                    toBuy.add(todoStr);
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