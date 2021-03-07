import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final DocumentReference docRef;
  final String name;
  final bool isRollover;
  final bool isActive;

  Category({
    this.docRef,
    this.name,
    this.isRollover,
    this.isActive,
  });

  factory Category.from(DocumentSnapshot document) => Category(
    docRef: document.reference,
    name: document.data()['name'],
    isRollover: document.data()['isRollover'],
    isActive: document.data()['isActive'],
  );
}