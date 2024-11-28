
import 'package:file_management_system/Controller/create_greoup_contoller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../Controller/groups_controller.dart';
import '../widgets/custom_text.dart';

class GroupsScreen extends StatelessWidget {
   GroupsScreen({super.key});
  final GroupsController controller = Get.put(GroupsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:
          Center(
          child: GridView.extent(
          maxCrossAxisExtent: 200,
          padding: const EdgeInsets.all(10),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(10, (index) {
            return Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: index == 0
                  ? InkWell(
                onTap: (){
                  controller.navToVerifyAccount();
                },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          CustomText(
                            text: 'new group',
                            alignment: Alignment.center,
                            maxLines: 3,
                          )
                        ],
                      ),
                  )
                  : CustomText(
                      text: 'Item $index',
                      alignment: Alignment.center,
                    ),
            );
          }),
        ),
      ),
    );
  }
}
