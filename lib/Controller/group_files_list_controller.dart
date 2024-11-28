import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupFilesListController extends GetxController {
  @override
  void onInit() {

    super.onInit();
  }
  RxBool fileIsTaped=RxBool(false);
  void navToPrevious(){
    Get.toNamed("/preVersion");
  }
  void navToReport(){
    Get.toNamed("/report");
  }
 void deleteFile(){

  }

}
