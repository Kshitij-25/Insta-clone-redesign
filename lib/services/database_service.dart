import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta_redesign/Models/user_model.dart';
import 'package:insta_redesign/util/constant.dart';

class DatabaseService {
  static void updateUser(User user) {
    usersRef.document(user.id).updateData({
      'name': user.name,
      'username': user.username,
      'email': user.email,
      'profileImageUrl': user.profileImageUrl,
      'bio': user.bio,
    });
  }

  static Future<QuerySnapshot> searchUsers(String name) {
    Future<QuerySnapshot> users =
        usersRef.where('name', isGreaterThanOrEqualTo: name).getDocuments();
    return users;
  }
}
