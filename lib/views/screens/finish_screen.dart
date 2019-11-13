import 'package:duolengua/views/widgets/lesson_button.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class FinishScreen extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: CircularPercentIndicator(
                radius: 120,
                percent: 1,
                animationDuration: 2000,
                backgroundColor: Colors.yellowAccent,
                progressColor: Colors.yellowAccent,
                center: null,
                animation: true,
                lineWidth: 20,
                footer: Container(
                  child: Text("Nivel Completado",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: 200,
              child: LessonButton(title: "Salir",color: Colors.green,textColor: Colors.white,onPressed: (){
                Navigator.of(context).pop();
              },),
            )
          ],
        ),
      ),
    );
  }
}