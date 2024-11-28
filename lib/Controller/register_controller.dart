import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import '../Model/user_model.dart';

import 'package:dio/dio.dart' as dio;

import '../Services/service.dart';
import '../UI/constants.dart';

class RegisterController extends GetxController {

  @override
  void onInit() {

    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();
    nameController = TextEditingController();
    userNameController = TextEditingController();
    service=Get.find();
    super.onInit();
  }
  late TextEditingController nameController ;
  late TextEditingController emailController ;
  late TextEditingController userNameController ;
  late TextEditingController passwordController ;
  late TextEditingController passwordConfirmationController ;
  var formKey=GlobalKey<FormState>();
  final RxBool _isLoading = RxBool(false);
  late final UserService service;
  bool get isLoading => _isLoading.value;
  RxBool isObscure = RxBool(true);
  void changeIsPass() {
    isObscure.value = !isObscure.value;

  } RxBool isObscureConfirmation = RxBool(true);
  void changeIsPassConfirmation() {
    isObscureConfirmation.value = !isObscureConfirmation.value;

  }
  File? finalFileImage;
  String userImage = '';






PlatformFile? image;
  Future<void>pickImage()async{

    try{
       FilePickerResult?result=await FilePicker.platform.pickFiles(
         type:FileType.image,
       );
      if(result==null) return;
      else{
        image=result.files.first;
        update();
      }


    }catch(e){

    }
  }
  // Future<void> signUP() async {
  //   dio.Dio d = dio.Dio();
  //   if (formKey.currentState!.validate()) {
  //
  //     try {
  //
  //
  //       List<int> imageBytes = image!.bytes!;
  //       String fileName = image!.name;
  //
  //       dio.FormData formData = dio.FormData.fromMap({
  //         "image": await dio.MultipartFile.fromBytes(
  //           imageBytes,
  //           filename: fileName,
  //         ),
  //         "name": nameController.text,
  //         "username": userNameController.text,
  //         "email": emailController.text,
  //         "password": passwordController.text,
  //         "password_confirmation": passwordConfirmationController.text,
  //
  //       });
  //
  //
  //
  //
  //       _isLoading.value = true;
  //       dio.Response r =
  //       await d.post("$baseURL/api/v1/auth/register",
  //           data: formData);
  //
  //         if (r.statusCode == 200 ) {
  //           service.currentUser = UserModel.fromJson(r.data["data"]);
  //           Get.offAndToNamed("/verify_account",arguments: {
  //             "email":emailController.text,
  //           });
  //         }
  //
  //
  //        else {
  //         Get.snackbar("Error", r.data["message"] ?? "error");
  //       }
  //       _isLoading.value = false;
  //     } on dio.DioException catch (e) {
  //       _isLoading.value = false;
  //       print("eeeeeeeeeeeeeeeee");
  //       Get.snackbar("Error", e.response?.data["message"] ?? e.message);
  //     }
  //   }}
  Future<void> signUP() async {
    dio.Dio d = dio.Dio();
    if (formKey.currentState!.validate()) {
      try {
        // تحقق مما إذا كانت الصورة موجودة
        if (image == null) {
          Get.snackbar("Error", "Please select an image.");
          return;
        }


        List<int> imageBytes = image!.bytes!;
        String fileName = image!.name; // اسم الملف

        // إعداد بيانات النموذج
        dio.FormData formData = dio.FormData.fromMap({
          "image": await dio.MultipartFile.fromBytes(
            imageBytes,
            filename: fileName,
          ),
          "name": nameController.text,
          "username": userNameController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "password_confirmation": passwordConfirmationController.text,
        });

        _isLoading.value = true;

        // إرسال الطلب
        dio.Response r = await d.post("$baseURL/api/v1/auth/register", data: formData);

        // تحقق من حالة الاستجابة
        if (r.statusCode == 200) {
          service.currentUser = UserModel.fromJson(r.data["data"]);
          Get.offAndToNamed("/verify_account", arguments: {
            "email": emailController.text,
          });
        } else {
          Get.snackbar("Error", r.data["message"] ?? "An error occurred");
        }

      } on dio.DioException catch (e) {
        print("Dio Exception: ${e.response?.data}");
        _isLoading.value = false;
        Get.snackbar("Error", e.response?.data["message"] ?? e.message);
        print( e.response?.data["message"]);
      } catch (e) {
        print("General Exception: $e");
        _isLoading.value = false;
        Get.snackbar("Error", "An unexpected error occurred.");
      } finally {
        _isLoading.value = false; // تأكد من إيقاف التحميل في النهاية
      }
    }
  }



  void navToVerifyAccount() {
    Get.offAndToNamed("/verify_account");
  }

  // void signUP(){
  //   if (formKey.currentState!.validate()) {
  //
  //   }
  //
  //
  // }
}