
import 'package:get/get.dart';


import '../Controller/verify_account_controller.dart';

class VerifyAccountBindings implements Bindings {

  @override
  void dependencies() {

    Get.put<VerifyAccountController>(VerifyAccountController());




  }

}