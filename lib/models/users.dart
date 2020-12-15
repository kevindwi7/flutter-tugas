part of 'models.dart';

class Users extends Equatable {
  final String uid;
  final String email;
  final String name;
  final String profilePictures;

  Users(this.uid, this.email, {this.name, this.profilePictures});

  List<Object> get props => [uid, email, name, profilePictures];
}
