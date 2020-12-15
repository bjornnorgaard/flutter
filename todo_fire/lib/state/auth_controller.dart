import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var _auth = FirebaseAuth.instance;
  var _user = Rx<User>();

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  void createUser(String email, String password) {
    // Create user in firebase.
  }
}
