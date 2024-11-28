import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../UI/color.dart';
import '../widgets/side_barx.dart';

class HomeScreen extends GetView<SidebarXController> {
  HomeScreen({super.key});
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width <= 850;
    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.backgroundGradient(context),
      ),
      child: GetBuilder<SidebarXController>(
        init: controller,
        builder: (controller) => Scaffold(
          backgroundColor: Colors.transparent,
          key: _key,
          appBar: isSmallScreen
              ? AppBar(
            backgroundColor:
            Theme.of(context).colorScheme.primaryContainer,
            leading: IconButton(
              onPressed: () {
                _key.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          )
              : null,
          drawer:
          (isSmallScreen) ? ExampleSidebarX(controller: controller) : null,
          body: Row(
            children: [
              if (!isSmallScreen) ExampleSidebarX(controller: controller),
              Expanded(
                child: controller.currentScreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
