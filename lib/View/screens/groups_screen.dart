import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../../Controller/groups_controller.dart';
import '../../l10n/app_localizations.dart';
import '../widgets/custom_text.dart';

class GroupsScreen extends GetView<GroupsController> {
  GroupsScreen({super.key});
  // final GroupsController controller = Get.find<GroupsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.groupsScreen,
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyLarge?.color),
                  ),
                  subtitle: Text(AppLocalizations.of(context)!.welcomeSentence,
                      style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
                child: Text(
                  AppLocalizations.of(context)!.yourGroups,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyMedium?.color),
                ),
              ),
            ),
            Obx(
              () => Expanded(
                flex: 4,
                child: controller.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.extent(
                        maxCrossAxisExtent: 150,
                        padding: const EdgeInsets.only(
                            top: 10, right: 60, left: 60, bottom: 10),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: List.generate(controller.myGroups.length + 1,
                            (index) {
                          return InkWell(
                            onTap: () {
                              if (index == 0) {
                                controller.goToCreatGroup();
                              } else {
                                controller.goToViewGroup(
                                    controller.myGroups[index - 1].id!.toInt());
                              }
                            },
                            child: Card(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              child: index == 0
                                  ? const Icon(
                                      Icons.add,
                                    )
                                  : CustomText(
                                      text: controller
                                          .myGroups[index - 1].groupName
                                          .toString(),
                                      alignment: Alignment.center,
                                    ),
                            ),
                          );
                        }),
                      ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
                child: Text(
                  AppLocalizations.of(context)!.memberOf,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyMedium?.color),
                ),
              ),
            ),
            Obx(
              () => Expanded(
                flex: 4,
                child: controller.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.extent(
                        maxCrossAxisExtent: 150,
                        padding: const EdgeInsets.only(
                            top: 10, right: 60, left: 60, bottom: 10),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: List.generate(controller.otherGroups.length,
                            (index) {
                          return InkWell(
                            onTap: () => controller.goToViewGroup(
                                controller.otherGroups[index].id!.toInt()),
                            child: Card(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              child: CustomText(
                                text: controller.otherGroups[index].groupName
                                    .toString(),
                                alignment: Alignment.center,
                              ),
                            ),
                          );
                        }),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
