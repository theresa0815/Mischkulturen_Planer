import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.bubble_chart,
                color: Colors.brown[50],
                size: 60,
              ),
              Text('ERNTEZEIT',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.brown[50],
                  fontSize: 30,
                  letterSpacing: 20,
                  fontFamily: 'Condensed-Light',
                ), ),
              SizedBox(height: 10.0),
              Text('der Mischkulturenplaner für Deinen Stadtgarten',
                style: TextStyle(
                    color: Colors.lightGreen[400],
                    fontFamily: 'Oswald',
                    fontSize: 15,
                    letterSpacing: 1
                ),)
            ],
          ),
        ),
        backgroundColor: Colors.lightGreen[900],
        floatingActionButton: RaisedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, '/choose_plants');
          },
          color: Colors.yellow[900],
          textColor: Colors.brown[50],
          label: Text("Mischkultur anlegen",
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

