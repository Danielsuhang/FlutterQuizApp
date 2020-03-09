import 'package:flutter/material.dart';
import 'package:my_flutter_app/landing_page.dart';

import './landing_page.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int numQuestions;

  ScorePage(this.score, this.numQuestions);

  @override 
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blue,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Your Score: ", style: new TextStyle(
              color: Colors.white, 
              fontWeight: FontWeight.bold, 
              fontSize: 50.0
            )
          ),
          new Text(score.toString() + "/" + numQuestions.toString(),
           style: new TextStyle(
              color: Colors.white, 
              fontWeight: FontWeight.bold, 
              fontSize: 50.0
            )
          ),
          new IconButton(
            icon: new Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new LandingPage()), (Route route) => route == null),
          )
        ],)
    );
  }
}