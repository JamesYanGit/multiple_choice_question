class MCQuestion {

  final String category;
  final String questionText;
  int correctIndex;

  final List<String> _choices;

  //using initializing formals
  MCQuestion(this.category, this.questionText, this._choices, this.correctIndex) {
    if (correctIndex < 0 || correctIndex >= _choices.length) {
      throw RangeError.index(correctIndex, _choices);
    }
  }

  String getChoice(int index)
  {
    if (index < 0 || index >= _choices.length) {
      throw RangeError.index(index, _choices);
    }
    else
    {
      return _choices[index];
    }

  }

  ///shuffle the choices
  void shuffle() {
    String correctText = _choices[correctIndex];

    _choices.shuffle();
    correctIndex = _choices.indexOf(correctText);

  }
}