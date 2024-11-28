
import 'package:get/get.dart';

import '../Controller/pre_version_controller.dart';
class PreVersionBindings implements Bindings {

  @override
  void dependencies() {

    Get.put<PreVersionController>(PreVersionController());




  }

}