import 'package:duolengua/models/lesson.dart';
import 'package:duolengua/providers/nivel.dart';
import 'package:duolengua/views/screens/finish_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:duolengua/providers/nivel.dart';
import 'Item.dart';
import 'lesson_button.dart';

class LessonPage extends StatefulWidget {
  Lesson lesson;
  PageController controller;

  LessonPage({Key key, @required this.lesson,@required this.controller});

  @override
  State createState() {
    return _LessonPage();
  }

}

class _LessonPage extends State<LessonPage> {


  @override
  void initState() {

    super.initState();
    Provider.of<Nivel>(context,listen: false).currentLesson = widget.lesson;
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      widget.lesson.Question,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Expanded(
                child: GridORList(),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Consumer<Nivel>(
                builder: (context,Nivel nivel,child){

                  return StreamBuilder(builder: (context,  snapshot){
                    switch(snapshot.data){


                      case Evaluate.SUCCESS:

                        return Container(
                          color: Colors.green,
                          padding: EdgeInsets.only(top: 20,bottom: 20),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                alignment: Alignment.centerLeft,
                                child: Text("Respuesta Correcta",style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),),),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                                child: LessonButton(
                                  title: "Siguiente",
                                  color: Colors.green,
                                  textColor: Colors.white,
                                  onPressed: nivel.itemSelected != null ? (){

                                    nivel.currentPage =widget.controller.page.toInt() +1;
                                    nivel.itemSelected = null;

                                    if(nivel.currentPage == nivel.listLessons.length){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> FinishScreen()));
                                    }else{
                                      widget.controller.nextPage(duration: Duration(milliseconds: 300),curve: Curves.ease);
                                    }


                                  } : null,
                                ),
                              ),
                            ],
                          ),
                        );

                        break;

                      case Evaluate.FAILED:

                        return Container(
                          color: Colors.red,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(top: 20,bottom: 20),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                alignment: Alignment.centerLeft,
                                child: Text("La respuesta correcta era: "+ widget.lesson.Answer,style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),),),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                                child: LessonButton(
                                  title: "Siguiente",
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  onPressed: nivel.itemSelected != null ? (){

                                    nivel.currentPage =widget.controller.page.toInt() +1;
                                    nivel.itemSelected = null;

                                    widget.controller.nextPage(duration: Duration(milliseconds: 300),curve: Curves.ease);


                                  } : null,
                                ),
                              ),
                            ],
                          )
                        );

                        break;


                      default:
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            margin:
                            EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                            child: LessonButton(
                              title: "Completar",
                              color: Colors.green,
                              textColor: Colors.white,
                              onPressed: nivel.itemSelected != null ? (){

                                nivel.ValidateLesson();


                              } : null,
                            ),
                          ),
                        );
                    }
                  }, stream:Provider.of<Nivel>(context).StreamEvaluation);
                },
              ),
            ],
          ),
        )
      ],
    );
  }


  Widget GridORList() {
    if (widget.lesson.WithImages) {
      return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.lesson.Words.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
          itemBuilder: (BuildContext context, int) {
            return Item(
                word: widget.lesson.Words[int],
                image: widget.lesson.WithImages);
          });
    } else {
      return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.lesson.Words.length,
          itemBuilder: (BuildContext context, int) {
            return Container(
              margin: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Item(
                  word: widget.lesson.Words[int],
                  image: widget.lesson.WithImages),
            );
          });
    }
  }




}
