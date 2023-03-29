

import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import '../database/database_hive.dart';

class GetImage extends GetxController {
    var list = <DBStudentList>[].obs;
    String? pickedImage;
  String? pickedimagefromGallery;
    @override
  void onReady() {
    list.value.clear();
    list.value.addAll(studentdataDB.values);

    super.onReady();
    update();
  }
    getCamera() async {
    final images = await ImagePicker().pickImage(source: ImageSource.camera);
    // pickedImage = images!.path.obs;
    pickedImage = images!.path;

    update();
  }

  getGallery() async {
    final images = await ImagePicker().pickImage(source: ImageSource.gallery);
    pickedimagefromGallery = images!.path;
        log(pickedimagefromGallery.toString());
    update();
  }
    clearPicked() {
    pickedImage = null;
  }
  @override
  void onInit() {
    var list = <DBStudentList>[].obs;
    super.onInit();
  }
}