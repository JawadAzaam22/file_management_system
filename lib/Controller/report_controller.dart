import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:html' as html;
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;


class ReportController extends GetxController {
  var isLoading = false.obs;
  var reportData = <ReportRecord>[].obs;


  final sampleData = [
    ReportRecord(title: "Edit File A", action: "check in ", user: "jawad"),
    ReportRecord(title: "Reserve File B", action: "check out ", user: "User2"),
    ReportRecord(title: "Delete File C", action: "check in", user: "User3"),
  ];


  Future<String> getFilePath(String filename) async {
    final directory = await getApplicationDocumentsDirectory(); // مسار المستندات
    return "${directory.path}/$filename";
  }

  final reportDat = [
    {"title": "Report 1", "action": "Created", "user": "User A"},
    {"title": "Report 2", "action": "Edited", "user": "User B"},
    {"title": "Report 3", "action": "Deleted", "user": "User C"},
  ];


  Future<void> exportReportAsCSV(String filename, List<Map<String, String>> data) async {

    List<List<String>> csvData = [
      ["Title", "Action", "User"],
      ...data.map((item) => [item["title"]!, item["action"]!, item["user"]!]),
    ];


    String csv = const ListToCsvConverter().convert(csvData);


    final blob = html.Blob([csv], 'text/csv');
    final url = html.Url.createObjectUrlFromBlob(blob);

    final anchor = html.AnchorElement(href: url)
      ..target = 'blank'
      ..download = filename
      ..click();


    html.Url.revokeObjectUrl(url);
  }
  Future<void> exportReportAsPDF(String filename, List<Map<String, String>> data) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text("Report Data", style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 20),
            pw.Table.fromTextArray(
              context: context,
              data: [
                ["Title", "Action", "User"],
                ...data.map((item) => [item["title"], item["action"], item["user"]]),
              ],
            ),
          ],
        ),
      ),
    );

    final Uint8List pdfBytes = await pdf.save();


    final blob = html.Blob([pdfBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);

    final anchor = html.AnchorElement(href: url)
      ..target = 'blank'
      ..download = filename
      ..click();


    html.Url.revokeObjectUrl(url);
  }

  Future<void> importReport() async {
    isLoading.value = true;
    try {

      await Future.delayed(const Duration(seconds: 2)); //
      reportData.assignAll(sampleData); //
      Get.snackbar("Success", "Report imported successfully.");
    } catch (e) {
      Get.snackbar("Error", "Failed to import report: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // تصدير تقرير بصيغة CSV أو PDF
  Future<void> exportReport(String format) async {
    isLoading.value = true;
    try {
      String data;
      if (format == "csv") {
        data = _generateCsv();
        _downloadFile(data, "report.csv");
      } else if (format == "pdf") {
        data = _generatePdf();
        _downloadFile(data, "report.pdf");
      }
      Get.snackbar("Success", "Report exported as $format successfully.");
    } catch (e) {
      Get.snackbar("Error", "Failed to export report: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // إنشاء بيانات CSV
  String _generateCsv() {
    final csvBuffer = StringBuffer();
    csvBuffer.writeln("Title,Action,User");
    for (var record in sampleData) {
      csvBuffer.writeln("${record.title},${record.action},${record.user}");
    }
    return csvBuffer.toString();
  }

  // إنشاء محتوى PDF (كمثال نصي)
  String _generatePdf() {
    final pdfBuffer = StringBuffer();
    pdfBuffer.writeln("=== Report ===\n");
    for (var record in sampleData) {
      pdfBuffer.writeln("Title: ${record.title}\nAction: ${record.action}\nUser: ${record.user}\n");
      pdfBuffer.writeln("--------------------");
    }
    return pdfBuffer.toString();
  }

  // تحميل الملف (يُستخدم مع مكتبة ويب، مثل HTML)
  void _downloadFile(String content, String filename) async {
    final blob = Uint8List.fromList(utf8.encode(content));
    final blobUri = Uri.dataFromBytes(blob, mimeType: "application/octet-stream");
    Get.snackbar("Download", "Download link generated for $filename.");
    // يمكنك استخدام مكتبة `dart:html` إذا كنت تعمل مع Flutter Web
    // مثل `AnchorElement(href: blobUri.toString())..download = filename..click();`
  }
}

// نموذج بيانات التقرير
class ReportRecord {
  final String title;
  final String action;
  final String user;

  ReportRecord({required this.title, required this.action, required this.user});
}
