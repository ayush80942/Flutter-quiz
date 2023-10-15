import 'package:flutter/material.dart';
import 'package:first_app/answer_button.dart';
import 'package:first_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer,});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionsScreenIndex = 0;

  void answerQuestions(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      questionsScreenIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionsScreenIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(146, 255, 255, 255),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            ...currentQuestion.getShuffledAnswers().map((answers) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnswerButton(
                  answerText: answers,
                  onTap: () {
                    answerQuestions(answers);
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}