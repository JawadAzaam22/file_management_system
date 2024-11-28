import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/forget_password/forget_password_controller.dart';
import '../../../UI/color.dart';


class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});

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
                              "Forget password",
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
                          Text(
                            "Enter your email to send code",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color:
                              Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                "Email:",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color,
                                    fontSize: 14),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                controller: controller.emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter your email';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Enter Your Email',
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey,
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
                              ),
                              SizedBox(height: 50),

                              Container(
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.navToOtp();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).canvasColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.11),
                                    ),
                                  ),
                                  child: Text(
                                    'send code',
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