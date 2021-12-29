import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const MaterialColor anaRenk = Colors.indigo;

  static const String baslikText = 'Ortalama Hesapla';
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
      fontWeight: FontWeight.w900, fontSize: 24, color: anaRenk);
  static final TextStyle listtileStyle = GoogleFonts.quicksand(
      fontWeight: FontWeight.w500, fontSize: 16, color: anaRenk);
  static final TextStyle listtileTitleStyle = GoogleFonts.quicksand(
      fontWeight: FontWeight.w900, fontSize: 18, color: anaRenk);

  static BorderRadius borderRadius = BorderRadius.circular(16);
  static final TextStyle ortalamaGosterStyle = GoogleFonts.quicksand(
      fontWeight: FontWeight.w600, fontSize: 16, color: anaRenk);
  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
      fontWeight: FontWeight.w800, fontSize: 55, color: anaRenk);

  static final dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static final yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
