// import 'package:file_management_system/UI/color.dart';
// import 'package:file_management_system/View/widgets/custom_form_field.dart';
// import 'package:file_management_system/View/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Controller/profile_controller.dart';
import '../../UI/color.dart';
import '../../l10n/app_localizations.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_text.dart';

// class ProfileScreen extends GetView<ProfileController> {
//   ProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: AppTheme.backgroundGradient(context),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Stack(children: [
//                 Container(
//                   clipBehavior: Clip.none,
//                   height: 500,
//                   width: 700,
//                   // constraints:
//                   //     const BoxConstraints.expand(width: 700, height: 500),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Theme.of(context).colorScheme.primaryContainer),
//                   child: Padding(
//                     padding: const EdgeInsets.all(60),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         CustomFormField(
//                             label: AppLocalizations.of(context)!.name,
//                             textEditingController: controller.nameController,
//                             prefixIcon: const Icon(
//                               Icons.person_outline_sharp,
//                               color: Colors.grey,
//                             ),
//                             suffixIcon: const Icon(
//                               Icons.edit,
//                               color: Colors.grey,
//                             )),
//                         CustomFormField(
//                             label: AppLocalizations.of(context)!.username,
//                             textEditingController:
//                                 controller.userNameController,
//                             prefixIcon: const Icon(
//                               Icons.person_outline_sharp,
//                               color: Colors.grey,
//                             ),
//                             suffixIcon: const Icon(
//                               Icons.edit,
//                               color: Colors.grey,
//                             )),
//                         CustomFormField(
//                             label: AppLocalizations.of(context)!.email,
//                             textEditingController: controller.emailController,
//                             prefixIcon: const Icon(
//                               Icons.email_outlined,
//                               color: Colors.grey,
//                             ),
//                             suffixIcon: const Icon(
//                               Icons.edit,
//                               color: Colors.grey,
//                             ))
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(top:-13,left: 20,child: Container(height: 150,width: 150,decoration: BoxDecoration(color: Colors.red,shape: BoxShape.circle),))
//               ]),
//               // Container(
//               //   height: 40,
//               //   width: 200,
//               //   child: ElevatedButton(
//               //       onPressed: () {
//               //         //
//               //       },
//               //       style: ElevatedButton.styleFrom(
//               //         backgroundColor: Theme.of(context).primaryColor,
//               //         shape: RoundedRectangleBorder(
//               //           borderRadius: BorderRadius.circular(7.11),
//               //         ),
//               //       ),
//               //       child: CustomText(
//               //         text: AppLocalizations.of(context)!.changepassword,
//               //         alignment: Alignment.center,
//               //       )),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints.expand(
                  width: 700, height: 800)
              ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    //  alignment: Alignment.center,
                    children: [
                      Container(
                        clipBehavior: Clip.none,
                        height: 500,
                        width: 700,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(60),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomFormField(
                                label: AppLocalizations.of(context)!.name,
                                textEditingController:
                                    controller.nameController,
                                prefixIcon: const Icon(
                                  Icons.person_outline_sharp,
                                  color: Colors.grey,
                                ),
                                suffixIcon: const Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                ),
                              ),
                              CustomFormField(
                                label: AppLocalizations.of(context)!.username,
                                textEditingController:
                                    controller.userNameController,
                                prefixIcon: const Icon(
                                  Icons.person_outline_sharp,
                                  color: Colors.grey,
                                ),
                                suffixIcon: const Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                ),
                              ),
                              CustomFormField(
                                label: AppLocalizations.of(context)!.email,
                                textEditingController:
                                    controller.emailController,
                                prefixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: Colors.grey,
                                ),
                                suffixIcon: const Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -50,
                        // left: MediaQuery.of(context).size.width / 2,
                        right: 300,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 70,
                              child: Icon(
                                Icons.person,
                                size: 80,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              backgroundColor: Color(0xFFBBDEFB),
                            ),
                            Positioned(
                              bottom: 4,
                              right: 10,
                              child: InkWell(
                                onTap: () {
                                    controller.pickImage();
                                },
                                // child: CircleAvatar(
                                //   radius: 20,
                                //  backgroundColor:Colors.grey,
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Theme.of(context).iconTheme.color,
                                  size: 25,
                                ),
                              ),
                            )
                            //)
                          ],
                        ),
                      )
                    ],
                  ),
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
                          text: AppLocalizations.of(context)!.changepassword,
                          alignment: Alignment.center,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
