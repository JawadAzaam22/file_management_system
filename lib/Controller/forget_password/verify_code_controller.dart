import 'package:file_management_system/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../Services/service.dart';

class VerifyCodeController extends GetxController{
  @override
  void onInit() {
    service=Get.find();
    otpController = TextEditingController();
    email =Get.arguments["email"];
    super.onInit();
  }
  late String email ;
  var formKey=GlobalKey<FormState>();
  final RxBool _isLoading = RxBool(false);
  late final UserService service;
  bool get isLoading => _isLoading.value;


  late TextEditingController otpController;
  void navToReset(){
    Get.toNamed ("/reset_password",arguments: {
        "email" : email,
    });

  }
  Future<void> verifyOTP() async {
    dio.Dio d = dio.Dio();


    if (formKey.currentState!.validate()){
      try {
        _isLoading.value = true;
        dio.Response r =
        await d.post("$baseURL/api/v1/auth/forgetPassword/checkCode", data: {
          "email": email,
          "code": otpController.text,
        });
        if (r.statusCode == 200) {
          Get.snackbar(
            "نجاح",
            "تم تحقق",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          service.token = r.data['data']['token'];
          navToReset();

        } else {
          Get.snackbar(
            "خطأ",
            "خطأ email",
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
      }}

  }

}