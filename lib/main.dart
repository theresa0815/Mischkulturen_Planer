
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urbangardenplanner/pages/home.dart';
import 'package:urbangardenplanner/pages/choose_plants.dart';
import 'package:urbangardenplanner/pages/patch.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/choose_plants': (context) => ChoosePlants(),
    '/patch': (context) => Patch([]),
  },
));

