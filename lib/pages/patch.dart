
import 'package:flutter/material.dart';
import 'package:urbangardenplanner/pages/create_plan.dart';




class Patch extends StatelessWidget {


  List<String> planted ;
  //constructor
  Patch(this.planted);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("optimale Mischkultur: ",
          style: TextStyle(
              fontFamily: 'Oswald',
              letterSpacing: 3,
              fontSize: 15,
              color: Colors.lightGreen[900]
          ),),
        centerTitle: true,
        backgroundColor: Colors.brown[50],
        elevation: 0,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 150,
              width: 250,
              color: Colors.brown[100],
              padding: EdgeInsets.all(15),
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.red[400],
                    width: 40,
                    height: 120 ,
                  ),
                  SizedBox(width: 10,),
                  Container(
                    color: Colors.green[400],
                    height: 120,
                    width: 20,
                  ),
                  SizedBox(width: 10,),
                  Container(
                    color: Colors.green[800],
                    height: 120,
                    width: 35,
                  ),
                  SizedBox(width: 10,),
                  Container(
                    color: Colors.white30,
                    height: 120,
                    width: 15,
                  ),
                  SizedBox(width: 10,),
                  Container(
                    color: Colors.amber[400],
                    height: 120,
                    width: 20,
                  ),
                  SizedBox(width: 10,),
                  Container(
                    color: Colors.green[500],
                    height: 120,
                    width: 40,
                  ),
                ],

              ),
            ),
            SizedBox(height: 50,),
            FloatingActionButton(
              onPressed: (){print(createPlan(planted));},
            backgroundColor: Colors.white30,
              elevation: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Text(createPlan(planted).toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Condensed-Light',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ],
        ),
      ),
      backgroundColor: Colors.brown[50],
    );
  }
}
