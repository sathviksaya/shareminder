import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/models/user.dart';
import '/utils/google_auth.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            backButton(context),
            displayInfo(context),
            logoutButton(context),
            creaters(),
          ],
        ),
      ),
    );
  }

  Widget displayInfo(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          displayPic(context),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              Info.name ?? 'nope',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Text(
            Info.email ?? 'nope',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.normal,
              fontSize: 15,
              color: Colors.black54,
            ),
          ),
        ],
      );

  Widget displayPic(BuildContext context) {
    Widget image1, image2;
    image1 = Container(
      color: Colors.white,
      child: Image.network(
        Info.imgUrl ?? 'https://dunnvision.com/files/2019/05/Profile-512.png',
        height: MediaQuery.of(context).size.shortestSide * 0.3,
        fit: BoxFit.cover,
      ),
    );
    image2 = Image.asset(
      'assets/images/user.png',
      height: MediaQuery.of(context).size.shortestSide * 0.3,
      fit: BoxFit.cover,
    );
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ClipOval(
          child: image2,
        ),
        ClipOval(
          child: image1,
        ),
      ],
    );
  }

  Widget backButton(BuildContext context) => Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: IconButton(
              color: Colors.black87,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      );

  Widget creaters() => Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          'Created by Supreet & Sathvik',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.normal,
            fontSize: 12,
            color: Colors.black38,
          ),
        ),
      );

  Widget logoutButton(BuildContext context) => TextButton(
        style: TextButton.styleFrom(
          primary: Colors.red[300],
        ),
        onPressed: () {
          signOut(context);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.logout,
              color: Colors.red[300],
            ),
            const SizedBox(
              width: 15,
            ),
            const Text('Logout'),
          ],
        ),
      );
}
