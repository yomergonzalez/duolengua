import 'package:duolengua/providers/nivel.dart';
import 'package:duolengua/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: (context) => Nivel(),
        child: MaterialApp(
          title: 'Duolengua',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Home(),
        ));
  }
}
