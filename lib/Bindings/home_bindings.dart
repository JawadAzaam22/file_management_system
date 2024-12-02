import 'package:file_management_system/Controller/groups_controller.dart';
import 'package:file_management_system/Controller/setting_controller.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

import '../View/widgets/side_barx.dart';




class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<SidebarXController>(SidebarXController());
    Get.put<GroupsController>(GroupsController());
    Get.put<SettingController>(SettingController());
  }
}
