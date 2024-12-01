import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/view_group_controller.dart';
import '../../UI/color.dart';
import '../../l10n/app_localizations.dart';



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
                child: Text('Group Name',style: GoogleFonts.openSans(
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
                  child: Center(child: Text( AppLocalizations.of(context)!.groupsfiles,style: GoogleFonts.openSans(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),)),
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
                  child: Center(child: Text( AppLocalizations.of(context)!.newfilesreq,style: GoogleFonts.openSans(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),)),
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
                  child: Center(child: Text( AppLocalizations.of(context)!.myreserved,style: GoogleFonts.openSans(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),)),
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
                  child: Center(child: Text( AppLocalizations.of(context)!.members,style: GoogleFonts.openSans(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),)),
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
                        Container(
                          width: 140,
                          child: ElevatedButton(
                            onPressed: (){

                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text( AppLocalizations.of(context)!.alert,style: GoogleFonts.openSans(
                                    color: Theme.of(context).textTheme.bodyMedium?.color,
                                  ),),
                                  content: Text(AppLocalizations.of(context)!.youwantdel,style: GoogleFonts.openSans(
                                    color: Theme.of(context).textTheme.bodyMedium?.color,
                                  ),),
                                  actions: [
                                    TextButton(
                                      child: Text(AppLocalizations.of(context)!.close,style: GoogleFonts.openSans(
                                        color: Theme.of(context).textTheme.bodyMedium?.color,
                                      ),),
                                      onPressed: () => Navigator.of(context).pop(),
                                    ),
                                    TextButton(
                                      child: Text(AppLocalizations.of(context)!.delete,style: GoogleFonts.openSans(
                                        color: Theme.of(context).textTheme.bodyMedium?.color,
                                      ),),
                                      onPressed: () {
                                        //del
                                       // controller.deleteFile();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.11),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                Text( AppLocalizations.of(context)!.invite,style: GoogleFonts.openSans(
                                  color: Theme.of(context).textTheme.bodyMedium?.color,
                                ),),
                                Icon(Icons.insert_invitation_outlined,
                                    size: 20,
                                    color: Theme.of(context).iconTheme.color),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              ):SizedBox(height: 260,),

              Container(
                width: 160,
                child: ElevatedButton(
                  onPressed: (){

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.11),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Text( AppLocalizations.of(context)!.leavegroup,style: GoogleFonts.openSans(
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),),
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