import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Controller/check_out_list_controller.dart';

class CheckOutList extends GetView<CheckOutListController> {
  const CheckOutList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0,
              vertical: 140),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                            Text("file_name.txt", style: GoogleFonts.openSans(fontSize: 16)),
                          ],
                        ),
                        Text("1 GB", style: GoogleFonts.openSans(fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Reservation Time:", style: GoogleFonts.openSans(fontSize: 14)),
                        Text("2024-11-27", style: GoogleFonts.openSans(fontSize: 14)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {

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
                        ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.11),
                            ),
                          ),
                          child: Text("Release Reservation",style: GoogleFonts.openSans(
                            color: Theme.of(context).textTheme.bodyMedium?.color,
                          ),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
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
                            Text("file_name.txt", style: GoogleFonts.openSans(fontSize: 16)),
                          ],
                        ),
                        Text("1 GB", style: GoogleFonts.openSans(fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Reservation Time:", style: GoogleFonts.openSans(fontSize: 14)),
                        Text("2024-11-27", style: GoogleFonts.openSans(fontSize: 14)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {

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
                        ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.11),
                            ),
                          ),
                          child: Text("Release Reservation",style: GoogleFonts.openSans(
                            color: Theme.of(context).textTheme.bodyMedium?.color,
                          ),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ],
    );
  }
}