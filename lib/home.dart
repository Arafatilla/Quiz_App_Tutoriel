

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const  Home(this.switchScreen,{super.key});

final void Function()switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/think.png', height: 200, width: 200),
          const SizedBox(
            height: 20,
          ),
          const Text("Think well!!!",
              style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0))),
       
         const SizedBox(
            height: 100,
          ),
       ElevatedButton.icon(
        style: OutlinedButton.styleFrom(foregroundColor:Color.fromARGB(255, 9, 24, 230) ),
        onPressed: switchScreen,
        label: const Text("Start Quiz"),
        icon: const Icon(Icons.arrow_right),
        ),
          
        ],
      ),
    );
  }
}
