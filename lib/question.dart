import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/models/answers_button.dart';
import 'package:google_fonts/google_fonts.dart';

class Question extends StatefulWidget {
  const Question(this.onSelectedAnswer, {super.key});
  final void Function(String) onSelectedAnswer;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  var currentQuestionIndex = 0;

  //here is the new function
  void answerQuestion(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // First one
          Text(
            currentQuestion.text,
            textAlign: TextAlign.center,
            style: GoogleFonts.laila(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          // Mapping over the answers to create buttons instead of repeating the code 1000000 times
          //the three dotes are the spread operator which sperates teh elements of the list into single element
          ...currentQuestion.shuffledAnswers.map((e) {
            return Column(
              children: [
                AnswerButton(e, () => answerQuestion(e)),
                const SizedBox(
                  height: 30,
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
