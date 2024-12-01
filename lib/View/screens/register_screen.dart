import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/register_controller.dart';
import '../../UI/color.dart';
import '../../l10n/app_localizations.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
        init: RegisterController(),
        builder: (controller) =>Container(
          decoration: BoxDecoration(
            gradient: AppTheme.backgroundGradient(context),),
          child: Scaffold(
              backgroundColor: Colors.transparent,

              body: Form(
                key: controller.formKey,
                child: SingleChildScrollView(child:
                Center(


                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                            child: Image.asset('assets/images/logooo.png',width: 300,height: 300,)
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 500), // تحديد عرض العنصر
                          padding: EdgeInsets.symmetric(vertical: 40,horizontal: 120),

                          decoration: BoxDecoration(
                              border: Border.all(

                                  color:Theme.of(context).primaryColor
                              ),
                              borderRadius: BorderRadius.circular(8),
                              color:Theme.of(context).colorScheme.primaryContainer

                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.register,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: Theme.of(context).textTheme.bodyLarge?.color,
                                ),
                                textAlign: TextAlign.center,
                              ),

                              SizedBox(height: 10),

                              Center(
                                child: controller.picked == null
                                    ? Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 70,
                                      child: Icon(
                                        Icons.person_outline_outlined,
                                        color: Theme.of(context).iconTheme.color,
                                      ),
                                      backgroundColor:   Colors.blueAccent,
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: InkWell(
                                          onTap: () {
                                            controller.pick();
                                          },
                                          child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor:Theme.of(context).primaryColor,

                                            child: Icon(
                                              Icons.camera_alt,
                                              color: Theme.of(context).iconTheme.color,
                                              size: 20,
                                            ),
                                          ),
                                        ))
                                  ],
                                )
                                    : Stack(
                                  children: [
                                    CircleAvatar(
                                        radius: 70,
                                        backgroundImage: MemoryImage(controller.webImage),
                                        //MemoryImage(Uint8List.fromList( controller.image!.bytes!))
                                      // FileImage(File(
                                      //     controller.picked!.path)),
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: InkWell(
                                          onTap: () {
                                            controller.pick();
                                          },
                                          child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor:Theme.of(context).primaryColor,
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: Theme.of(context).iconTheme.color,
                                              size: 20,
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),



                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    AppLocalizations.of(context)!.name,
                                    style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: 14),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    controller: controller.nameController,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return  AppLocalizations.of(context)!.namevalidation;
                                      }
                                      return null;
                                    },

                                    decoration: InputDecoration(
                                      hintText:  AppLocalizations.of(context)!.entername,
                                      prefixIcon: Icon(Icons.person_outline, color: Colors.grey,),
                                      hintStyle: TextStyle(
                                        fontSize: 12,

                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    AppLocalizations.of(context)!.username,
                                    style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: 14),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    controller: controller.userNameController,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return  AppLocalizations.of(context)!.usernamevalidation;
                                      }
                                      return null;
                                    },

                                    decoration: InputDecoration(
                                      hintText:  AppLocalizations.of(context)!.enterusername,
                                      prefixIcon: Icon(Icons.person_outline, color: Colors.grey,),
                                      hintStyle: TextStyle(
                                        fontSize: 12,

                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    AppLocalizations.of(context)!.email,
                                    style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color,fontSize: 14),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    controller: controller.emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return  AppLocalizations.of(context)!.emailvalidation;
                                      }
                                      return null;
                                    },

                                    decoration: InputDecoration(
                                      hintText:  AppLocalizations.of(context)!.enteryouremail,
                                      prefixIcon: Icon(Icons.email_outlined, color: Colors.grey,),
                                      hintStyle: TextStyle(
                                        fontSize: 12,

                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                      AppLocalizations.of(context)!.password,
                                    style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: 14),
                                  ),
                                  SizedBox(height: 10),
                                  Obx(()=> TextFormField(
                                    controller: controller.passwordController,
                                    obscureText: controller.isObscure.value,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return  AppLocalizations.of(context)!.passvalidation;
                                      }
                                      return null;
                                    },

                                    decoration: InputDecoration(
                                      hintText:  AppLocalizations.of(context)!.enterpassword,
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
                                    style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color,fontSize: 14),
                                  ),
                                  SizedBox(height: 10),
                                  Obx(()=> TextFormField(
                                    controller: controller.passwordConfirmationController,
                                    obscureText: controller.isObscureConfirmation.value,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return  AppLocalizations.of(context)!.passconfvalidation;
                                      }
                                      return null;
                                    },

                                    decoration: InputDecoration(
                                      hintText:  AppLocalizations.of(context)!.enterpassconf,
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

                                  SizedBox(height: 20),
                                  Container(
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        controller.signUP();
                                      },

                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Theme.of(context).primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(7.11),
                                        ),
                                      ),
                                      child: Text(
                                        AppLocalizations.of(context)!.signup,
                                        style: TextStyle(
                                          color: Theme.of(context).textTheme.bodyLarge?.color,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
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
              )),
        ));
  }
}
