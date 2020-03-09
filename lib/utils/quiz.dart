import './questions.dart';

class Quiz {
  List<Question> _questions;
  int _currentQuestionIndex = 0 ;
  int _score = 0;

  Quiz(this._questions) {
    _questions.shuffle();
  }


  List<Question> get questions => _questions;
  int get length => _questions.length;
  int get questionNumber => _currentQuestionIndex;
  int get score => _score;

  Question get nextQuestion {
    if (_currentQuestionIndex >= length) return null;
    return _questions[_currentQuestionIndex++];
  }

  bool done() {
    return _currentQuestionIndex == length;
  }

  void answer(bool isCorrect) {
    if (isCorrect) _score++;
  }
}