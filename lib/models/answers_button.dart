import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onPressed, {super.key });

  final String answerText;

  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 247, 252, 255),
        backgroundColor: const  Color.fromARGB(255, 122, 74, 231),
        padding: const EdgeInsets.fromLTRB(52 , 15 , 25 , 15 ),
       
      ),
       child: Text(answerText , style: const TextStyle(fontSize: 20),),

       );
  }
}
