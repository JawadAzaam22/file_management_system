
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Services/service.dart';

class CreateGroupController extends GetxController{
  @override
  void onInit() {
    service=Get.find();
    groubDescrebtionCintroller = TextEditingController();
    groubNameController = TextEditingController();
    super.onInit();
  }
  var formKey=GlobalKey<FormState>();

  late final UserService service;
  var isLoading = false.obs;
  var searchResults = <String>[].obs;
  List<String> dummyData = [
    "John Doe",
    "Jane Smith",
    "Michael Johnson",
    "Emily Davis",
    "Chris Brown",
    "Jessica Wilson",
    "Daniel Martinez"
  ];

  late TextEditingController groubNameController ;
  late TextEditingController groubDescrebtionCintroller ;
  void navToSignUp(){
    Get.toNamed ("/signup");

  }
  void navToForgetPassword(){
    Get.offAndToNamed("/forget_password");

  }
  void sendInvite(String name) {
    Get.snackbar('Invite Sent', 'Invitation sent to $name');
  }
  // void search(String query) async {
  //   if (query.isEmpty) {
  //     searchResults.clear();
  //     return;
  //   }
  //
  //   isLoading.value = true;
  //   try {
  //
  //     var response = await Dio().get('https://jsonplaceholder.typicode.com/users');
  //
  //     List<String> results = (response.data as List)
  //         .where((item) => item['name'].toLowerCase().contains(query.toLowerCase()))
  //         .map((item) => item['name'] as String)
  //         .toList();
  //     searchResults.value = results;
  //   } catch (e) {
  //     Get.snackbar('Error', 'Failed to fetch results');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  void search(String query) {
    if (query.isEmpty) {
      searchResults.clear();
      return;
    }

    isLoading.value = true;


    List<String> dummyData = [
      "John Doe",
      "Jane Smith",
      "Michael Johnson",
      "Emily Davis",
      "Chris Brown",
      "Jessica Wilson",
      "Daniel Martinez"
    ];


    searchResults.value = dummyData
        .where((name) => name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    isLoading.value = false;
  }
}