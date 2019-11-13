import 'package:duolengua/providers/nivel.dart';
import 'package:duolengua/services/lessons_api.dart';
import 'package:duolengua/views/widgets/lesson_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';


class Practice extends StatelessWidget{

  PageController _controller = PageController(initialPage: 0);


  @override
  Widget build(BuildContext context) {

    Provider.of<Nivel>(context,listen: false).getLessons();

    Provider.of<Nivel>(context,listen: false).resetLessons();

    return Scaffold(
        body: Column(
          children: <Widget>[
            SafeArea(
              top: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 40,
                    width: 40,
                    child: GestureDetector(onTap: (){ Navigator.of(context).pop();},child: Icon(Icons.close,size: 30,color: Colors.black26,)),
                  ),
                  Expanded(
                   child: Container(
                     margin: EdgeInsets.all(5),
                     height: 40,
                     width:400,
                     child: Consumer<Nivel>(builder: (context,Nivel nivel,child){
                       return LinearPercentIndicator(
                           percent: (nivel.currentPage /nivel.listLessons.length ).toDouble(),
                           lineHeight: 15,
                           animationDuration: 500,
                           animation: true,
                           progressColor: Colors.green,
                           );
                     }),
                   ),
                  )

                ],
              ),
            ),
            Expanded(
              child:Consumer<Nivel>(builder: (context,Nivel nivel,child){
                return PageView.builder(
                  itemBuilder:(BuildContext context, int page){
                    return LessonPage(lesson: nivel.listLessons[page],controller: _controller,);
                  },
                  //physics: NeverScrollableScrollPhysics(),
                  controller: _controller,
                  itemCount: nivel.listLessons.length,
                );
              })
              ,
            )
          ],
        ),
      );
  }
}