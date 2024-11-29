


import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

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






//
// PlatformFile? image;
//   Future<void>pickImage()async{
//
//     try{
//        FilePickerResult?result=await FilePicker.platform.pickFiles(
//          type:FileType.image,
//        );
//       if(result==null) return;
//       else{
//         image=result.files.first;
//         update();
//       }
//
//
//     }catch(e){
//
//     }
//   }

  // PlatformFile? image; // متغير لتخزين الصورة
  //
  // Future<void> pickImage() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.image,
  //   );
  //
  //   if (result != null) {
  //
  //       image = result.files.first; // الحصول على أول ملف تم اختياره
  //       update();
  //
  //   }
  // }





File?picked;
  Uint8List webImage=Uint8List(8);
Future<void>pick()async{

  final ImagePicker picker=ImagePicker();
  XFile? pickedImage=await picker.pickImage(source: ImageSource.gallery);
  if(pickedImage!=null){
    var f = await pickedImage.readAsBytes();
    webImage=f;
    update();
    picked=File("a");
  }else {
    print("no select");
  }


}
  Future<void> signUP() async {
    dio.Dio d = dio.Dio();
    if (formKey.currentState!.validate()) {
      try {


        // if (webImage == null) { // تحقق من وجود الصورة
        //   Get.snackbar("Error", "Please select an image.");
        //   return;
        // }

        // إعداد بيانات النموذج
        dio.FormData formData = dio.FormData.fromMap({


        "image": dio.MultipartFile.fromBytes(
        webImage, // استخدم بيانات الصورة هنا
        filename: "image_path.jpg", // اسم الملف (يمكن تغييره حسب الحاجة)
        ),
          "name": nameController.text,
          "username": userNameController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "password_confirmation": passwordConfirmationController.text,
        });

        _isLoading.value = true;

        // إرسال الطلب
        dio.Response r = await d.post("$baseURL/api/v1/auth/register", data: formData

        );

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
        print( e.message);
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