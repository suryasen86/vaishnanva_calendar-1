import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

dateDetails(String header, String value) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        header,
        style: GoogleFonts.roboto(
          textStyle: const TextStyle(
            color: Color(0xFF95928B),
            fontSize: 13,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.24,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 5),
        child: Text(
          value,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              color: Color(0xFF767676),
              fontSize: 15,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.24,
            ),
          ),
        ),
      ),
    ],
  );
}

muhurtaDetails(String header, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        header,
        style: GoogleFonts.roboto(
          textStyle: const TextStyle(
            color: Color(0xff95928B),
            fontWeight: FontWeight.w400,
            fontSize: 13,
            letterSpacing: -0.24,
          ),
        ),
      ),
      Text(
        value,
        style: GoogleFonts.roboto(
          textStyle: const TextStyle(
            color: Color(0xff767676),
            fontWeight: FontWeight.w500,
            fontSize: 13,
            letterSpacing: -0.24,
          ),
        ),
      )
    ],
  );
}
