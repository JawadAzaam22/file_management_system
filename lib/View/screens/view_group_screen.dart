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

// class DrawerContent extends StatefulWidget {
//   final Function(int) onSelectPage;
//   final int currentIndex;
//
//   const DrawerContent(
//       {super.key, required this.onSelectPage, required this.currentIndex});
//
//   //set isTapped(bool isTapped) {}
//
//   @override
//   State<DrawerContent> createState() => _DrawerContentState();
// }
//
// class _DrawerContentState extends State<DrawerContent> {
//   bool isTapped = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//      color:  Theme.of(context).colorScheme.primaryContainer,
//       child: ListView(
//
//         children: [Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//           children: <Widget>[
//
//             MediaQuery.of(context).size.width < 850?SizedBox():Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text('data analyses',style: GoogleFonts.openSans(
//                 fontSize: 30
//               ),),
//             ),
//             const DrawerHeader(
//               child: Text(
//                 'Description: this group to upload files ',
//                 style: TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 widget.onSelectPage(0); // اختيار صفحة الملفات
//               },
//               child: Container(
//                 width: double.infinity,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   gradient: widget.currentIndex == 0?null:AppTheme.backgroundGradient(context),
//                   color: widget.currentIndex == 0
//                       ?Theme.of(context).primaryColor: null,
//
//                 ),
//                 child: Center(child: Text("Group's Files")),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 widget.onSelectPage(1); // اختيار صفحة الملفات
//               },
//               child: Container(
//                 width: double.infinity,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   gradient: widget.currentIndex == 1?null:AppTheme.backgroundGradient(context),
//                   color: widget.currentIndex == 1
//                       ?Theme.of(context).primaryColor: null,
//
//                 ),
//                 child: Center(child: Text('New Files Requests')),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 widget.onSelectPage(3); // اختيار صفحة الملفات
//               },
//               child: Container(
//                 width: double.infinity,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   gradient: widget.currentIndex == 3?null:AppTheme.backgroundGradient(context),
//                   color: widget.currentIndex == 3
//                       ?Theme.of(context).primaryColor: null,
//
//                 ),
//                 child: Center(child: Text('My Reserved Files')),
//               ),
//             ),
//
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//
//                   isTapped=!isTapped;
//                 });
//
//               },
//               child: Container(
//                 width: double.infinity,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   gradient:isTapped?null:AppTheme.backgroundGradient(context),
//                   color: isTapped
//                       ?Theme.of(context).primaryColor:null,
//
//                 ),
//                 child: Center(child: Text('Members')),
//               ),
//             ),
//             isTapped?
//             Column(
//               children: [
//                 Container(
//
//                   height: 260,
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).colorScheme.primaryContainer,
//                   ),
//                   child: ListView(
//                     padding: EdgeInsets.all(20),
//                     children: [
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 20,
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             "Owner",
//                             style: GoogleFonts.openSans(
//                               color: Theme.of(context).textTheme.bodyMedium?.color,
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(height: 10,),
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 20,
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             "Owner",
//                             style: GoogleFonts.openSans(
//                               color: Theme.of(context).textTheme.bodyMedium?.color,
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(height: 10,),
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 20,
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             "Owner",
//                             style: GoogleFonts.openSans(
//                               color: Theme.of(context).textTheme.bodyMedium?.color,
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(height: 10,),
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 20,
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             "Owner",
//                             style: GoogleFonts.openSans(
//                               color: Theme.of(context).textTheme.bodyMedium?.color,
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(height: 10,),
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 20,
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             "Owner",
//                             style: GoogleFonts.openSans(
//                               color: Theme.of(context).textTheme.bodyMedium?.color,
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(height: 10,),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 10,),
//               ],
//             ):SizedBox(height: 260,),
//
//             Container(
//               width: 160,
//               child: ElevatedButton(
//                 onPressed: null,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Theme.of(context).primaryColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(7.11),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//
//                    Text("Leave Group"),
//                     Icon(Icons.logout_outlined,
//                         size: 20,
//                         color: Theme.of(context).iconTheme.color),
//                   ],
//                 ),
//               ),
//             ),
//
//           ],
//         ),]
//       ),
//     );
//   }
// }
