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
    Get.toNamed ("/verify");

  }

  Future<void> sendResetRequest() async {
    dio.Dio d = dio.Dio();


      if (formKey.currentState!.validate()){
        try {
          _isLoading.value = true;
          dio.Response r =
          await d.post("baseUrl/api/users/login", data: {
             "email": emailController.text,

          });
          if (r.statusCode == 200) {
            Get.snackbar(
              "نجاح",
              "تم التحقق من الرمز بنجاح",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
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