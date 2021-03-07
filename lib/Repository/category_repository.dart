import 'package:budget/Model/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as cf;

class CategoryRepository {
  cf.CollectionReference categoriesCollectionReference =
      cf.FirebaseFirestore.instance.collection('categories');

  Future<List<Category>> getCategoryList() async {
    cf.QuerySnapshot snapshot = await categoriesCollectionReference.get();
    List<Category> categoryList = 
      snapshot.docs.map((doc) => Category.from(doc)).toList();

    return categoryList;
  }
}
