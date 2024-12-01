import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:html' as html;
import 'package:dio/dio.dart' as dio;
import '../Services/service.dart';
import '../UI/constants.dart';


class ViewGroupController extends GetxController {
  late final UserService service;

  @override
  void onInit() {

      service=Get.find();
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
  Future<void>downloadFile(String fileName)async{
    dio.Dio d = dio.Dio();
    try {
      final response = await d.get(
        "$baseURL/api/v1/file/version/download/5",
        options: dio.Options( headers: {
          "Authorization": "Bearer ${service.token}",
        },
            responseType: ResponseType.bytes),
      );
      if (response.statusCode == 200) {
        final blob = html.Blob([response.data]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..setAttribute('download', fileName)
          ..click();

        html.Url.revokeObjectUrl(url);

      } else {
        print('Failed to download file: ${response.statusCode}');
      }
    }catch (e) {
      print('Error downloading file: $e');
    }
  }

}
