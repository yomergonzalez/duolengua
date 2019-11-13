import 'package:duolengua/views/screens/practice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Module extends StatefulWidget {

  final String name;

  Module({ Key key, @required this.name});

  @override
  State createState() {
    return _Module();
  }


}


class _Module extends State<Module> with SingleTickerProviderStateMixin {

  bool selected = false;
  bool _visible = false;
  Animation<double> animation;
  AnimationController controller;
  double _width;
  double _height;

  @override
  void initState() {
    super.initState();
    
    _width = 0;
    _height = 0;

  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      GestureDetector(
        onTap: _selected,
        child: buildCircularPercentIndicator(),
      ),
      ContainerLevel()
    ],);
  }

  _selected() {
    setState(() {
      selected =  (selected)? false : true;

      if(selected){
        _width = 300;
        _height = 140;
      }else{
        _width = 0;
        _height= 0;
      }
    });
  }


  Widget ContainerLevel() {
    return Visibility(
        visible: true,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(vertical: 10),
          height: _height,
          width: _width,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent[200],
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: ListView(
                    children: <Widget>[
                      Text("Nivel 1/2", style: TextStyle(color: Colors.white,fontSize: 16.0, fontWeight: FontWeight.bold),),
                      Text("Lección 1/2", style: TextStyle(color: Colors.white,fontSize: 16.0, fontWeight: FontWeight.normal),),
                      Divider(height: 10,),
                      MaterialButton(
                        onPressed: (){

                          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=> new Practice()));

                        },
                        elevation: 4,
                        shape: RoundedRectangleBorder(side:BorderSide(color: Colors.deepPurple,width: 1),borderRadius: BorderRadius.all(Radius.circular(20))),
                        padding: EdgeInsets.all(10),
                        color: Colors.deepPurpleAccent[200],
                        splashColor: Colors.deepPurple,
                        child: Text("Empezar",style: TextStyle(color: Colors.white,fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ),

                    ],

                  ),
                )
              ],
            ),
          ),
        )
      );
    }


  CircularPercentIndicator buildCircularPercentIndicator() {
    return CircularPercentIndicator(
      radius: 120,
      percent: 0.3,
      backgroundColor: Colors.grey[300],
      progressColor: Colors.green,
      center: Container(
        width: 90,
        height: 90,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.deepPurpleAccent
        ),
        child: Image.asset('assets/images/dinosaur.png', width: 70, height: 70,),
      ),
      lineWidth: 9,
      footer: Container(
        child: Text("Intro",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


}