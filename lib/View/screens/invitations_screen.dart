import 'package:file_management_system/Controller/invitations_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_text.dart';

class InvitationsScreen extends StatelessWidget {
   InvitationsScreen({super.key});
  final InvitationsController controller = Get.put(InvitationsController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.transparent,

      body: Obx(

            () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.invitations.isEmpty) {
            return const Center(
              child: Text("No invitations available."),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: ListView.builder(

                  padding: const EdgeInsets.all(16.0),
                  itemCount: controller.invitations.length,
                  itemBuilder: (context, index) {
                    final invitation = controller.invitations[index];
                    return Column(
                      children: [
                        SizedBox(height: 30,),
                        Stack(
                          clipBehavior: Clip.none, // لضمان عرض النص فوق الحاوية
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 20), // لإفساح المجال للنص أعلاه
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // اسم المجموعة



                                  // أزرار القبول والرفض
                                  Row(

                                    children: [
                                      Expanded(

                                          child:   CustomText(
                                            text: invitation['group']!,
                                            alignment: Alignment.center,

                                          ),
                                        flex: 3,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () => controller.acceptInvitation(index),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            child:  CustomText(
                                              text: "accept",
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          ElevatedButton(
                                            onPressed: () => controller.rejectInvitation(index),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            child:   CustomText(
                                              text: "Reject",
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Positioned(
                              top: -10,
                              left: 16,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2,color: Colors.black),
                                  color: Theme.of(context).colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.account_circle_outlined,
                                      color: Theme.of(context).textTheme.bodyLarge?.color,
                                      size: 20,
                                    ),
                                    SizedBox(width: 5,),
                                    CustomText(
                                      text: invitation['username']!,
                                      fontWeight: FontWeight.w400 ,
                                      fontsize: 20,
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
    },
    ),

      
    );
  }
}
