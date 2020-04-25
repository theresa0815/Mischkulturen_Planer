import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urbangardenplanner/pages/create_plan.dart';
import 'package:urbangardenplanner/pages/patch.dart';

class ChoosePlants extends StatefulWidget {
  @override
  _ChoosePlantsState createState() => _ChoosePlantsState();
}

class _ChoosePlantsState extends State<ChoosePlants> {
  final List<String> vegetable = ["tomate", "basilikum", "möhre", "steckrübe", "petersilie"];
  List<String> planted = [];

  List addPlant(String item) {
    setState(() {
    planted.add(item);
    print(planted);});
    return planted;}

  List removePlant(String item)
    {setState(() {
    planted.remove(item);
    print(planted);});
    return planted;}

    //Counter zählt einfach wie oft das element in plan ist
  int Counter(String plant){
    int count = 0;
    for (var i = 0; i < planted.length; i ++){
      if (planted[i] == plant){
        count = count + 1;
      }
    }
    return count;
  }


    //TODO: have a look at flutter starter App


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Was möchtest du pflanzen?",
        style: TextStyle(
          fontFamily: 'Oswald',
          letterSpacing: 3,
          fontSize: 15,
          color: Colors.brown[50]
        ),),
        centerTitle: true,
        backgroundColor: Colors.lightGreen[900],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 8, 15, 0),
        child: ListView.builder(
          itemCount: vegetable.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(vegetable[index],
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'Condensed-Light',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              //subtitle: Text(counter(vegetable[index])),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.remove,
                    color: Colors.yellow[900],),
                    onPressed: () {
                    setState(() {
                      removePlant(vegetable[index]);
                    },);}
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8,0,8,0),
                    child: Text((Counter(vegetable[index]).toString()),
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Oswald',
                      color: Colors.grey[600],
                    ),),
                  ),

                  IconButton(
                      icon: Icon(Icons.add,
                        color: Colors.yellow[900],),
                      onPressed: () {
                        setState(() {
                          addPlant(vegetable[index]);
                        },);}
                  ),
                ],)
            );
          }
          //TODO: erster Buchstabe groß
        ),
      ),
      backgroundColor: Colors.brown[50],
      floatingActionButton: RaisedButton.icon(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => Patch(
            createPlan(this.planted),
            )));
        },
        color: Colors.yellow[900],
        textColor: Colors.brown[50],
        label: Text("Plan erstellen",
          style: TextStyle(
              fontFamily: 'Oswald'
          ),),
        icon: Icon(
            Icons.arrow_forward,
            color: Colors.brown[50]
        ),
      ),
    );
  }
}
