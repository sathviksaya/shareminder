import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../widgets/dialog_head.dart';
import '../widgets/memeber_card.dart';

class DisplayMembers extends StatelessWidget {
  final String groupRef;
  const DisplayMembers({Key? key, required this.groupRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: 500,
        width: 450,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Column(
            children: [
              const DialogHead(heading: 'Members'),
              membersList(context, groupRef),
            ],
          ),
        ),
      ),
    );
  }

  Widget membersList(BuildContext context, String groupRef) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('groups')
          .doc(groupRef)
          .collection('members')
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.hasError) {
          return const Expanded(
            child: Center(
              child: SpinKitFadingCircle(
                size: 20,
                color: Colors.black54,
              ),
            ),
          );
        }
        log(groupRef);
        if (snapshot.data!.docs.isEmpty) {
          return const Expanded(
            child: Center(
              child: Text(
                'Something went wrong..',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }
        return Expanded(
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            // shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (itemBuilder, index) {
              var data = snapshot.data!.docs[index];
              return Column(
                children: [
                  displayMember(
                    data['name'],
                    data['email'],
                    data['imgUrl'],
                    data['admin'],
                  ),
                  const Divider(
                    thickness: 0.5,
                    endIndent: 20,
                    indent: 20,
                    color: Colors.black12,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget displayMember(String name, String email, String imgUrl, bool isAdmin) {
    return MemberCard(
      name: name,
      email: email,
      imgUrl: imgUrl,
      isAdmin: isAdmin,
    );
  }
}
