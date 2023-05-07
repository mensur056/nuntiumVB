import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollection {
  news,
  tag,
  version,
  category;

  CollectionReference get referance => FirebaseFirestore.instance.collection(name);
}
