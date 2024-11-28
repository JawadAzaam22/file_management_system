import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:get/get.dart';

import '../View/screens/profile_screen.dart';

class SettingController extends GetxController {
  @override
  void onInit() {
    getThemeMode();
    // TODO: implement onInit
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
}
