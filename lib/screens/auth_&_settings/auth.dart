import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/utils/google_auth.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            heading(),
            Image.asset(
              "assets/images/greetings.png",
              height: MediaQuery.of(context).size.shortestSide * 0.6,
            ),
            signInButton(context),
          ],
        ),
      ),
    );
  }

  Widget signInButton(BuildContext context) => TextButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 24,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Colors.white),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 15,
          ),
        ),
        onPressed: () async {
          await signInWithGoogle(context);
        },
        icon: Image.asset(
          "assets/images/google.png",
          height: 20,
        ),
        label: const Text(
          "SignIn With Google",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );

  Widget heading() => Column(
        children: [
          Text(
            '_ Welcome to',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white60,
            ),
          ),
          Text(
            'Shareminder',
            style: GoogleFonts.pacifico(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      );
}
