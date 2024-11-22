// import 'package:file_management_system/UI/color.dart';
// import 'package:file_management_system/View/widgets/custom_form_field.dart';
// import 'package:file_management_system/View/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Controller/profile_controller.dart';
import '../../UI/color.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_text.dart';

class ProfileScreen extends GetView<ProfileController> {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.backgroundGradient(context),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(children: [
                Container(
                  height: 50,
                  width: 70,
                  constraints:
                      const BoxConstraints.expand(width: 700, height: 500),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.primaryContainer),
                  child: Padding(
                    padding: const EdgeInsets.all(60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomFormField(
                            label: Intl.message("name"),
                            textEditingController: controller.nameController,
                            prefixIcon: const Icon(
                              Icons.person_outline_sharp,
                              color: Colors.grey,
                            ),
                            suffixIcon: const Icon(
                              Icons.edit,
                              color: Colors.grey,
                            )),
                        CustomFormField(
                            label: Intl.message("user name"),
                            textEditingController:
                                controller.userNameController,
                            prefixIcon: const Icon(
                              Icons.person_outline_sharp,
                              color: Colors.grey,
                            ),
                            suffixIcon: const Icon(
                              Icons.edit,
                              color: Colors.grey,
                            )),
                        CustomFormField(
                            label: Intl.message("email"),
                            textEditingController: controller.emailController,
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                            ),
                            suffixIcon: const Icon(
                              Icons.edit,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                  ),
                ),
              ]),
              Container(
                height: 40,
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      //
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.11),
                      ),
                    ),
                    child: CustomText(
                      text: Intl.message("change password"),
                      alignment: Alignment.center,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
