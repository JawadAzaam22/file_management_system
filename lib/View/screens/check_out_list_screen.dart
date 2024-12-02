import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../Controller/check_out_list_controller.dart';
import '../../l10n/app_localizations.dart';

class CheckOutList extends GetView<CheckOutListController> {
  const CheckOutList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...controller.checkInFiles.value.map((f)=>Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 600,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color:Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8.0),

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(CupertinoIcons.folder_fill, color: Colors.blueAccent),
                            SizedBox(width: 5),
                            Text(f.fileName.toString(), style: GoogleFonts.openSans(fontSize: 16)),
                          ],
                        ),
                                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text( AppLocalizations.of(context)!.reservtime, style: GoogleFonts.openSans(fontSize: 14)),
                        Text(DateFormat('yyyy-MM-dd').format(DateTime.parse( f.lockedAt??"")), style: GoogleFonts.openSans(fontSize: 14)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            controller.checkOutFile(f.fileId!.toInt());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.11),
                            ),
                          ),
                          child: Text("Upload Modified File",
                            style: GoogleFonts.openSans(
                              color: Theme.of(context).textTheme.bodyMedium?.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),

            ],
          ),
        ),)
      ],
    );
  }
}