import 'package:get/get.dart';

import '../../Controller/forget_password/verify_code_controller.dart';


class VerifyCodeBindings implements Bindings {

  @override
  void dependencies() {

    Get.put<VerifyCodeController>(VerifyCodeController());




  }

}