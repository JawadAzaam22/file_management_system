import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../Model/baseurl.dart';
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
        await d.post("$baseUrl/api/v1/auth/forgetPassword/checkCode", data: {
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
  // Future<void> verifyOTP() async {
  //   if (emailController.text.isEmpty || otpController.text.isEmpty) {
  //     Get.snackbar(
  //       "خطأ",
  //       "يرجى ملء جميع الحقول",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //     return;
  //   }
  //
  //   _isLoading.value = true;
  //
  //   try {
  //     final response = await DioClient.instance.post(
  //       "/auth/forgetPassword/checkCode",
  //       data: {
  //         //"email": emailController.text,
  //         "code": otpController.text,
  //       },
  //     );
  //
  //     if (response.statusCode == 200) {
  //       Get.snackbar(
  //         "نجاح",
  //         "تم التحقق من الرمز بنجاح!",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.green,
  //         colorText: Colors.white,
  //       );
  //
  //       Get.offNamed("/reset-password");
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //       "خطأ",
  //       "فشل التحقق من الرمز: ${e.toString()}",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}