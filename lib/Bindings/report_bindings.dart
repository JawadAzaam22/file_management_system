import 'package:get/get.dart';


import '../Controller/report_controller.dart';

class ReportBindings implements Bindings {

  @override
  void dependencies() {

    Get.put<ReportController>(ReportController());




  }

}