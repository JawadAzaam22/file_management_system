import 'package:file_management_system/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/forget_password/reset_passord_controller.dart';
import '../../../UI/color.dart';


class ResetPasswordScreen extends GetView<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.backgroundGradient(context),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        child: Image.asset(
                          'assets/images/logooo.png',
                          width: 300,
                          height: 300,
                        )),
                    SizedBox(height: 30),
                    Container(
                      constraints: BoxConstraints(maxWidth: 502),
                      padding:
                      EdgeInsets.symmetric(vertical: 40, horizontal: 120),
                      decoration: BoxDecoration(
                          border:
                          Border.all(color: Theme.of(context).canvasColor),
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).colorScheme.primaryContainer
                        //Color(0x3F06235B),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              AppLocalizations.of(context)!.forgrtpasswordscreen,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                                color:
                                Theme.of(context).textTheme.bodyLarge?.color,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              AppLocalizations.of(context)!.newpassword,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color:
                                Theme.of(context).textTheme.bodyLarge?.color,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                AppLocalizations.of(context)!.password,
                                style: TextStyle(color: Colors.white, fontSize: 14),
                              ),
                              SizedBox(height: 10),
                              Obx(()=> TextFormField(
                                controller: controller.passwordController,
                                obscureText: controller.isObscure.value,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return AppLocalizations.of(context)!.passvalidation;
                                  }
                                  return null;
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!.enterpassword,
                                  prefixIcon: Icon(Icons.password_outlined, color: Colors.grey,),
                                  suffixIcon: IconButton(icon: Icon(controller.isObscure.value ? Icons.visibility_outlined
                                      :Icons.visibility_off_outlined,color: Colors.grey,),
                                    onPressed:controller.changeIsPass,
                                  ),

                                  hintStyle: TextStyle(
                                    fontSize: 12,

                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),),

                              SizedBox(height: 10),
                              Text(
                                AppLocalizations.of(context)!.passwordconf,
                                style: TextStyle(color: Colors.white, fontSize: 14),
                              ),
                              SizedBox(height: 10),
                              Obx(()=> TextFormField(
                                controller: controller.passwordConfirmationController,
                                obscureText: controller.isObscureConfirmation.value,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return AppLocalizations.of(context)!.passconfvalidation;
                                  }
                                  return null;
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!.enterpassconf,
                                  prefixIcon: Icon(Icons.password_outlined, color: Colors.grey,),
                                  suffixIcon: IconButton(icon: Icon(controller.isObscureConfirmation.value ? Icons.visibility_outlined
                                      :Icons.visibility_off_outlined,color: Colors.grey,),
                                    onPressed:controller.changeIsPassConfirmation,
                                  ),

                                  hintStyle: TextStyle(
                                    fontSize: 12,

                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),),
                              SizedBox(height: 50),

                              Container(
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.resetpassword();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.11),
                                    ),
                                  ),
                                  child: Text(
                                    AppLocalizations.of(context)!.confirm,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.color,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
