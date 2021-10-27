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

  Widget signInButton(BuildContext context) => ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 24,
          primary: Colors.white,
          shadowColor: Colors.white38,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
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
            color: Colors.black87,
          ),
        ),
      );

  Widget heading() => Column(
        children: [
          Text(
            'Welcome to',
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          Text(
            'Shareminder',
            style: GoogleFonts.roboto(
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      );
}
