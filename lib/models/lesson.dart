import 'package:duolengua/models/word.dart';

class Lesson {

  final String Question;
  final String Answer;
  final bool WithImages;
  final List<Word> Words;

  Lesson(this.Question, this.Answer, this.WithImages, this.Words);


}