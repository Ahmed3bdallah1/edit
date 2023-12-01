import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle(double size, Color color, FontWeight fontWeight) {
  return GoogleFonts.poppins(
      fontSize: size, color: color, fontWeight: fontWeight);
}

class ReusableAdjustedText extends StatelessWidget {
  final String message;
  final double size;
  final Color? color;
  final FontWeight? fontWeight;

  const ReusableAdjustedText(
      {super.key,
      required this.message,
      required this.size,
      this.color,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: appStyle(
          size, color ?? Colors.black, fontWeight ?? FontWeight.normal),
    );
  }
}

class ReusableBigText extends StatelessWidget {
  final String message;

  const ReusableBigText({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(message,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }
}

class ReusableBigTextWhite extends StatelessWidget {
  final String message;

  const ReusableBigTextWhite({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(message,
        style: const TextStyle(fontSize: 20, color: Colors.white));
  }
}

class ReusableSmallText extends StatelessWidget {
  final String message;

  const ReusableSmallText({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(message, style: const TextStyle(fontSize: 12));
  }
}
