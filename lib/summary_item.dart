import 'package:adv_basics/question_identifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});
  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['correct_answer'] == itemData['user_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            questionIndex: itemData['question_index'] as int,
            isCorrectAnswer: isCorrectAnswer),
        SizedBox(width: 20),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text('Your Answer: ${itemData['user_answer']}',
                  style: GoogleFonts.montserrat(
                      color: const Color.fromARGB(255, 197, 95, 245))),
              Text('Correct Answer: ${itemData['correct_answer']}',
                  style: GoogleFonts.montserrat(
                      color: const Color.fromARGB(255, 95, 198, 245))),
            ],
          ),
        )),
      ],
    );
  }
}
