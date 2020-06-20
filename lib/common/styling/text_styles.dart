import 'package:flutter/material.dart' show Colors;
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'app_colors.dart';

/// roboto 10
TextStyle subChatText = GoogleFonts.roboto(
  color: Colors.black,
  fontSize: ScreenUtil().setSp(10.0),
);

/// roboto 11
TextStyle shareButtonText = GoogleFonts.roboto(
  color: Colors.black,
  fontSize: ScreenUtil().setSp(11.0),
);

/// roboto medium 16
TextStyle shareTitleText = GoogleFonts.roboto(
  color: Colors.black,
  fontSize: ScreenUtil().setSp(16.0),
  fontWeight: FontWeight.w600,
);

/// proximaNova semiBold 15.0
TextStyle headline3 = GoogleFonts.montserrat(
    fontSize: ScreenUtil().setSp(15.0),
    fontWeight: FontWeight.w700,
    color: haiti,
    decoration: TextDecoration.none);

/// proximaNova 15.0
TextStyle subtitle1 = GoogleFonts.montserrat(
    fontSize: ScreenUtil().setSp(15.0),
    color: haiti,
    decoration: TextDecoration.none);

/// proximaNova 13.0
TextStyle body2 = GoogleFonts.montserrat(
    fontSize: ScreenUtil().setSp(13.0),
    color: haiti,
    decoration: TextDecoration.none);

/// proximaNova semiBold 14.0
TextStyle button = GoogleFonts.montserrat(
    fontSize: ScreenUtil().setSp(14.0),
    fontWeight: FontWeight.w700,
    color: Colors.white,
    decoration: TextDecoration.none);
