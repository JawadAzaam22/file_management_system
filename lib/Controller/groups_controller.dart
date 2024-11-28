import 'package:get/get.dart';

import '../Services/service.dart';

class GroupsController extends GetxController{
@override
  void onInit() {
  service=Get.find();
    super.onInit();
  }
late final UserService service;

void navToVerifyAccount() {
  Get.offAndToNamed("/create_groub");
}
}