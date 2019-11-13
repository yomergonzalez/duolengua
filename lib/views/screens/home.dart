import 'package:duolengua/views/widgets/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {


  @override
  State createState() {
      return _Home();
  }
}



class _Home extends State<Home> {


  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {


    final List<Widget> _children = [
      Center(child: Module(name: "Intro",),),
      Container(child: Text("2"),),
    ];

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon:Image.asset("assets/images/house4.png",width: 30,height: 30,),title: Text(""),
                activeIcon: Image.asset("assets/images/house1.png",width: 30,height: 30,),
            ),
            BottomNavigationBarItem(
                icon:Image.asset("assets/images/employee2.png",width: 30,height: 30,),
                activeIcon: Image.asset("assets/images/employee1.png",width: 30,height: 30,),
                title: Text("")),
          ],
        currentIndex: _selectedIndex,
        onTap: onTabTapped,
      ),
      body: _children[_selectedIndex]
    );


  }


  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }





}