import 'package:file_management_system/Controller/view_group_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Controller/new_files_request_list_controller.dart';
import '../../l10n/app_localizations.dart';

class NewFilesRequestList extends GetView<ViewGroupController> {
  NewFilesRequestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 140),
      child: SizedBox(
        width: double.infinity,
        height: 700, // يمكنك تعديل هذا إذا أردت ارتفاعًا ثابتًا أو استخدام Expanded
        child: Obx(() {
          if (controller.isLoadingF.value) {
            return const Center(child: CircularProgressIndicator());
          }

          // التحقق إذا كان هناك طلبات أو لا
          // if (controller.fileRequests.isEmpty) {
          //   return Center(
          //     child: Text(
          //       AppLocalizations.of(context)!.noResultsFound,
          //       style: GoogleFonts.openSans(fontSize: 16),
          //     ),
          //   );
          // }

          return Column(
            children: [
              const SizedBox(height: 10),
              Expanded( // تغليف ListView بـ Expanded
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: controller.fileRequests.length,
                  itemBuilder: (context, index) {
                   var ss = controller.fileRequests[index].size;
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(CupertinoIcons.folder_fill,
                                      color: Colors.blueAccent),
                                  const SizedBox(width: 5),
                                  Text(
                                    "${controller.fileRequests[index].name}",
                                    style: GoogleFonts.openSans(fontSize: 16),
                                  ),
                                ],
                              ),
                              Text(
                                "${  (ss!/1024)}",
                                style: GoogleFonts.openSans(fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.uploadedby,
                                style: GoogleFonts.openSans(fontSize: 14),
                              ),
                              Text(
                                "${controller.fileRequests[index].name ?? 'Unknown'}",
                                style: GoogleFonts.openSans(fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.uploadedtime,
                                style: GoogleFonts.openSans(fontSize: 14),
                              ),
                              Text(
                                "${controller.fileRequests[index].updatedAt}",
                                style: GoogleFonts.openSans(fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  AppLocalizations.of(context)!.download,
                                  style: GoogleFonts.openSans(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.color),
                                ),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  controller.acceptFile(
                                      index, controller.fileRequests[index].id!);
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.accept,
                                  style: GoogleFonts.openSans(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.color),
                                ),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  controller.rejectFile(
                                      index, controller.fileRequests[index].id!);
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.reject,
                                  style: GoogleFonts.openSans(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.color),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}