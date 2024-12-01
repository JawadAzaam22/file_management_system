import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:line_icons/line_icons.dart';

import '../../Controller/view_group_controller.dart';
import '../../UI/color.dart';
import '../widgets/drawer_content_widget.dart';
import 'check_out_list_screen.dart';

import 'group_files_list_screen.dart';
import 'new_files_request_screen.dart';

class ViewGroupScreen extends GetView<ViewGroupController> {
  const ViewGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ViewGroupController(),
        builder: (controller) => Container(
              decoration: BoxDecoration(
                gradient: AppTheme.backgroundGradient(context),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: MediaQuery.of(context).size.width < 850
                    ? AppBar(
                        backgroundColor: Colors.transparent,
                        title: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text("Group name"),
                        ),
                        leading: IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: controller.toggleDrawer,
                        ),
                      )
                    : null,
                body: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 850) {
                      return Stack(
                        children: [
                          Center(child: _buildContent()),
                          if (controller.isDrawerOpen.value)
                            GestureDetector(
                              onTap: () {
                                controller.isDrawerOpen.value =
                                    false; // Close the drawer when tapping outside
                              },
                              child: Container(
                                color: Colors.black54, // Overlay color
                                child: Row(
                                  children: [
                                    Expanded(child: Container()), // Spacer
                                    Container(
                                      width: 250,
                                      color: Colors.white,
                                      child: DrawerContent(
                                        onSelectPage: controller.selectPage,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      );
                    } else {
                      return Row(
                        children: [
                          Container(
                            width: 250,
                            child: DrawerContent(
                              onSelectPage: controller.selectPage,
                            ),
                          ),
                          Expanded(child: Center(child: _buildContent())),
                        ],
                      );
                    }
                  },
                ),
              ),
            ));
  }

  Widget _buildContent() {
    switch (controller.currentIndex.value) {
      case 0:
        return GroupFilesList();
      case 1:
        return NewFilesRequestList();
      case 2:
        return GroupFilesList();
      case 3:
        return CheckOutList();
      default:
        return GroupFilesList();
    }
  }
}


