import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/main.dart';
import 'package:first_app/Profile.dart';
import 'package:flutter/material.dart';


Future<void> userSetup(String Fullname, String Username ) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  users.doc(email).set({'Fullname': Fullname,'Username': Username, 'uid': uid});
  return;
}
// Future<void>getUserId(String email) async{
//   FirebaseFirestore.instance
//       .collection('Users')
//       .doc(email)
//       .get()
//       .then((DocumentSnapshot documentSnapshot) {
//     if (documentSnapshot.exists) {
//       if(documentSnapshot.data().containsKey)
//      username = documentSnapshot.data()('Username');
//     }
//   });
// }
// class AddUser extends StatelessWidget {
//   final String FullName;
//   final String Username;
//
//
//   AddUser(this.FullName, this.Username);
//
//   @override
//   Widget build(BuildContext context) {
//     // Create a CollectionReference called users that references the firestore collection
//     CollectionReference users = FirebaseFirestore.instance.collection('Users');
//
//     Future<void> addUser() {
//       // Call the user's CollectionReference to add a new user
//       return users
//           .add({
//         'full_name': FullName,
//         'user_name': Username,
//
//       })
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }
//
//     return TextButton(
//       onPressed: addUser,
//       child: Text(
//         "Add User",
//       ),
//     );
//   }
// }