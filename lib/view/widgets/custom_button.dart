
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.height,
      required this.color,
      required this.width,
      required this.name,
      required this.onTap});

  final double height;
  final double width;
  final String name;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  color),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17)))),
          child: Text(name,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.white)),
        ));
  }
}
