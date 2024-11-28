import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

import '../View/widgets/side_barx.dart';




class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<SidebarXController>(SidebarXController());
  }
}
