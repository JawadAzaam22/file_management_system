import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as dio;

import '../Model/checkin_file_model.dart';
import '../Services/service.dart';
import '../UI/constants.dart';
class CheckOutListController extends GetxController {
  @override
  void onInit()async {
    service=Get.find();
    await getMyCheckinFiles();
    super.onInit();
  }
  final RxBool _isLoading = RxBool(false);
  late final UserService service;
  bool get isLoading => _isLoading.value;
  PlatformFile? _file;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      _file = result.files.first;
      update();
    }
  }

  Future<void> checkOutFile(int id) async {
    await pickFile();
    if (_file == null) {
      Get.snackbar("Error", "No file selected.");
      return;
    }

    dio.Dio d = dio.Dio();

    try {
      String fileName = _file!.name;

      dio.FormData formData = dio.FormData.fromMap({
        "file_id": id,
        "file": dio.MultipartFile.fromBytes(_file!.bytes!, filename: fileName),
      });
      dio.Response r = await d.post(
        "$baseURL/api/v1/file/unlock",
        options: dio.Options(
          headers: {
            "Authorization": "Bearer ${service.token}",
          },
        ),
        data: formData,
      );

      if (r.statusCode == 200) {
        Get.snackbar("Success", r.data["message"]);
      } else if (r.statusCode == 400) {
        Get.snackbar("Error",r.data["message"]);
      }
    }on dio.DioException catch (e) {
      Get.snackbar("Error", e.message.toString());
    }
  }

  RxList<CheckinFileModel> checkInFiles=<CheckinFileModel>[].obs;
  Future<void> getMyCheckinFiles() async {
    _isLoading.value = true;
    dio.Dio d = dio.Dio();
    dio.Response r = await d.get(
      "$baseURL/api/v1/file/unlock/me",
      options: dio.Options(
        headers: {
          "Authorization": "Bearer ${service.token}",
        },
      ),
    );
    if (r.statusCode == 200 && r.data["status"] == "success") {
      if (r.data['data'] != null) {
        checkInFiles.value = (r.data['data'] as List)
            .map((groupJson) => CheckinFileModel.fromJson(groupJson))
            .toList();
      }
      _isLoading.value = false;
      // print(checkInFiles[0].fileName);
      // print(checkInFiles[0].lockedAt);
      // print(r);
    } else {
      Get.snackbar("Error", r.data["message"] ?? "error");
    }
  }

}
