import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/splash_controller.dart';
import '../../UI/color.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.backgroundGradient(context),
      ),
      child: Scaffold(
      backgroundColor: Colors.transparent,

        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  width: 180,
                  height: 180,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/logo.jpg"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'File Mangement System',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'share your files with our group ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
            
                    fontWeight: FontWeight.w400,
            
                  ),
                ),
                SizedBox(height:80,),
                Container(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.navToLogIn();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).canvasColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.11),
                      ),
                    ),
                    child: Text(
                      'Ready',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                // InkWell(
                //   onTap: (){
                //   Get.toNamed("otp");
                //   },
                //   child: Container(
                //     width: 150,
                //     height: 50,
                //     decoration: ShapeDecoration(
                //       color: Color(0xFF1A649A),
                //       shape: RoundedRectangleBorder(
                //         side: BorderSide(width: 3, color: Colors.white),
                //         borderRadius: BorderRadius.circular(7.11),
                //       ),
                //     ),
                //   child:  Center(
                //     child: Text(
                //       'ready',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 25,
                //         fontWeight: FontWeight.w400,
                //       ),
                //     ),
                //   ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
