import 'dart:math';
import 'plants.dart';

List createPlan (List<Plant> planted) {

  List<Plant> plan = new List<Plant>();
  // create Matrix
  List matrix = createMatrix(planted);
  print(matrix);

  // start with "most unpopular" plant as it will stand at the edge anyway
  List sum = createSumRow(matrix);
  print(sum);
  var s = sum.indexOf(smallestValue(sum));
  Plant currentPlant = planted[s];
  print(currentPlant);
  plan.add(currentPlant);


  while (matrix.length > 1)
  {
    // del column of the currentPlant as it should not be taken again
    var s = planted.indexOf(currentPlant);
    print("index $s");
    for (var i = 0; i < matrix.length; i ++) {
      matrix[i].removeAt(s);
    }

    // find highest number in row (taking the "sum probability" into account) and the corresponding plant
    print(matrix);
    var nu = largestValue(matrix[s]);
    print(nu);
    sum = createSumColumn(matrix);
    print(sum);
    var position = matrix[s].indexOf(nu);
    var startvalue = 10000000;
    for (var m = 0; m < matrix[0].length; m ++) {
      if ((matrix[0][m] == nu) & (sum[m] <= startvalue)){
        print("overwrite position");
        position = m;
        print(m);
        startvalue = sum[m];
      }
    }

    matrix.removeAt(planted.indexOf(currentPlant));
    print(matrix);

    planted.remove(currentPlant);
    print("planted $planted");
    currentPlant = planted[position];
    print("currentplant: $currentPlant ");

    // append new plant to final plan (taking in account that it may fit the best in the begin)

    if ((planted.length == 1) & (checkRelation(currentPlant, plan[0]) >= checkRelation(currentPlant, plan[plan.length - 1]))) {
      plan.insert(0, currentPlant);
      print("if insert: $plan");
    }
    else {
      plan.add(currentPlant);
      print("else insert: $plan");
    }

    if (matrix.length < 2){break;}


    //half way there
    var r = position;
    matrix.removeAt(r);
    print(matrix);

    // find highest number
    var ne = matrix[0][r];
    print(ne);
    sum = createSumRow(matrix);
    print(sum);
    startvalue = 100000000;
    //TODO: infinite instead
    for (var i = 0; i<matrix.length; i ++) {
      if (matrix[i][r] > ne) {
        ne = matrix[i][r];
        position = i;
      }
      else if ((matrix[i][r] == ne) & (sum[i] <= startvalue)){
        ne = matrix[i][r];
        position = i;
        startvalue = sum[i];
      }
    }
    print("new position $position");

    //del matrix column of old currentPlant
    for (var i = 0; i < matrix.length; i ++) {
      matrix[i].removeAt(r);
    }
    print(matrix);
    s = r;

    planted.remove(currentPlant);
    currentPlant = planted[position];
    print(planted);
    print(planted.length);
    if ((planted.length == 1) & (checkRelation(currentPlant, plan[0]) >= checkRelation(currentPlant, plan[plan.length - 1]))) {
      plan.insert(0, currentPlant);
      print("if insert: $plan");
    }
    else {
      plan.add(currentPlant);
      print("else insert: $plan");
    }
  }
  return plan;
}


int checkRelation (Plant plant, Plant neighbor) {
  if (plant.friends.contains(neighbor.index))
    return 10;
  else if (plant.enemies.contains(neighbor.index))
    return 0;
  else return 5;
}

createMatrix(List<Plant> planted){
  int size = planted.length;
  List<List<int>> matrix = List<List<int>>();
  for (var i = 0; i<size; i ++) {
    List <int> list =  List <int>();
    for (var j = 0; j < size; j++) {
      list.add(checkRelation(planted[j], planted[i]));
    }
  matrix.add(list);
  }
  return matrix;
}

createSumRow (List matrix) {
  List<int> sum = [];
  for (var i = 0; i<matrix.length; i ++) {
    var x = 0;
    for (var j = 0; j < matrix[0].length; j++) {
      x = x + matrix[i][j];
    }
    sum.add(x);
  }
  return sum;
}


createSumColumn (List matrix) {
  List<int> sum = [];
  for (var i = 0; i < matrix[0].length; i ++) {
    var x = 0;
    for (var j = 0; j < matrix.length; j++) {
      x = x + matrix[j][i];
    }
    sum.add(x);
  }
  return sum;
}


smallestValue(List<int> list) {
  return list.reduce(min);
}

largestValue(List<int> list) {
  return list.reduce(max);
}