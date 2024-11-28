import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Services/service.dart';

class VerifyAccountController extends GetxController{
  @override
  void onInit() {
    service=Get.find();
    otpController = TextEditingController();

    super.onInit();
  }
  var formKey=GlobalKey<FormState>();
  final RxBool _isLoading = RxBool(false);
  late final UserService service;
  bool get isLoading => _isLoading.value;


  late TextEditingController otpController;
}