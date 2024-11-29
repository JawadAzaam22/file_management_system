import 'package:file_management_system/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../Services/service.dart';

class ForgetPasswordController extends GetxController{
  @override
  void onInit() {
    service=Get.find();
    emailController = TextEditingController();

    super.onInit();
  }
  var formKey=GlobalKey<FormState>();
  final RxBool _isLoading = RxBool(false);
  late final UserService service;
  bool get isLoading => _isLoading.value;


  late TextEditingController emailController ;
  void navToOtp(){
    Get.toNamed ("/verify",arguments: {
      "email" : emailController.text,
    }
    );

  }





  Future<void> sendResetRequest() async {
    dio.Dio d = dio.Dio();


      if (formKey.currentState!.validate()){
        try {
          _isLoading.value = true;
          dio.Response r =
          await d.post("$baseURL/api/v1/auth/forgetPassword/getOTP", data: {
             "email": emailController.text,

          },

          );
          if (r.statusCode == 200) {
            Get.snackbar(
              "نجاح",
              "تم الارسال الرمز بنجاح",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
            navToOtp();

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
        }}

  }
    }