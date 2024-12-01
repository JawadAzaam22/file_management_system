import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/pre_version_controller.dart';
import '../../UI/color.dart';
import '../../l10n/app_localizations.dart';


class PreVersionScreen extends GetView<PreVersionController> {
  const PreVersionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.backgroundGradient(context),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:

        ListView(

          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(

                  ),
                 Text("File Name",style: GoogleFonts.openSans(
                   fontSize: 30,
                   color: Theme.of(context).textTheme.bodyLarge?.color,
                 ),),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      //constraints: BoxConstraints(maxWidth: 600),
                      height: 40,
                      color: Theme.of(context).canvasColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.keyboard_double_arrow_down_sharp,
                                  size: 30,
                                  //color: Colors.blueAccent,
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.owner,
                                  style: GoogleFonts.openSans(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              AppLocalizations.of(context)!.lastmodified,
                              style: GoogleFonts.openSans(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.color,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)!.size,
                              style: GoogleFonts.openSans(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.color,
                              ),
                            ),
                           SizedBox(
                             width: 20,
                           )
                          ],
                        ),
                      )),

                  SizedBox(
                    height: 10,
                  ),

                  Container(
                      height: 40,
                      //constraints: BoxConstraints(maxWidth: 600),
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.folder_fill,
                                    color: Colors.blueAccent,
                                  ),

                                ],
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 10,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Owner",
                                    style: GoogleFonts.openSans(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.color,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "Last Modified",
                                style: GoogleFonts.openSans(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.color,
                                ),
                              ),
                              Text(
                                "1 GB",
                                style: GoogleFonts.openSans(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.color,
                                ),
                              ),
                              Icon(
                                  Icons.download_outlined),
                            ],
                          ))),
                  SizedBox(
                    height: 10,
                  ),


                ],
              ),
            ),
          ],
        ),

      ),
    );
  }}







