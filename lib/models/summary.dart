import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map((e) => Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor:
                              (e['Correct_answer'] == e['User_answer'])
                                  ? Colors.blueAccent
                                  : Colors.red[300],
                          child: Text(
                            ((e['question_index'] as int) + 1).toString(),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e['question'].toString(),
                                style: const TextStyle(
                                  color: Color.fromRGBO(212, 213, 216, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                e['Correct_answer'].toString(),
                                style: const TextStyle(
                                  color: Color.fromRGBO(20, 7, 201, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                e['User_answer'].toString(),
                                style: const TextStyle(
                                  color: Color.fromRGBO(228, 243, 10, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
