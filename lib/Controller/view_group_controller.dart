import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as dio;
import '../Model/groups_with_files_model.dart';
import '../Services/service.dart';
import '../UI/constants.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:html' as html;
import 'package:dio/dio.dart' as dio;
import '../Services/service.dart';
import '../UI/constants.dart';

class ViewGroupController extends GetxController {


  @override
  Future<void> onInit() async {
    service = Get.find();
    groupID = Get.arguments["id"];
    await getFiles();

    super.onInit();
  }
  late final UserService service;
  RxBool val = RxBool(false);
  bool val1 = false;
  List checkInListIds = [];
  List values = [];
  checkInListIdsFunc(bool val, int fileId) {
    print(checkInListIds);
    if (val) {
      checkInListIds.add(fileId);
      update();
      print(checkInListIds);
    } else {
      checkInListIds.remove(fileId);
      update();

      print(checkInListIds);
    }
  }

  RxBool isTapped = RxBool(false);

  late int groupID;
  void navToLogIn() async {
    Get.offAndToNamed("/splash");
  }

  RxBool isDrawerOpen = RxBool(false);

  RxInt currentIndex = RxInt(0);

  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
  }

  void selectPage(int index) {
    currentIndex.value = index;
    isDrawerOpen.value = false;
    update();
  }

  Future<void> downloadFile(String fileName,int versionID) async {
    dio.Dio d = dio.Dio();
    try {
      final response = await d.get(
        "$baseURL/api/v1/file/version/download/$versionID",
        options: dio.Options(headers: {
          "Authorization": "Bearer ${service.token}",
        }, responseType: ResponseType.bytes),
      );
      if (response.statusCode == 200) {
        final blob = html.Blob([response.data]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..setAttribute('download', fileName)
          ..click();

        html.Url.revokeObjectUrl(url);
      } else {
        print('Failed to download file: ${response.statusCode}');
      }
    } catch (e) {
      print('Error downloading file: $e');
    }
  }

  RxBool fileIsTaped = RxBool(false);
  void navToPrevious() {
    Get.toNamed("/preVersion");
  }

  void navToReport() {
    Get.toNamed("/report");
  }

  void deleteFile() {}

  final RxBool _isLoading = RxBool(false);

  bool get isLoading => _isLoading.value;
  PlatformFile? _file;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      _file = result.files.first;
      update();
    }
  }

  Future<void> uploadFile() async {
    await pickFile();
    if (_file == null) {
      Get.snackbar("Error", "No file selected.");
      return;
    }

    dio.Dio d = dio.Dio();

    try {
      String fileName = _file!.name;

      dio.FormData formData = dio.FormData.fromMap({
        "group_id": groupID,
        "file": dio.MultipartFile.fromBytes(_file!.bytes!, filename: fileName),
      });
      dio.Response r = await d.post(
        "$baseURL/api/v1/file/create",
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
        Get.snackbar("Error","You cannot upload afile with this extension");
      }
    }on dio.DioException catch (e) {
      Get.snackbar("Error","You cannot upload afile with this extension");
    }
  }

  RxList<Files> files = RxList([]);
  Future<void> getFiles() async {
    dio.Dio d = dio.Dio();

    _isLoading.value = true;
    update();
    try {
      dio.Response r = await d.get("$baseURL/api/v1/group/files/${1}",
          options: dio.Options(
            headers: {
              "Authorization": "Bearer ${service.token}",
            },
          ));

      List<dynamic> temp = r.data["data"]["files"];
      if (r.statusCode == 200) {
        files.addAll(temp.map((e) => Files.fromJson(e)));

      } else {
        Get.snackbar("Error", r.data["message"] ?? "An error occurred");
      }
      _isLoading.value = false;
      update();
    } on dio.DioException catch (e) {
      _isLoading.value = false;
      update();
      print("eeeeeeeeeeeeeeeee");
      Get.snackbar("Error", e.response?.data["message"] ?? e.message);
    }
  }

  Future<void> checkIn(int index, int? id) async {
    dio.Dio d = dio.Dio();

    try {
      dio.Response r = await d.patch(
        "$baseURL/api/v1/invitation/reject/$id",
        options: dio.Options(
          headers: {
            "Authorization": "Bearer ${service.token}",
          },
        ),
      );

      if (r.statusCode == 200) {
      } else {
        Get.snackbar("Error", r.data["message"] ?? "An error occurred");
      }
      _isLoading.value = false;
    } on dio.DioException catch (e) {
      _isLoading.value = false;
      print("eeeeeeeeeeeeeeeee");
      Get.snackbar("Error", e.response?.data["message"] ?? e.message);
    }
  }
}
