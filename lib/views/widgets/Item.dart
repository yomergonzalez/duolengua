import 'package:duolengua/models/word.dart';
import 'package:duolengua/providers/nivel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_audio_player/flutter_audio_player.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' as rootBundle;

class Item extends StatefulWidget {


  bool image;
  Word word;

  Item({Key key, @required this.image, @required this.word});

  @override
  State createState() {
    return _Item();
  }
}


class _Item extends State<Item>{

  Nivel nivel;
  bool selected = false;


  @override
  Widget build(BuildContext context) {

    nivel = Provider.of<Nivel>(context);
    if(nivel.itemSelected == widget.word.title){
      selected = true;
    }else{
      selected = false;
    }

    return (widget.image)? WithImage() : WithoutImage();
  }


  WithImage(){

    return GestureDetector(
      onTap: (){
        nivel.itemSelected = widget.word.title;
        _playSound();
      },
      child: Container(
        padding: EdgeInsets.all(10),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: selected? Border.all(color: Colors.blue,width: 2.0): Border.all(color: Colors.grey,width: 2.0),
          color: selected? Colors.blue[200] : Colors.transparent
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(5),
                child: Image.asset(widget.word.image)
            ),
            Container(
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
                child: Text(widget.word.title)
            )
          ],

        ),
      ),
    );

  }

  WithoutImage(){
    return GestureDetector(
      onTap: (){
        nivel.itemSelected = widget.word.title;
        _playSound();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: selected? Border.all(color: Colors.blue,width: 2.0): Border.all(color: Colors.grey,width: 2.0),
            color: selected? Colors.blue[200] : Colors.transparent
        ),
        child:  Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(widget.word.title)
        ),
      ),
    );

  }


  void _playSound() async {

    AudioPlayer.addSound(widget.word.song);

  }

}
