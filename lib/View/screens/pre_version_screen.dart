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
    List<FileData> files = [
      FileData(
          name: 'Document with a very long name that might overflow.txt',
          owner: 'User1',
          lastModified: '2024-12-01',
          size: '1 MB'),
      FileData(
          name: 'Image.png',
          owner: 'User2',
          lastModified: '2024-12-02',
          size: '500 KB'),
      // أضف المزيد من الملفات حسب الحاجة
    ];
    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.backgroundGradient(context),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: DataTable(
            columns: [
              DataColumn(
                  label: Text('File Name', style: GoogleFonts.openSans())),
              DataColumn(label: Text('Owner', style: GoogleFonts.openSans())),
              DataColumn(
                  label: Text('Last Modified', style: GoogleFonts.openSans())),
              DataColumn(label: Text('Size', style: GoogleFonts.openSans())),
              DataColumn(
                  label: IconButton(
                      onPressed: () {
                        // controller.uploadFile();
                      },
                      icon: Icon(
                        Icons.add_to_drive_outlined,
                      ))),
            ],
            rows: files.map((file) {
              return DataRow(cells: [
                DataCell(
                  Container(
                    width: 150, // تحديد عرض ثابت لاسم الملف
                    child: Row(
                      children: [
                        Icon(Icons.insert_drive_file, size: 20), // أيقونة الملف
                        SizedBox(width: 8), // مساحة بين الأيقونة والنص
                        Expanded(
                          child: Text(
                            file.name,
                            overflow:
                                TextOverflow.ellipsis, // إضافة خاصية النقاط
                            maxLines: 1, // تحديد عدد الأسطر
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                DataCell(Row(
                  children: [
                    Icon(Icons.person, size: 20), // أيقونة المالك
                    SizedBox(width: 8),
                    Text(file.owner),
                  ],
                )),
                DataCell(Row(
                  children: [
                    Icon(Icons.access_time, size: 20), // أيقونة الوقت
                    SizedBox(width: 8),
                    Text(file.lastModified),
                  ],
                )),
                DataCell(Row(
                  children: [
                    Icon(Icons.file_download, size: 20), // أيقونة الحجم
                    SizedBox(width: 8),
                    Text(file.size),
                  ],
                )),
              ]);
            }).toList(),
          ),
        ),

// ListView(
        //
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(40.0),
        //       child: Column(
        //
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //           SizedBox(
        //
        //           ),
        //          Text("File Name",style: GoogleFonts.openSans(
        //            fontSize: 30,
        //            color: Theme.of(context).textTheme.bodyLarge?.color,
        //          ),),
        //           SizedBox(
        //             height: 20,
        //           ),
        //           Container(
        //               //constraints: BoxConstraints(maxWidth: 600),
        //               height: 40,
        //               color: Theme.of(context).canvasColor,
        //               child: Padding(
        //                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     Row(
        //                       children: [
        //                         Icon(
        //                           Icons.keyboard_double_arrow_down_sharp,
        //                           size: 30,
        //                           //color: Colors.blueAccent,
        //                         ),
        //
        //                       ],
        //                     ),
        //                     Row(
        //                       children: [
        //                         SizedBox(
        //                           width: 5,
        //                         ),
        //                         Text(
        //                           AppLocalizations.of(context)!.owner,
        //                           style: GoogleFonts.openSans(
        //                             color: Theme.of(context)
        //                                 .textTheme
        //                                 .bodyMedium
        //                                 ?.color,
        //                           ),
        //                         )
        //                       ],
        //                     ),
        //                     Text(
        //                       AppLocalizations.of(context)!.lastmodified,
        //                       style: GoogleFonts.openSans(
        //                         color: Theme.of(context)
        //                             .textTheme
        //                             .bodyMedium
        //                             ?.color,
        //                       ),
        //                     ),
        //                     Text(
        //                       AppLocalizations.of(context)!.size,
        //                       style: GoogleFonts.openSans(
        //                         color: Theme.of(context)
        //                             .textTheme
        //                             .bodyMedium
        //                             ?.color,
        //                       ),
        //                     ),
        //                    SizedBox(
        //                      width: 20,
        //                    )
        //                   ],
        //                 ),
        //               )),
        //
        //           SizedBox(
        //             height: 10,
        //           ),
        //
        //           Container(
        //               height: 40,
        //               //constraints: BoxConstraints(maxWidth: 600),
        //               color: Theme.of(context).primaryColor,
        //               child: Padding(
        //                   padding:
        //                   const EdgeInsets.symmetric(horizontal: 8.0),
        //                   child: Row(
        //                     mainAxisAlignment:
        //                     MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Row(
        //                         children: [
        //                           Icon(
        //                             CupertinoIcons.folder_fill,
        //                             color: Colors.blueAccent,
        //                           ),
        //
        //                         ],
        //                       ),
        //                       Row(
        //                         children: [
        //                           CircleAvatar(
        //                             radius: 10,
        //                           ),
        //                           SizedBox(
        //                             width: 5,
        //                           ),
        //                           Text(
        //                             "Owner",
        //                             style: GoogleFonts.openSans(
        //                               color: Theme.of(context)
        //                                   .textTheme
        //                                   .bodyMedium
        //                                   ?.color,
        //                             ),
        //                           )
        //                         ],
        //                       ),
        //                       Text(
        //                         "Last Modified",
        //                         style: GoogleFonts.openSans(
        //                           color: Theme.of(context)
        //                               .textTheme
        //                               .bodyMedium
        //                               ?.color,
        //                         ),
        //                       ),
        //                       Text(
        //                         "1 GB",
        //                         style: GoogleFonts.openSans(
        //                           color: Theme.of(context)
        //                               .textTheme
        //                               .bodyMedium
        //                               ?.color,
        //                         ),
        //                       ),
        //                       Icon(
        //                           Icons.download_outlined),
        //                     ],
        //                   ))),
        //           SizedBox(
        //             height: 10,
        //           ),
        //
        //
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

class FileData {
  final String name;
  final String owner;
  final String lastModified;
  final String size;

  FileData({
    required this.name,
    required this.owner,
    required this.lastModified,
    required this.size,
  });
}
