import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:file_management_system/Model/user_model.dart';
import 'package:file_management_system/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Services/service.dart';

class CreateGroupController extends GetxController {
  @override
  void onInit() {
    service = Get.find<UserService>();
    searchContoller = TextEditingController();
    groubDescrebtionCintroller = TextEditingController();
    groubNameController = TextEditingController();
    super.onInit();
  }

  var formKey = GlobalKey<FormState>();

  late final UserService service;
  var isLoading = false.obs;
  RxList<UserModel> searchResults = RxList();

  RxList<int> invitation = RxList([]);

  late TextEditingController groubNameController;

  late TextEditingController groubDescrebtionCintroller;

  late TextEditingController searchContoller;

  void navToHome() {
    Get.offAllNamed("/home");
  }

  void sendInvite(UserModel name) {
    if (invitation.contains(name.id)) {
      Get.snackbar(
        'Notice',
        '${name.username} has already been invited',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    } else {

      invitation.add(name.id!);
      Get.snackbar(
        'Invite Sent',
        'Invitation sent to ${name.username}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      print("${invitation.length} number of invites");
    }
  }

  void search() async {
    dio.Dio d = dio.Dio();
    // if (searchResults.isEmpty) {
    //   searchResults.clear();
    //   return;
    // }

    isLoading.value = true;
    try {
      dio.Response r = await d.post("$baseURL/api/v1/user/filter",
          data: {
            "username": searchContoller.text,
          },
          options: dio.Options(
            headers: {
              "Authorization": "Bearer ${service.token}",
            },
          ));
      print("sss");
      print(searchResults.length);
      RxList<UserModel> searches = RxList([]);
      List<dynamic> temp = r.data["data"];
      searches.addAll(temp.map((e) => UserModel.fromJson(e)));
      searchResults.value = searches;
      print(searchResults.length);
      print(searches.length);
      if (r.statusCode == 200) {
        Get.snackbar(
          "نجاح",
          "تم الارسال  بنجاح",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          "خطأ",
          "خطأ أثناء كتابة email",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "خطأ",
        "حدث خطأ: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("حدث خطأ: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }






  void createGroup() async {
    dio.Dio d = dio.Dio();
    if (formKey.currentState!.validate()){
    try {
      dio.Response r = await d.post("$baseURL/api/v1/group/create",
          data: {
            "members": invitation,
            "name": groubNameController.text,
            "description": groubDescrebtionCintroller.text,
          },
          options: dio.Options(
            headers: {
              "Authorization": "Bearer ${service.token}",
            },
          ));
      print("creategroup");

      if (r.statusCode == 200) {
        Get.snackbar(
          "نجاح",
          "تم الارسال الرمز بنجاح",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        navToHome();
      } else {
        Get.snackbar(
          "خطأ",
          "خطأ أثناء كتابة email",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "خطأ",
        "حدث خطأ: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("حدث خطأ: ${e.toString()}");
    } }
  }

// void search() {
//   if (query.isEmpty) {
//     searchResults.clear();
//     return;
//   }
//
//   isLoading.value = true;
//
//
//   List<String> dummyData = [
//     "John Doe",
//     "Jane Smith",
//     "Michael Johnson",
//     "Emily Davis",
//     "Chris Brown",
//     "Jessica Wilson",
//     "Daniel Martinez"
//   ];
//
//
//   searchResults.value = dummyData
//       .where((name) => name.toLowerCase().contains(query.toLowerCase()))
//       .toList();
//
//   isLoading.value = false;
// }
}
