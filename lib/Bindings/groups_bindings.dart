import 'package:file_management_system/Controller/groups_controller.dart';
import 'package:get/get.dart';

class GroupsBindings implements Bindings{
  @override
  void dependencies() {
   Get.put<GroupsController>(GroupsController());
  }

}