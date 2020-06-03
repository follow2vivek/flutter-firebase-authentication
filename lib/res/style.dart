import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

final TextStyle styleToolbar = GoogleFonts.exo2(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
final TextStyle styleButtonText = GoogleFonts.exo2(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
final TextStyle styleTextFieldText = GoogleFonts.montserrat(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: colorBlack,
);
final TextStyle styleSmallText = GoogleFonts.montserrat(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: Color(0xff3a3a3a),
);
final InputDecoration styleInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  labelStyle: GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  fillColor: Colors.white,
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
  )
);
