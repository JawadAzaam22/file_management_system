import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../Services/service.dart';

class ResetPasswordController extends GetxController{
  @override
  void onInit() {
    service=Get.find();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();

    super.onInit();
  }

  late TextEditingController passwordController ;
  late TextEditingController passwordConfirmationController ;
  RxBool isObscure = RxBool(true);
  void changeIsPass() {
    isObscure.value = !isObscure.value;

  } RxBool isObscureConfirmation = RxBool(true);
  void changeIsPassConfirmation() {
    isObscureConfirmation.value = !isObscureConfirmation.value;

  }
  var formKey=GlobalKey<FormState>();
  final RxBool _isLoading = RxBool(false);
  late final UserService service;
  bool get isLoading => _isLoading.value;

  void navToOtp(){
    Get.toNamed ("/reset_password");

  }

  Future<void> sendResetRequest() async {
    dio.Dio d = dio.Dio();

    if (formKey.currentState!.validate()) {
      if (formKey.currentState!.validate()){
        try {
          _isLoading.value = true;
          dio.Response r =
          await d.post("baseUrl/api/users/login", data: {


          });
          if (r.data["message"]=="Login success") {
            service.token = r.data["access_token"];
            print(service.token.toString());
            print("object");
            print({r.data["access_token"]});


          } else {
            Get.snackbar("Error", r.data["message"] ?? "error");
          }
          _isLoading.value = false;
        } on dio.DioException catch (e) {
          _isLoading.value = false;
          print("eeeeeeeeeeeeeeeee");
          Get.snackbar("Error", e.response?.data["message"] ?? e.message);
        }}
    }
  }
}