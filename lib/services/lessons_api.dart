import 'package:duolengua/models/lesson.dart';
import 'package:duolengua/models/word.dart';

class LessonsAPI {

  Map<int,List<Lesson>> _lessons = {
    1: [ Lesson("Como se dice Perro","Dog",false,[
      Word("Bear","assets/images/oso.png","assets/songs/bear.mp3"),
      Word("Dog","assets/images/perro.png","assets/songs/dog.mp3"),
      Word("Butterfly","assets/images/mariposa.png","assets/songs/butterfly.mp3"),
      Word("Bull","assets/images/toro.png","assets/songs/bull.mp3")
    ] ),
      Lesson("Como se dice Mariposa","Butterfly",true,[
        Word("Bear","assets/images/oso.png","assets/songs/bear.mp3"),
        Word("Bull","assets/images/toro.png","assets/songs/bull.mp3"),
        Word("Butterfly","assets/images/mariposa.png","assets/songs/butterfly.mp3"),
        Word("Dog","assets/images/perro.png","assets/songs/dog.mp3")
      ] )],

    2: [ Lesson("Como se dice Toro","Bull",true,[
      Word("Bear","assets/images/oso.png","assets/songs/bear.mp3"),
      Word("Dog","assets/images/perro.png","assets/songs/dog.mp3"),
      Word("Bull","assets/images/toro.png","assets/songs/bull.mp3"),
      Word("Butterfly","assets/images/mariposa.png","assets/songs/butterfly.mp3")
    ] ),
      Lesson("Como se dice Oso","Bear",false,[
        Word("Bull","","assets/songs/dog.mp3"),
        Word("Bear","","assets/songs/bear.mp3"),
        Word("Butterfly","","assets/songs/butterfly.mp3"),
        Word("Dog","","assets/songs/dog.mp3")
      ] )],
  };

  List<Lesson> getLessons(int level){
    return _lessons[level];
  }



}