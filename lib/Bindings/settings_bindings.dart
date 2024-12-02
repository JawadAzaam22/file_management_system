import 'package:file_management_system/Controller/setting_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class SettingsBindings implements Bindings{
  @override
  void dependencies() {
    Get.put<SettingController>(SettingController());
  }

}