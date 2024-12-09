
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_quiz_app/home.dart';
import 'package:flutter_quiz_app/models/result.dart';
import 'package:flutter_quiz_app/question.dart';
import 'data/questions.dart';
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}
Widget? activeScreen;
class _QuizState extends State<Quiz> {
 
 List<String> selectedAnswers =[];
  

  void chooseAnswer(String answer){
  
   log(answer);
    selectedAnswers.add(answer);


    if(selectedAnswers.length == questions.length){

      setState(() {
        activeScreen =  Result(selectedAnswers , restart);
        selectedAnswers = [];
      });
    }
    log(selectedAnswers.toString());
  }
 

  


@override
  void initState() {
   
    super.initState();
     activeScreen =  Home(switchScreen);
  }

// here is the function 

void switchScreen(){
  setState(() {
    
  activeScreen = Question(chooseAnswer);
  });
}

void restart(){
  setState(() {
  selectedAnswers =[];
  activeScreen = Home(switchScreen);
    
  });
}

  @override
  Widget build(BuildContext context) {
     // here is the widget (MyApp)
    // the quiz file became like the main file 
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 2, 118, 212), Color.fromARGB(255, 32, 189, 181)],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
  