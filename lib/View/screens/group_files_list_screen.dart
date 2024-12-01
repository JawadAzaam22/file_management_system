import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;

import '../../Controller/group_files_list_controller.dart';
import '../../l10n/app_localizations.dart';
class GroupFilesList extends GetView<GroupFilesListController> {
  const GroupFilesList({super.key});
  void downloadFile() {

    final String fileContent = "Hello, this is a sample text file.\nThis is the second line.";
    final String fileName = "sample.txt";


    final blob = html.Blob([fileContent], 'text/plain');
    final url = html.Url.createObjectUrlFromBlob(blob);


    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', fileName)
      ..click();


    html.Url.revokeObjectUrl(url);
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    controller.fileIsTaped.value
                        ? Container(
                            width: 160,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.11),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Check In",
                                    style: GoogleFonts.openSans(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.color,
                                    ),
                                  ),
                                  Icon(Icons.checklist_outlined,
                                      size: 20,
                                      color: Theme.of(context)
                                          .iconTheme
                                          .color),
                                ],
                              ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      width: 10,
                    ),
                    controller.fileIsTaped.value
                        ? Container(
                            width: 160,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.fileIsTaped.value = false;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.11),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Cancel select",
                                    style: GoogleFonts.openSans(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.color,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(Icons.cancel_outlined,
                                      size: 20,
                                      color: Theme.of(context)
                                          .iconTheme
                                          .color),
                                ],
                              ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(width: 20,)
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                  height: 40,
                  color: Theme.of(context).canvasColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        controller.fileIsTaped.value?SizedBox(width: 20,):SizedBox(),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.keyboard_double_arrow_down_sharp,
                                    size: 20,
                                    //color: Colors.blueAccent,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.filename,
                                    style: GoogleFonts.openSans(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.color,
                                    ),
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
                                "Size",
                                style: GoogleFonts.openSans(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.color,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    controller.uploadFile();
                                  },
                                  icon: Icon(
                                    Icons.add_to_drive_outlined,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),

              SizedBox(
                height: 10,
              ),

              GestureDetector(
                onLongPress: () {
                  controller.fileIsTaped.value = true;
                },
                child: Container(
                    height: 40,
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            //شرط انو محجوز
                            controller.fileIsTaped.value
                                ? Checkbox(
                                    value: false, onChanged: (val) {})
                                : SizedBox(),
                            Expanded(
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
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "file name",
                                        style: GoogleFonts.openSans(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.color,
                                        ),
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
                                  PopupMenuButton<String>(
                                      color: Theme.of(context).primaryColor,
                                      icon: const Icon(
                                          Icons.menu_open_rounded),
                                      onSelected: (value) {

                                        handleMenuSelection(context, value);
                                      },
                                      itemBuilder: (BuildContext context) {
                                        List<IconData> iconsList = [
                                          Icons.file_download_outlined,
                                          Icons.archive_outlined,
                                          Icons.file_open_outlined,
                                          Icons.delete_outline,
                                        ];
                                        return [
                                          PopupMenuItem<String>(
                                              value: 'Download',
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Download',
                                                    style: GoogleFonts
                                                        .openSans(
                                                      color:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium
                                                              ?.color,
                                                    ),
                                                  ),
                                                  Icon(iconsList[0]),
                                                ],
                                              )
                                          ),
                                          PopupMenuItem<String>(
                                              value: 'Previous Version',
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                children: [
                                                  Text(
                                                    'Previous Version',
                                                    style: GoogleFonts
                                                        .openSans(
                                                      color:
                                                      Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium
                                                          ?.color,
                                                    ),
                                                  ),
                                                  Icon(iconsList[1]),
                                                ],
                                              )),
                                          PopupMenuItem<String>(
                                              value: 'Report',
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Report',
                                                    style: GoogleFonts
                                                        .openSans(
                                                      color:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium
                                                              ?.color,
                                                    ),
                                                  ),
                                                  Icon(iconsList[2]),
                                                ],
                                              )
                                          ),
                                          PopupMenuItem<String>(
                                              value: 'Delete',
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                children: [
                                                  Text(
                                                    'Delete',
                                                    style: GoogleFonts
                                                        .openSans(
                                                      color:
                                                      Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium
                                                          ?.color,
                                                    ),
                                                  ),
                                                  Icon(iconsList[3]),
                                                ],
                                              )),
                                        ];
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ))),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onLongPress: () {
                  controller.fileIsTaped.value = true;
                },
                child: Container(
                    height: 40,
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: controller.fileIsTaped.value
                          ? Row(
                              children: [
                                Checkbox(value: false, onChanged: (val) {}),
                                Expanded(
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
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "file name",
                                            style: GoogleFonts.openSans(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.color,
                                            ),
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
                                      PopupMenuButton<String>(
                                        color: Colors.blueAccent,
                                        icon: const Icon(
                                            Icons.menu_open_rounded),
                                        onSelected: (value) {
                                          // هنا يمكنك إضافة منطق للتعامل مع الخيار المحدد
                                          handleMenuSelection(
                                              context, value);
                                        },
                                        itemBuilder:
                                            (BuildContext context) {
                                          return {
                                            'Option 1',
                                            'Option 2',
                                            'Option 3'
                                          }.map((String choice) {
                                            return PopupMenuItem<String>(
                                              value: choice,
                                              child: Text(choice),
                                            );
                                          }).toList();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Expanded(
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
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "file name",
                                            style: GoogleFonts.openSans(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.color,
                                            ),
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
                                      PopupMenuButton<String>(
                                        color: Colors.blueAccent,
                                        icon: const Icon(
                                            Icons.menu_open_rounded),
                                        onSelected: (value) {
                                          // هنا يمكنك إضافة منطق للتعامل مع الخيار المحدد
                                          handleMenuSelection(
                                              context, value);
                                        },
                                        itemBuilder:
                                            (BuildContext context) {
                                          return {
                                            'Option 1',
                                            'Option 2',
                                            'Option 3'
                                          }.map((String choice) {
                                            return PopupMenuItem<String>(
                                              value: choice,
                                              child: Text(choice),
                                            );
                                          }).toList();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                    )),
              ),
              // ListTile(title: Text('new file')),
              // ListTile(title: Text('new ')),
              // ListTile(title: Text('new elemw')),
            ],
          ),
        ),
      ],
    ));
  }

  void handleMenuSelection(BuildContext context, String value) {
    switch (value) {
      case 'Download':
        downloadFile();
        break;
      case 'Previous Version':
       //nav to pre
        controller.navToPrevious();
        break;
      case 'Report':

        //nav to report
      controller.navToReport();
        break;
      case 'Delete':
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Alert'),
            content: Text('You Want To Delete File?'),
            actions: [
              TextButton(
                child: Text('Close'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('Delete'),
                onPressed: () {
                  //del
                  controller.deleteFile();
                },
              ),
            ],
          ),
        );

    }
  }
}
