import 'package:get/get.dart';

import '../../Controller/forget_password/forget_password_controller.dart';
class ForgetPasswordBindings implements Bindings {

  @override
  void dependencies() {

    Get.put<ForgetPasswordController>(ForgetPasswordController());




  }

}