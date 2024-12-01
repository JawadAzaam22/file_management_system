import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/login_controller.dart';
import '../../UI/color.dart';
import '../../l10n/app_localizations.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

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
                          // border: Border.all(
                          //
                          //   color:Theme.of(context).canvasColor
                          // ),
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).colorScheme.primaryContainer
                          //Color(0x3F06235B),
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.login,
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
                                AppLocalizations.of(context)!.email,
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
                                    return  AppLocalizations.of(context)!.emailvalidation;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText:  AppLocalizations.of(context)!.enteryouremail,
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
                              SizedBox(height: 20),
                              Text(
                                AppLocalizations.of(context)!.password,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color,
                                    fontSize: 14),
                              ),
                              SizedBox(height: 10),
                              Obx(
                                () => TextFormField(
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
                                    prefixIcon: Icon(
                                      Icons.password_outlined,
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        controller.isObscure.value
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Colors.grey,
                                      ),
                                      onPressed: controller.changeIsPass,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextButton(
                                onPressed: () {
                                  controller.navToForgetPassword();
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.forgetpassword,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.color,
                                      fontSize: 15),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.signIn();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.11),
                                    ),
                                  ),
                                  child: Text(
                                    AppLocalizations.of(context)!.signin,
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

                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Text(
                              //       "You Don't Have An Account?",
                              //       style: TextStyle(color: Colors.white),
                              //     ),
                              //     Flexible(
                              //       child: TextButton(
                              //         onPressed: () {
                              //           // إضافة الدالة المناسبة هنا
                              //         },
                              //         child: Text(
                              //           "SIGN UP",
                              //           style: TextStyle(color: Color(0xFF1A649A)),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              Wrap(alignment: WrapAlignment.center, children: [
                                Text(
                                  AppLocalizations.of(context)!.donthaveaccount,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    controller.navToSignUp();
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!.signup,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ]),
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
