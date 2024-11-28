import 'package:get/get.dart';

import '../Controller/create_greoup_contoller.dart';

class CreateGroubBindings extends Bindings{

  @override
  void dependencies() {

    Get.put<CreateGroupController>(CreateGroupController());




  }
}