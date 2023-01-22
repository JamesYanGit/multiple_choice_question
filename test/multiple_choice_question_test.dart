import 'package:multiple_choice_question/src/mc_question.dart';
import 'package:test/test.dart';

void main() {
  group('MCQuestion', () {
    List<String> choices = ["A", "B", "C"];
    String category = "A,B or C";
    String text = "Is is A,B or C?";

    int c = 2;

    late MCQuestion question;

    setUp(() {
      question = MCQuestion(category, text, choices, c);
    });

    test('test correct index on declaration', () {
      expect(question.correctIndex, 2);
    });

    test('correct index too low on creation throws RangeError', () {
      expect( () => MCQuestion(category, text, choices, -1), throwsA(isRangeError));
    });

    test('correct index too high on creation throws RangeError', () {
      expect( () => MCQuestion(category, text, choices, 3), throwsA(isRangeError));
    });

    test('test correct index works after random shuffle', () {
      String correctText = question.getChoice(question.correctIndex);

      //Everyday I'm shuffling (until the choice at idx 2 moves)
      while (question.getChoice(question.correctIndex) == correctText) {
        question.shuffle();
      }
      expect(question.correctIndex, isNot(2));
    });
  });
}
