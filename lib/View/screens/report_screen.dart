import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/report_controller.dart';
import '../../UI/color.dart';


class ExportImportReportsScreen extends GetView<ReportController> {
  const ExportImportReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.backgroundGradient(context),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Theme.of(context).canvasColor,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Export and Import Reports",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color:
                            Theme.of(context).textTheme.bodyLarge?.color,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          onPressed: () async {
                            // final data = controller.reportData.map((e) => {
                            //   "title": e.title,
                            //   "action": e.action,
                            //   "user": e.user,
                            // }).toList();

                            await controller.exportReportAsPDF("report.pdf", controller.reportDat);
                            print("sssssssssssss");
                          },
                          icon: const Icon(Icons.picture_as_pdf),
                          label: const Text("Export as PDF"),
                        ),

                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: () async {
                            // final data = controller.reportData.map((e) => {
                            //   "title": e.title,
                            //   "action": e.action,
                            //   "user": e.user,
                            // }).toList();

                            await controller.exportReportAsCSV("report.csv", controller.reportDat);
                          },
                          icon: const Icon(Icons.file_download),
                          label: const Text("Export as CSV"),
                        ),
                        const Divider(height: 40, thickness: 2),
                        Text(
                          "Import Report",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color:
                            Theme.of(context).textTheme.bodyLarge?.color,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: () => controller.importReport(),
                          icon: const Icon(Icons.file_upload),
                          label: const Text("Upload Report File"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Obx(() {
                          if (controller.isLoading.value) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          if (controller.reportData.isEmpty) {
                            return const Center(
                              child: Text("No records found"),
                            );
                          }

                          return Column(
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                "Report Data",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.color,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  itemCount: controller.reportData.length,
                                  itemBuilder: (context, index) {
                                    final record =
                                    controller.reportData[index];
                                    return ListTile(
                                      title: Text(record.title),
                                      subtitle: Text(
                                          "Action: ${record.action}, By: ${record.user}"),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
