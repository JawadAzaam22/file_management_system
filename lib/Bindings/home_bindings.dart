import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<SidebarXController>(SidebarXController());
  }
}
