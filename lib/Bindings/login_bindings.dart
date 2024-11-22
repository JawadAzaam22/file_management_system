
import 'package:get/get.dart';
import '../Controller/login_controller.dart';

class LoginBindings implements Bindings {

  @override
  void dependencies() {

    Get.put<LoginController>(LoginController());




  }

}