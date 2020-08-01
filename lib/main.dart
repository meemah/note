import 'package:flutter/material.dart';
import 'package:notepad/database/note_dao.dart';
import 'package:notepad/database/note_database.dart';
import 'package:notepad/home_screen.dart';
import 'package:notepad/styles.dart';

void main() async {
 
        
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
 
        primarySwatch: Colors.blue,
        // primaryColor: kPrimaryColor,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen()
    );
  }
}

