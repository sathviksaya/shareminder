import '../models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> checkAuth() async {
  SharedPreferences shRef = await SharedPreferences.getInstance();

  bool? signedIn = shRef.getBool('signed');

  if (signedIn == null || signedIn == false) {
    return false;
  }

  Info.name = shRef.getString('name');
  Info.email = shRef.getString('email');
  Info.imgUrl = shRef.getString('imgUrl');

  return true;
}

Future<void> setAuth({
  required bool signedIn,
}) async {
  SharedPreferences shRef = await SharedPreferences.getInstance();

  await shRef.setBool('signed', signedIn);
}

Future<void> storeDetails({
  required String name,
  required String email,
  required String imgUrl,
}) async {
  SharedPreferences shRef = await SharedPreferences.getInstance();

  await shRef.setString('name', name);
  await shRef.setString('email', email);
  await shRef.setString('imgUrl', imgUrl);
}
