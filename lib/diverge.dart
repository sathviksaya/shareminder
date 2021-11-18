import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'utils/page_surf.dart';
import 'utils/shared_prefs.dart';
import 'screens/auth_&_settings/auth.dart';
import 'screens/home_screen/home.dart';

class Diverge extends StatefulWidget {
  const Diverge({Key? key}) : super(key: key);

  @override
  _DivergeState createState() => _DivergeState();
}

class _DivergeState extends State<Diverge> {
  void divergeScreen() async {
    bool signedIn = await checkAuth();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (signedIn) {
          replacePage(context, Home());
        } else {
          replacePage(context, const Auth());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    divergeScreen();
    return Scaffold(
      backgroundColor: Colors.grey[900],   
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon_white.png',
              height: 150,
            ),
            const SizedBox(height: 20),
            const SpinKitFadingCircle(
              color: Colors.white38,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
