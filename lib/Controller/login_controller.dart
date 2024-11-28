

import 'package:file_management_system/UI/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:dio/dio.dart' as dio;
import '../Model/user_model.dart';
import '../Services/service.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    service = Get.find<UserService>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  var formKey = GlobalKey<FormState>();
  final RxBool _isLoading = RxBool(false);
  late final UserService service;
  bool get isLoading => _isLoading.value;
  RxBool isObscure = RxBool(true);
  void changeIsPass() {
    isObscure.value = !isObscure.value;
  }

  late TextEditingController emailController;
  late TextEditingController passwordController;
  void navToSignUp() {
    Get.toNamed("/signup");
  }

  void navToForgetPassword() {
    Get.offAndToNamed("/forget_password");
  }

  // void signIn() async {
  //   if (formKey.currentState!.validate()) {
  //     Get.offAndToNamed("/home");
  //     // SharedPreferences sharedPreferences =
  //     //     await SharedPreferences.getInstance();
  //     // sharedPreferences.setString("email", emailController.text);
  //     // Get.offAndToNamed("/home");
  //   }
  // }

  Future<void> signIn() async {
    dio.Dio d = dio.Dio();
    if (formKey.currentState!.validate()){
      try {
        _isLoading.value = true;
        dio.Response r =
        await d.post("$baseURL/api/v1/auth/login", data: {
          "email": emailController.text,
          "password": passwordController.text,
        });
        if (r.statusCode == 200 && r.data["status"]=="success")  {
          Map<String, dynamic> userData = r.data['data']['user'];
          service.currentUser = UserModel.fromJson(userData);

          service.token = r.data['data']['token'];
          print(service.token.toString());
          Get.offAndToNamed("/home");

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
