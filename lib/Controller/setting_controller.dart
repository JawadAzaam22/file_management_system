import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dio/dio.dart'as dio;
import 'package:file_management_system/Model/user_model.dart';
import 'package:get/get.dart';

import '../Services/service.dart';
import '../UI/constants.dart';
import '../View/screens/profile_screen.dart';

class SettingController extends GetxController {
  @override
  late final UserService service;
  late UserModel userModel=new UserModel();
  final RxBool _isLoading = RxBool(false);
  bool get isLoading => _isLoading.value;
  void onInit() {
    service = Get.find<UserService>();
    getThemeMode();
    getProfile();
    super.onInit();
  }
  void goToAboutUs() {
    Get.toNamed("/aboutUs");
  }

  void goToProfile() {
    Get.toNamed("/profile");
  }

  var locale = Locale('ar', '').obs;

  void changeLanguage(String langCode) {
    locale.value = Locale(langCode, '');
    Get.updateLocale(locale.value);
  }

  bool isDarkMode = true;
  void getThemeMode() async {
    final savedThemeMode = await AdaptiveTheme.getThemeMode();
    if (savedThemeMode == AdaptiveThemeMode.dark) {
      isDarkMode = true;
    } else {
      isDarkMode = false;
    }
    update();
  }

  Future<void> getProfile() async {
    print("staaaaaaart");
    _isLoading.value=true;
   try{ dio.Dio d = dio.Dio();
   dio.Response r = await d.get(
     "$baseURL/api/v1/user/getProfile",
     options: dio.Options(
       headers: {
         "Authorization": "Bearer ${service.token}",
       },
     ),
   );

   if (r.statusCode == 200 && r.data["status"] == "success") {
     userModel= UserModel.fromJson(r.data["data"][0]);
     _isLoading.value=false;
     print(userModel.name);
     print(userModel.email);
     print(userModel.username);
     print(userModel.image_path);
   } else {
     Get.snackbar("Error", r.data["message"] ?? "error");
   }} on dio.DioException catch (e) {
     print(e.response?.data["message"] ?? e.message);
   }
  }

}
