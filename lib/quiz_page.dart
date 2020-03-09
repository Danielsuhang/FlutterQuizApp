import 'package:flutter/material.dart';

import 'utils/questions.dart';
import 'utils/quiz.dart';

import 'ui/answer_button.dart';
import 'ui/question_test.dart';
import 'ui/correct_wrong_overlay.dart';

import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();

}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Elon Musk is human", false),
    new Question("Pizza is healthy", false),
    new Question("Flutter is awesome", true)
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overLayVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber; 
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overLayVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( 
          children: <Widget>[
           new AnswerButton(true, () => handleAnswer(true)
            ),
           new QuestionTest(questionText, questionNumber),
           new AnswerButton(false, () => handleAnswer(false)
           )
          ]
        ),
        overLayVisible ? new CorrectWrongOverlay(isCorrect,
         () {
           if (quiz.done()) {
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
           } else {
              currentQuestion = quiz.nextQuestion; 
              this.setState(() {
              overLayVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
              });
           }
          }
          ) : new Container()
      ],
    );
  }
}