import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogHead extends StatelessWidget {
  final String heading;
  final Color? headingColor;
  const DialogHead({Key? key, required this.heading, this.headingColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Text(
          heading,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: headingColor,
          ),
        ),
        const Spacer(),
        IconButton(
          splashRadius: 20,
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.close,
          ),
        ),
      ],
    );
  }
}
