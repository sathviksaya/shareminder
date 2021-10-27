import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/models/user.dart';
import '/screens/group_screen/group_screen.dart';
import '/shared/loading.dart';
import '/utils/page_surf.dart';
import '/utils/show_msg.dart';

void createGroup(
  BuildContext context,
  String groupName,
  String description,
) async {
  loading(context);

  if (groupName.trim().isEmpty) {
    showToast('Please enter group name');
    Navigator.pop(context);
    return;
  }

  log(groupName + '  ' + description);

  int time = DateTime.now().millisecondsSinceEpoch;
  String extension = (time / 1000).toStringAsFixed(0);

  log(time.toString() + '\n' + extension);

  FirebaseFirestore fbase = FirebaseFirestore.instance;

  String groupRef = Info.email! + '###' + extension;

  // Create group in groups
  await fbase.collection('groups').doc(groupRef).set({
    'groupName': groupName,
    'description': description,
    'groupId': Info.email,
    'extension': extension,
  });

  addUserToGroup(
    context,
    groupRef,
    groupName,
    description,
    create: true,
  );
}

void joinGroup(
  BuildContext context,
  String groupId,
  String extension,
) async {
  loading(context);

  if (groupId.trim().isEmpty || extension.trim().isEmpty) {
    showToast('Please enter Group Id and Extension');
    Navigator.pop(context);
    return;
  }

  String groupRef = groupId + '###' + extension;

  FirebaseFirestore fbase = FirebaseFirestore.instance;

  await fbase.collection('groups').doc(groupRef).get().then((value) async {
    if (value.exists) {
      await addUserToGroup(
        context,
        groupRef,
        value['groupName'],
        value['description'],
      );
    } else {
      showToast('No group found!');
      Navigator.pop(context);
    }
  });
}

Future<void> addUserToGroup(
  BuildContext context,
  String groupRef,
  String groupName,
  String description, {
  bool create = false,
}) async {
  FirebaseFirestore fbase = FirebaseFirestore.instance;

  bool isInGroup = false;

  String groupId = groupRef.split('###')[0];
  String extension = groupRef.split('###')[1];

  // Check if user already in group
  await fbase
      .collection('groups')
      .doc(groupRef)
      .collection('members')
      .doc(Info.email)
      .get()
      .then((value) {
    if (value.exists) {
      isInGroup = true;
    }
  });

  if (isInGroup) {
    Navigator.pop(context);
    Navigator.pop(context);
    pushPage(
      context,
      GroupScreen(
        groupId: groupId,
        groupName: groupName,
        extension: extension,
      ),
    );
    showToast('You are already in the group!');

    return;
  }

  // Add user into group members
  await fbase
      .collection('groups')
      .doc(groupRef)
      .collection('members')
      .doc(Info.email)
      .set({
    'email': Info.email,
    'name': Info.name,
    'imgUrl':
        Info.imgUrl ?? 'https://dunnvision.com/files/2019/05/Profile-512.png',
    'admin': create,
  });

  // Add group into user's group list
  await fbase
      .collection('users')
      .doc(Info.email)
      .collection('inGroups')
      .doc(groupRef)
      .set({
    'groupName': groupName,
    'description': description,
    'gorupRef': groupRef,
    'groupId': groupId,
    'extension': extension,
  });

  Navigator.pop(context);
  Navigator.pop(context);

  pushPage(
    context,
    GroupScreen(
      groupId: groupId,
      groupName: groupName,
      extension: extension,
    ),
  );

  showSnack(
    context,
    !create ? 'Joined group successfully!' : 'Group created successfully!',
    color: Colors.green,
    duration: 3,
  );
}

Future<void> leaveGroup(
  BuildContext context,
  String groupRef,
) async {
  loading(context);

  FirebaseFirestore fbase = FirebaseFirestore.instance;

  bool isAdmin = true;

  await fbase
      .collection('groups')
      .doc(groupRef)
      .collection('members')
      .doc(Info.email)
      .get()
      .then((value) {
    if (value.exists) {
      isAdmin = value['admin'];
    }
  });

  if (isAdmin) {
    log('user is admin');
    showSnack(
      context,
      'You cannot leave the group! As you are an Admin.',
      duration: 3,
      color: Colors.red,
    );
    Navigator.pop(context);
    Navigator.pop(context);
    return;
  }

  log('user is not admin');

  await fbase
      .collection('users')
      .doc(Info.email)
      .collection('inGroups')
      .doc(groupRef)
      .delete();

  await fbase
      .collection('groups')
      .doc(groupRef)
      .collection('members')
      .doc(Info.email)
      .delete();

  Navigator.pop(context);
  Navigator.pop(context);
  Navigator.pop(context);
}
