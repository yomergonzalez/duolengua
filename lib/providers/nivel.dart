import 'dart:async';
import 'dart:core';
import 'package:duolengua/models/lesson.dart';
import 'package:duolengua/services/lessons_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_player/flutter_audio_player.dart';
import 'package:provider/provider.dart';


enum Evaluate { INITIAL , FAILED, SUCCESS }

class Nivel  with ChangeNotifier {


  LessonsAPI _lessonsAPI = LessonsAPI();



  int _currentLevel = 1;
  int _currentPage = 0;
  String _itemSelected;
  Lesson _currentLesson;

  List<Lesson> _listLessons;

  StreamController<Evaluate> _evaluationStream = new StreamController.broadcast();

  Stream<Evaluate> get StreamEvaluation => _evaluationStream.stream;

  List<Lesson> get listLessons => _listLessons;

  set listLessons(List<Lesson> value) {
    _listLessons = value;
  }

  Lesson get currentLesson => _currentLesson;

  String get itemSelected => _itemSelected;

  set itemSelected(String value) {
    _itemSelected = value;
    notifyListeners();
  }

  int get currentLevel => _currentLevel;

  set currentLevel(int value) {
    _currentLevel = value;
  }

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();

  }

  set currentLesson(Lesson value) {
    _currentLesson = value;
  }


  void resetLessons(){
    _currentPage = 0;
  }




  void getLessons(){
    _listLessons =  _lessonsAPI.getLessons(_currentLevel);
  }



  void ValidateLesson(){

    if(itemSelected == currentLesson.Answer){

      _evaluationStream.sink.add(Evaluate.SUCCESS);
      AudioPlayer.addSound('assets/songs/win.m4a');


    }else{

      listLessons.add(currentLesson);
      _evaluationStream.sink.add(Evaluate.FAILED);
      AudioPlayer.addSound('assets/songs/bad.mp3');

    }

  }



}