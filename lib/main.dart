import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_loaction.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      title: "World Time Application",
      initialRoute: '/',
      routes: {
        '/': (context)  => Loading(),
        '/home': (context) => Homepage(),
        '/location': (context) => ChooseLocation(),
      },
    );
  }
}
