import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../domain/post.dart';

class CreateModel {
  final _picker = ImagePicker();

  Future<File?> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      return File(image.path);
    }

    return null;
  }

  Future<void> uploadPost(String title, File image) async {

    final postRef = FirebaseFirestore.instance
        .collection('posts')
        .withConverter<Post>(
            fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
            toFirestore: (post, _) => post.toJson());

    final newPostRef = postRef.doc();


    final storage = FirebaseStorage.instance.ref().child('postImages/${newPostRef.id}.png');

    await storage.putFile(image);

    final imageUrl = await storage.getDownloadURL();

    newPostRef.set(
      Post(
        id: newPostRef.id,
        userId: FirebaseAuth.instance.currentUser?.uid ?? '',
        title: title,
        imageUrl: imageUrl,
        userName: FirebaseAuth.instance.currentUser?.displayName ?? '',
        userEmail: FirebaseAuth.instance.currentUser?.email ?? '',
      )
    );
  }
}
