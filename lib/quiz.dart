import 'package:flutter/material.dart';
import 'package:fromzero/data/questions.dart';
import 'package:fromzero/questions_screen.dart';
import 'package:fromzero/results_screen.dart';
import 'package:fromzero/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];

  String activeScreen = 'start-screen';
  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        // selectedAnswer = [];
        activeScreen = 'results-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = activeScreen == 'start-screen' ? StartScreen(switchScreen) : QuestionsScreen(onSelectAnswer: chooseAnswer);
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswer,
        restartQuiz: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: screenWidget,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 87, 34, 177),
                Color.fromARGB(222, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }
}
