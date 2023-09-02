import 'package:first_app/data/questions.dart';
import 'package:first_app/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer, required this.restartScreen});

  final List<String> chosenAnswer;
  final void Function() restartScreen;

  List<Map<String, Object>> getSummaryData () {
    List<Map<String, Object>> summary = [];

    for(var i=0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i+1,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalAnswer = questions.length;
    final numCorrectAnswer = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You have answered $numCorrectAnswer of $numTotalAnswer questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(146, 255, 255, 255),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: () {
                restartScreen();
              },
              icon: const Icon(Icons.restart_alt, color: Colors.white),
              label: Text('Restart Quiz!!',style: GoogleFonts.lato(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
