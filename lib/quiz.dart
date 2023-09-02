import 'package:first_app/questions_screen.dart';
import 'package:first_app/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_app/start_screen.dart';
import 'package:first_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';  
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'start-screen';
      selectedAnswer = [];
    });
  }

  @override
  Widget build(context) {
    Widget screenWidegt = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidegt = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidegt = ResultScreen(chosenAnswer: selectedAnswer, restartScreen: restartQuiz,);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 8, 23, 96),
                Color.fromARGB(255, 165, 43, 187),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidegt,
        ),
      ),
    );
  }
}