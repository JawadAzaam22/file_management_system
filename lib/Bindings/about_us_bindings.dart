import 'package:file_management_system/Controller/about_us_controller.dart';
import 'package:get/get.dart';

class AboutUsBindings implements Bindings{
  @override
  void dependencies() {
    Get.put<AboutUsController>(AboutUsController());
  }

}