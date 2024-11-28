import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../Services/service.dart';

class VerifyCodeController extends GetxController{
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
  void navToOtp(){
    Get.toNamed ("/reset_password");

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