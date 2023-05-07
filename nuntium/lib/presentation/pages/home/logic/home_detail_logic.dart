import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';

import '../../../../data/data_sources/home_data_source.dart';
import '../../../../data/model/responses/category_model.dart';
import '../../../../data/model/responses/news_model.dart';
import '../../../../utility/ image_pick/image_pick.dart';

class HomeDetailLogic {
  final HomeDataSource homeDataSource = HomeDataSource();
  final TextEditingController titleController = TextEditingController();
  CategoryModel? _categoryModel;
  Uint8List? _selectedFileBytes;
  XFile? _selectedFile;

  bool isValidateAllForm = false;
  final GlobalKey<FormState> formKey = GlobalKey();

  Uint8List? get selectedFileBytes => _selectedFileBytes;

  void updateCategory(CategoryModel categoryModel) {
    _categoryModel = categoryModel;
  }

  bool checkValidateAndSave(ValueSetter<bool>? onUpdate) {
    final value = formKey.currentState?.validate() ?? false;

    if (value != isValidateAllForm && selectedFileBytes != null) {
      isValidateAllForm = value;
      onUpdate?.call(value);
    }

    return isValidateAllForm;
  }

  Future<List<CategoryModel>?> fetchAllCategory() async {
    final response = await homeDataSource.fetchCategoryItem();
    return response;
  }

  Future<void> pickAndCheck(ValueSetter<bool> onUpdate) async {
    _selectedFile = await PickImage().pickImageFromGallery();
    _selectedFileBytes = await _selectedFile?.readAsBytes();
    checkValidateAndSave(
      (value) {},
    );
    onUpdate.call(true);
  }

  void dispose() {
    titleController.dispose();
    _categoryModel = null;
  }

  Future<bool> save() async {
    if (!checkValidateAndSave(null)) return false;
    final imageReference = createImageReference();
    if (imageReference == null) throw Exception('image not empty');
    if (_selectedFileBytes == null) return false;
    await imageReference.putData(_selectedFileBytes!);
    final urlPath = await imageReference.getDownloadURL();
    final response = await FirebaseFirestore.instance.collection('news').add(
          NewsModel(
            image: urlPath,
            title: _categoryModel?.name,
            description: titleController.text,
          ).toJson(),
        );

    if (response.id.isNullOrEmpty) return false;
    return true;
  }

  Reference? createImageReference() {
    if (_selectedFile == null || (_selectedFile?.name.isNullOrEmpty ?? true)) {
      return null;
    }
    final storageRef = FirebaseStorage.instance.ref();

    final imageRef = storageRef.child(_selectedFile!.name);
    return imageRef;
  }
}
