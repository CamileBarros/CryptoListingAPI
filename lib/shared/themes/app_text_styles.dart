import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class TextStyles {
  static final titlePrimary = GoogleFonts.lexendDeca(
      fontSize: 32, fontWeight: FontWeight.w700, color: AppColors.textPrimary);

  static final titleText = GoogleFonts.lexendDeca(
      fontSize: 21, fontWeight: FontWeight.w700, color: AppColors.textPrimary);

  static final initialsText = GoogleFonts.sourceSansPro(
      fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.textPrimary);

  static final linkText = GoogleFonts.sourceSansPro(
      fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.brandPrimary);

  static final smallText = GoogleFonts.sourceSansPro(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.textSecondary);
}
