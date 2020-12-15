part of 'services.dart';

class UserServices {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");
  static DocumentReference userDoc;
  static Reference ref;
  static UploadTask uploadTask;
  static String imageUrl;

  static Future<void> updateUser(Users users) async {
    userCollection.doc(users.uid).set({
      'uid': users.uid,
      'email': users.email,
      'name': users.name,
      'profilepicture': users.profilePictures ?? ""
    });
  }

  static Future updateProfilePicture(String uid, PickedFile imageFile) async {
    String fileName = uid + ".png";
    ref = FirebaseStorage.instance
        .ref()
        .child('assets/profilepictures')
        .child(fileName);
    uploadTask = ref.putFile(File(imageFile.path));
    await uploadTask.whenComplete(
        () => ref.getDownloadURL().then((value) => imageUrl = value));
    return userCollection
        .doc(uid)
        .update({
          'profilepicture': imageUrl,
        })
        .then((value) => true)
        .catchError((onError) => false);
  }
}
