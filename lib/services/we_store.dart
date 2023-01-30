import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wefit/services/we_auth.dart';

class WeStore {
  static WeStore? _instance;
  static WeStore get instance => _instance ??= WeStore();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  CollectionReference? reference;
  initReference() {
    reference = _db.collection('users');
  }

  static Future add(Map<String, dynamic> data,
      {String? endPoint, bool newuser = false, String? id}) async {
    if (newuser) {
      await instance._db
          .collection('all-users')
          .doc(WeAuth.instance.auth.currentUser!.email)
          .set(data);
    } else {
      await instance._db
          .collection('all-users')
          .doc(WeAuth.instance.auth.currentUser!.email)
          .collection(endPoint!)
          .doc(id)
          .set(data);
    }
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> get(
      {String? endPoint, bool fromRoot = false}) async {
    if (fromRoot) {
      return await instance._db.collection('all-users').get();
    } else {
      return await instance._db
          .collection('all-users')
          .doc(WeAuth.instance.auth.currentUser!.email)
          .collection(endPoint!)
          .get();
    }
  }

  static Future<String> uploadPhoto(String fileName, File file) async {
    final path = 'files/$fileName';
    final ref = instance._storage.ref().child(path);
    final uploadTask = ref.putFile(file);
    final snapshot = await uploadTask.whenComplete(() {});
    final downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }
}
