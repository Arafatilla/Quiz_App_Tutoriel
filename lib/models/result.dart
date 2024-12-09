import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/models/summary.dart';

class Result extends StatelessWidget {
  const Result(this.selectedAnswers, this.restart ,  {super.key});

  final void Function() restart;
  final List<String> selectedAnswers;

  // Here is the new function
  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'Correct_answer': questions[i].answers[0],
        'User_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    

    // Calculate the number of correct answers
    var numOfCorrectAnswers = summaryData
        .where((element) => element['User_answer'] == element['Correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Center(
        // Wrap Column with Center widget
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You answered $numOfCorrectAnswers questions out of ${questions.length} correctly!',
              style: const TextStyle(
                color: Color.fromRGBO(235, 245, 244, 1),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Summary(summaryData),
            const SizedBox(
              width: 10,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restart,
              label: const Text(
                'Restart quiz',
                style: TextStyle(
                  color: Color.fromARGB(255, 103, 209, 138),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: const Icon(
                Icons.restart_alt,
                color: Color.fromARGB(255, 103, 209, 138),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
