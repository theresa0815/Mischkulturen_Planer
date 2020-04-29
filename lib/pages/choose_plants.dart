import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urbangardenplanner/pages/create_plan.dart';
import 'package:urbangardenplanner/pages/patch.dart';
import 'plants.dart';

class ChoosePlants extends StatefulWidget {

  @override
  _ChoosePlantsState createState() => _ChoosePlantsState();
}

class _ChoosePlantsState extends State<ChoosePlants> {

  List<Plant> vegetables = [
    Plant(name:'Tomate', index: 1, friends: [2,6], enemies: [5, 3]),
    Plant(name: 'Basilikum', index: 2, friends: [1, 3], enemies: [6]),
    Plant(name: 'Möhre', index: 3, friends: [5, 2, 7], enemies: [1],),
    Plant(name: 'Steckrübe', index: 4, friends: [6], enemies: [5]),
    Plant(name: 'Petersilie', index: 5, friends: [3], enemies: [1, 4]),
    Plant(name: 'Mangold', index: 6, friends: [1,4,7], enemies: [2]),
    Plant(name: 'Gurke', index: 7, friends: [6,3], enemies: []),
  ];

  List<Plant> planted = [];

  List<Plant> addPlant(Plant item) {
    setState(() {
    planted.add(item);
    print(planted);});
    return planted;}

  List removePlant(Plant item)
    {setState(() {
    planted.remove(item);
    print(planted);});
    return planted;}

  int Counter(Plant plant){
    int count = 0;
    for (var i = 0; i < planted.length; i ++){
      if (planted[i] == plant){
        count = count + 1;
      }
    }
    return count;
  }


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
          itemCount: vegetables.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(vegetables[index].name,
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'Condensed-Light',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.remove,
                    color: Colors.yellow[900],),
                    onPressed: () {
                      setState(() {
                      removePlant(vegetables[index]);
                    },);}
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8,0,8,0),
                    child: Text((Counter(vegetables[index]).toString()),
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
                          addPlant(vegetables[index]);
                        },);}
                  ),
                ],)
            );
          }
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
