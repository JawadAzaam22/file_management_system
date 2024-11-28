import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/login_controller.dart';
import '../../UI/color.dart';

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
                            "LOGIN",
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
                              SizedBox(height: 20),
                              Text(
                                "Password:",
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
                                      return 'please enter your password';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Enter Password',
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
                                  "Forget Your Password?",
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
                                    'Sign in',
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
                                  "You Don't Have An Account?",
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
                                    "SIGN UP",
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

        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
        // body: SingleChildScrollView(
        //     child:  Center(
        //       child: Column(
        //         children: [
        //           CircleAvatar(
        //             radius: 90,
        //             backgroundImage: AssetImage('assets/images/logo.jpg'),
        //           ),
        //           SizedBox(height: 30,),
        //           Container(
        //
        //              width: MediaQuery.of(context).size.width * 0.8,
        //            // width: double.maxFinite,
        //
        //             padding: EdgeInsets.symmetric(horizontal: 80,vertical: 30),
        //             margin:  EdgeInsets.symmetric(horizontal: 100),
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(8),
        //                 color: Color(0xFF06235B)),
        //             child: Column(
        //               children: [
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       "LOGIN",
        //                       style: GoogleFonts.openSans(
        //                         fontSize: 20,
        //                         fontWeight: FontWeight.w300,
        //                         color: Colors.white,
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       height: 20,
        //                     ),
        //                     Text("Email:",
        //                       style: GoogleFonts.openSans(
        //                           color: Colors.white,
        //                           fontSize:10
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       height: 10,
        //                     ),
        //                     TextFormField(
        //                       controller: controller.emailController,
        //                       maxLength: 10,
        //                       keyboardType: TextInputType.emailAddress,
        //                       textInputAction: TextInputAction.done,
        //                       style: GoogleFonts.openSans(
        //                           color: Colors.white
        //                       ),
        //                       onChanged: (value) {},
        //                       decoration: InputDecoration(
        //                         hintText: 'Enter Your Email',
        //                         hintStyle: GoogleFonts.openSans(
        //                             fontSize: 16, fontWeight: FontWeight.w500),
        //                         counterText: "",
        //                         border: OutlineInputBorder(
        //                             borderRadius: BorderRadius.circular(10)),
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       height: 20,
        //                     ),
        //                     Text("Password:",
        //                       style: GoogleFonts.openSans(
        //                           color: Colors.white,
        //                           fontSize:10
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       height: 10,
        //                     ),
        //
        //                     TextFormField(
        //                       controller:controller. passwordController,
        //                       maxLength: 10,
        //                       keyboardType: TextInputType.text,
        //                       textInputAction: TextInputAction.done,
        //
        //                       onChanged: (value) {},
        //                       decoration: InputDecoration(
        //                         hintText: 'Enter Password',
        //                         hintStyle: GoogleFonts.openSans(
        //                             fontSize: 16, fontWeight: FontWeight.w500),
        //                         counterText: "",
        //                         border: OutlineInputBorder(
        //                             borderRadius: BorderRadius.circular(10)),
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       height: 10,
        //                     ),
        //                     TextButton(
        //                       onPressed: (){
        //                         controller.navToForgetPassword();
        //                       },
        //                       child: Text("Forget Your Password?",
        //                         style: GoogleFonts.openSans(
        //                             color: Colors.white,
        //                             fontSize:15
        //                         ),
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       height: 20,
        //                     ),
        //
        //                     Center(
        //                       child: Container(
        //
        //                         height: 40,
        //
        //                         // padding: const EdgeInsets.symmetric(horizontal: 161, vertical: 16),
        //                         clipBehavior: Clip.antiAlias,
        //                         decoration: ShapeDecoration(
        //                           color: Color(0xFF1A649A),
        //                           shape: RoundedRectangleBorder(
        //                             borderRadius: BorderRadius.circular(7.11),
        //                           ),
        //                         ),
        //                         child: Center(
        //                           child: TextButton(
        //                             onPressed: (){
        //                               controller.signIn();
        //                             },
        //                             child: Text(
        //                               'Sign in',
        //                               style: TextStyle(
        //                                 color: Colors.white,
        //                                 fontSize: 16,
        //                                 // fontFamily: 'Cairo',
        //                                 fontWeight: FontWeight.w400,
        //                                 height: 0,
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       height: 20,
        //                     ),
        //
        //
        //                   ],
        //                 ),
        //                 Center(
        //                   child: Row
        //                     (
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       Text("You Don't Have An Account?",
        //                         style: GoogleFonts.openSans(
        //                             color: Colors.white
        //                         ),
        //                       ),
        //                       TextButton(
        //                           onPressed: (){
        //                             controller.navToSignUp();
        //                           },
        //                           child: Text("SIGN UP",
        //                             style: GoogleFonts.openSans(
        //                                 color:Color(0xFF1A649A)
        //                             ),
        //                           )),
        //                     ],
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        // )
      ),
    );
  }
}
