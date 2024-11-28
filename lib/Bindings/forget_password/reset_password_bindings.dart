import 'package:get/get.dart';

import '../../Controller/forget_password/reset_passord_controller.dart';
class ResetPasswordBindings implements Bindings {

  @override
  void dependencies() {

    Get.put<ResetPasswordController>(ResetPasswordController());




  }

}