import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileController extends GetxController {
  final TextEditingController nameController = TextEditingController(text: "deemh Alaisame");
  final TextEditingController userNameController = TextEditingController(text:"deemh");
  final TextEditingController emailController = TextEditingController(text: "deemh@gmail.com");
}