import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../Services/service.dart';

class InvitationsController extends GetxController {
  @override
  void onInit() {
    service = Get.find();
    super.onInit();
    fetchInvitations();
  }
  late final UserService service;
  var invitations = <Map<String, String>>[].obs;
  var isLoading = false.obs;

   Future<void> fetchInvitations() async {
    isLoading.value = true;
    try {

      await Future.delayed(Duration(seconds: 2)); //
      invitations.value = [
        {"username": "User 1", "group": "Group A"},
        {"username": "User 2 User 2 User 2 ", "group": "Group B"},
        {"username": "User 3", "group": "Group C"},
        {"username": "User 3", "group": "Group C"},
        {"username": "User 3", "group": "Group C"},
        {"username": "User 3", "group": "Group C"},
        {"username": "User 3", "group": "Group C"},
        {"username": "User 3", "group": "Group C"},
        {"username": "User 3", "group": "Group C"},
        {"username": "User 3", "group": "Group C"},
        {"username": "User 3", "group": "Group C"},
        {"username": "User 3", "group": "Group C"},
        {"username": "User 3", "group": "Group C"},
        {"username": "User 3", "group": "Group C"},
      ];
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }


  void acceptInvitation(int index) {
    invitations.removeAt(index);
    Get.snackbar("Success", "Invitation accepted.");
  }


  void rejectInvitation(int index) {
    invitations.removeAt(index);
    Get.snackbar("Info", "Invitation rejected.");
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
}