import 'package:dio/dio.dart' as dio;
import 'package:file_management_system/Model/invitation_model.dart';
import 'package:file_management_system/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../Model/user_model.dart';
import '../Services/service.dart';

class InvitationsController extends GetxController {
  @override
  void onInit() {
    service = Get.find<UserService>();
    super.onInit();
    fetchInvitations();
  }

  late final UserService service;
  var invitations = <Map<String, String>>[].obs;
  var isLoading = false.obs;
  RxList<Data>invites = RxList([]);


  Future<void> accept(int index, int? id) async {
    dio.Dio d = dio.Dio();

    try {
      dio.Response r =
      await d.patch("$baseURL/api/v1/invitation/accept/$id",
        options: dio.Options(
          headers: {
            "Authorization": "Bearer ${service.token}",
          },
        ),
      );

      if (r.statusCode == 200) {
        Get.snackbar(
          "نجاح",
          "تم  القبول",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        invites.removeAt(index);
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
    }
  }
  Future<void> reject(int index, int? id) async {
    dio.Dio d = dio.Dio();

    try {
      dio.Response r =
      await d.patch("$baseURL/api/v1/invitation/reject/$id",
        options: dio.Options(
          headers: {
            "Authorization": "Bearer ${service.token}",
          },
        ),
      );

      if (r.statusCode == 200) {
        Get.snackbar(
          "نجاح",
          "تم  القبول",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        invites.removeAt(index);
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
    }
  }




Future<void> fetchInvitations() async {
  dio.Dio d = dio.Dio();


  isLoading.value = true;
  try {
    dio.Response r = await d.get(
        "$baseURL/api/v1/invitation/getUsersInvitations",
        options: dio.Options(
          headers: {
            "Authorization": "Bearer ${service.token}",
          },
        ));

    print("sss");

    List<dynamic> temp = r.data["data"];
    invites.clear();
    if (r.statusCode == 200) {
      invites.addAll(temp.map((e) => Data.fromJson(e)));
      print(invites.length);
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

// var invitations = <Map<String, String>>[].obs;
// var isLoading = false.obs;

// Future<void> fetchInvitations() async {
//   isLoading.value = true;
//   try {
//     final response = await Dio().get('https://your-api.com/invitations');
//     if (response.statusCode == 200) {
//       invitations.value = List<Map<String, String>>.from(response.data);
//     }
//   } catch (e) {
//     print("Error fetching invitations: $e");
//   } finally {
//     isLoading.value = false;
//   }
// }
// Future<void> fetchInvitations() async {
//   isLoading.value = true;
//   try {
//
//     await Future.delayed(Duration(seconds: 2)); //
//     invitations.value = [
//       {"username": "User 1", "group": "Group A"},
//       {"username": "User 2 User 2 User 2 ", "group": "Group B"},
//       {"username": "User 3", "group": "Group C"},
//       {"username": "User 3", "group": "Group C"},
//       {"username": "User 3", "group": "Group C"},
//       {"username": "User 3", "group": "Group C"},
//       {"username": "User 3", "group": "Group C"},
//       {"username": "User 3", "group": "Group C"},
//       {"username": "User 3", "group": "Group C"},
//       {"username": "User 3", "group": "Group C"},
//       {"username": "User 3", "group": "Group C"},
//       {"username": "User 3", "group": "Group C"},
//       {"username": "User 3", "group": "Group C"},
//       {"username": "User 3", "group": "Group C"},
//     ];
//   } catch (e) {
//     print("Error: $e");
//   } finally {
//     isLoading.value = false;
//   }
// }
}