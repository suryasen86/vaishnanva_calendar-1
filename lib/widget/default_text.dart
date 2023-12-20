import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultText extends StatefulWidget {
  const DefaultText({super.key});

  @override
  State<DefaultText> createState() => _DefaultTextState();
}

class _DefaultTextState extends State<DefaultText> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Hare Krishna\nHare Krishna\nKrishna Krishna\nHare Hare\n Hare Rama\nHare Rama\nRama Rama\nHare Hare",
        style: GoogleFonts.roboto(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(159, 158, 158, 158),
            height: 1.4,
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
