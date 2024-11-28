import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewGroupController extends GetxController {
  @override
  void onInit() {

    super.onInit();
  }
  RxBool  isTapped = RxBool(false);

  void navToLogIn()async{

    Get.offAndToNamed("/splash");

  }
  RxBool isDrawerOpen = RxBool(false);


  RxInt currentIndex=RxInt(0);

  void toggleDrawer() {

      isDrawerOpen.value = !isDrawerOpen.value;

  }

  void selectPage(int index) {

      currentIndex.value = index;
      isDrawerOpen.value = false;
      update();

  }

}
