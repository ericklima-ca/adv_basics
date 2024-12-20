import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.text, required this.function});
  final String text;
  final void Function() function;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            backgroundColor: Color.fromARGB(255, 33, 1, 95),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(color: Colors.white),
        ));
  }
}
