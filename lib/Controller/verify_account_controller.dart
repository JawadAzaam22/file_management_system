
import 'package:dio/dio.dart' as dio;
import 'package:file_management_system/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../Services/service.dart';

class VerifyAccountController extends GetxController{
  @override
  void onInit() {
    service=Get.find<UserService>();
    otpController = TextEditingController();
    email =Get.arguments["email"];
    super.onInit();
  }
  late RxnString email ;
  var formKey=GlobalKey<FormState>();
  final RxBool _isLoading = RxBool(false);
  late final UserService service;
  bool get isLoading => _isLoading.value;


  late TextEditingController otpController;

  void navToHome(){
    Get.offAndToNamed("/home");

  }
  Future<void> sendOtpCode() async {
    dio.Dio d = dio.Dio();


    if (formKey.currentState!.validate()){
      try {
        _isLoading.value = true;
        dio.Response r =
        await d.post("$baseURL/api/v1/auth/verify", data: {
          "email": email,
          "code": otpController.text
        });
        if (r.statusCode == 200) {
          Get.snackbar(
            "نجاح",
            "تم التحقق من الرمز بنجاح",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );

          navToHome();
        } else {
          Get.snackbar(
            "خطأ",
            "خطأ أثناء التحقق من الرمز",
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