import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuntium/data/model/responses/category_model.dart';

class HomeDetailLogic {
  final TextEditingController titleController = TextEditingController();
  CategoryModel? _categoryModel;
  Uint8List? selectedImage;
  Future<void> pickImage() async {
    final pickerImage = ImagePicker();
    final image = await pickerImage.pickImage(source: ImageSource.gallery);
    selectedImage = await image?.readAsBytes();
  }

  void updateCategory(CategoryModel? categoryModel) {
    _categoryModel = categoryModel;
  }

  void dispose() {
    titleController.dispose();
  }
}
