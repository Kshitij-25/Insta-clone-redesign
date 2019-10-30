import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String profileImageUrl;
  final String username;
  final String email;
  final String bio;

  User({this.id, 
      this.name, 
      this.profileImageUrl, 
      this.username, 
      this.email,
      this.bio});

  factory User.fromDoc(DocumentSnapshot doc) {
    return User(
      id: doc?.documentID,
      name: doc['name'],
      profileImageUrl: doc['profileImageUrl'],
      username: doc['username'],
      email: doc['email'],
      bio: doc['bio'] ?? '',
    );
  }
}
