import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/view_group_controller.dart';
import '../../UI/color.dart';



class DrawerContent extends GetWidget<ViewGroupController> {
  final Function(int) onSelectPage;


  const DrawerContent(
      {super.key, required this.onSelectPage});

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  Container(
      color:  Theme.of(context).colorScheme.primaryContainer,
      child: ListView(

          children: [Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[

              MediaQuery.of(context).size.width < 850?SizedBox():Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('data analyses',style: GoogleFonts.openSans(
                    fontSize: 30
                ),),
              ),
              const DrawerHeader(
                child: Text(
                  'Description: this group to upload files ',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onSelectPage(0);
                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: controller.currentIndex.value == 0?null:AppTheme.backgroundGradient(context),
                    color: controller.currentIndex.value == 0
                        ?Theme.of(context).primaryColor: null,

                  ),
                  child: Center(child: Text("Group's Files")),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onSelectPage(1);
                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient:controller.currentIndex.value == 1?null:AppTheme.backgroundGradient(context),
                    color:controller.currentIndex.value == 1
                        ?Theme.of(context).primaryColor: null,

                  ),
                  child: Center(child: Text('New Files Requests')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onSelectPage(3);
                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: controller.currentIndex.value == 3?null:AppTheme.backgroundGradient(context),
                    color: controller.currentIndex.value == 3
                        ?Theme.of(context).primaryColor: null,

                  ),
                  child: Center(child: Text('My Reserved Files')),
                ),
              ),

              GestureDetector(
                onTap: () {


                  controller.isTapped.value=!controller.isTapped.value;


                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: controller.isTapped.value?null:AppTheme.backgroundGradient(context),
                    color:  controller.isTapped.value
                        ?Theme.of(context).primaryColor:null,

                  ),
                  child: Center(child: Text('Members')),
                ),
              ),
              controller.isTapped.value?
              Column(
                children: [
                  Container(

                    height: 260,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: ListView(
                      padding: EdgeInsets.all(20),
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Owner",
                              style: GoogleFonts.openSans(
                                color: Theme.of(context).textTheme.bodyMedium?.color,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Owner",
                              style: GoogleFonts.openSans(
                                color: Theme.of(context).textTheme.bodyMedium?.color,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Owner",
                              style: GoogleFonts.openSans(
                                color: Theme.of(context).textTheme.bodyMedium?.color,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Owner",
                              style: GoogleFonts.openSans(
                                color: Theme.of(context).textTheme.bodyMedium?.color,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Owner",
                              style: GoogleFonts.openSans(
                                color: Theme.of(context).textTheme.bodyMedium?.color,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              ):SizedBox(height: 260,),

              Container(
                width: 160,
                child: ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.11),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Text("Leave Group"),
                      Icon(Icons.logout_outlined,
                          size: 20,
                          color: Theme.of(context).iconTheme.color),
                    ],
                  ),
                ),
              ),

            ],
          ),]
      ),
    ));
  }
}