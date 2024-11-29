import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


import '../../../Controller/forget_password/verify_code_controller.dart';
import '../../../UI/color.dart';


class VerifyCodeScreen extends GetView<VerifyCodeController> {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                      EdgeInsets.symmetric(vertical: 40, horizontal: 100),
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
                            "Enter the 6-digit that sent to you",
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
                                "code",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color,
                                    fontSize: 14),
                              ),
                              SizedBox(height: 10),
                              PinCodeTextField(
                                appContext: context,
                                length: 6, // عدد الحقول
                                controller: controller.otpController,
                                animationType: AnimationType.fade,
                                keyboardType: TextInputType.number,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight: 50,
                                  fieldWidth: 40,
                                  activeFillColor: Colors.blue.shade100,
                                ),
                                onChanged: (value) {
                                  print(value);
                                },
                                onCompleted: (value) {
                                  print("رمز التحقق المكتمل: $value");
                                },
                              ),
                              SizedBox(height: 50),

                              Container(
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.verifyOTP();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Theme.of(context).canvasColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.11),
                                    ),
                                  ),
                                  child: Text(
                                    'verify',
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
