

import 'package:get/get.dart';

import '../Controller/profile_controller.dart';

class ProfileBindings implements Bindings {

  @override
  void dependencies() {

    Get.put<ProfileController>(ProfileController());




  }

}