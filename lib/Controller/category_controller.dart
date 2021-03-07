import 'package:budget/Model/category.dart';
import 'package:budget/Repository/category_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  CategoryRepository _categoryRepo = CategoryRepository();

  var categoryList = List<Category>().obs;
  int get categoryCount => categoryList.length;

  @override
  void onInit() {
    super.onInit();
    fetchCategoryList();
  }

  void fetchCategoryList() async {
    var categoryListResult = await _categoryRepo.getCategoryList();

    categoryList.assignAll(categoryListResult);
  }

  Category fetchCategoryFromDocRef(DocumentReference docRef) {
    Category category;

    if (categoryList.length > 0) {
      category = categoryList
          .where((category) => (category.docRef == docRef)).first;
    }

    return category;
  }
}
