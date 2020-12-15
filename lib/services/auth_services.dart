part of 'services.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<String> signup(
      String email, String password, String name) async {
    await Firebase.initializeApp();
    String msg = "";
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Users users = result.user.convertToUser(name: name);
      auth.signOut();
      await UserServices.updateUser(users);
      msg = "success";
    } catch (e) {
      msg = e.toString();
    }
    return msg;
  }

  static Future<String> signin(String email, String password) async {
    await Firebase.initializeApp();
    String msg = "";
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() => msg = "success");
    } catch (e) {
      msg = e.toString();
    }
    return msg;
  }

  static Future<bool> signOut() async {
    bool result = false;
    await auth.signOut().whenComplete(
          () => result = true,
        );
    return result;
  }
}
