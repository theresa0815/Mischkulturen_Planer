
import 'package:flutter/material.dart';



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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: planted.length,
            itemBuilder: (context, index) {
              print("final planted: $planted");
                return ListTile(
                    leading: Container(
                      width: 40,
                      color: Colors.lightGreen[100 * index],
                      child: Center(
                        child: Text((index + 1).toString(),
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Oswald',
                          ),),
                      ),),
                    title: Center(
                      child: Text(planted[index],
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Condensed-Light',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),),
                     ),
                );
            }),
      ),
      backgroundColor: Colors.brown[50],
    );

  }
}
