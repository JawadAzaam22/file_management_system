import 'package:get/get.dart';
import '../Services/service.dart';

class InitialBindings implements Bindings{

  @override
  void dependencies() {
    Get.put<UserService>(UserService());
  }

}