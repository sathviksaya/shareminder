import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final String email;
  final String imgUrl;
  final bool isAdmin;
  const MemberCard({
    Key? key,
    required this.name,
    required this.email,
    required this.imgUrl,
    required this.isAdmin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 15),
          displayPic(),
          const SizedBox(width: 10),
          displayName(context),
        ],
      ),
    );
  }

  Widget displayPic() {
    Widget image1, image2;
    image1 = Container(
      color: Colors.white,
      child: Image.network(
        imgUrl,
        height: 50,
        fit: BoxFit.cover,
      ),
    );
    image2 = Image.asset(
      'assets/images/user.png',
      height: 50,
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

  Widget displayName(BuildContext context) => Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    name,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                if (isAdmin)
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: displayAdmin(),
                  ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                email,
                softWrap: false,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white38,
                ),
              ),
            ),
          ],
        ),
      );

  Widget displayAdmin() => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.greenAccent),
        ),
        child: Text(
          "Admin",
          style: GoogleFonts.roboto(
            color: Colors.greenAccent,
            fontSize: 10,
            fontWeight: FontWeight.w300,
          ),
        ),
      );
}
