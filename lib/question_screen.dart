import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelect});

  final void Function(String answer) onSelect;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelect(answer);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];
    return Container(
      margin: EdgeInsets.all(50),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.montserrat(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.shuffledAnswers.map((q) {
            // add a margin between buttons
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: AnswerButton(
                text: q,
                function: () {
                  answerQuestion(q);
                },
              ),
            );
            // return AnswerButton(
            //   text: q,
            //   function: () {
            //     answerQuestion(q);
            //   },
            // );
          })
        ],
      ),
    );
  }
}
