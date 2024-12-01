
import 'package:file_management_system/Model/groups_with_files_model.dart';

import 'package:dio/dio.dart';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as dio;
import '../Services/service.dart';
import '../UI/constants.dart';


class GroupFilesListController extends GetxController {
  @override
  void onInit() async{
    service=Get.find();
    await getFiles();
    super.onInit();
  }
  RxBool fileIsTaped=RxBool(false);
  void navToPrevious(){
    Get.toNamed("/preVersion");
  }
  void navToReport(){
    Get.toNamed("/report");
  }
 void deleteFile(){

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

  Future<void> uploadFile() async {
    dio.Dio d = dio.Dio();

    try {

      String fileName = _file!.name;
      dio.FormData formData = dio.FormData.fromMap({
        "group_id":"1",
        "file": dio.MultipartFile.fromBytes(_file!.bytes!, filename: fileName),
      });



      _isLoading.value = true;

      dio.Response r = await d.post("$baseURL/api/v1/auth/register",

          options: dio.Options(
            headers: {
              "Authorization": "Bearer ${service.token}",
            },
          ),
          data: formData

      );


      if (r.statusCode == 200) {

        Get.offAndToNamed("/viewGroup");
      } else {
        Get.snackbar("Error", r.data["message"] ?? "An error occurred");
      }

    } on dio.DioException catch (e) {
      print("Dio Exception: ${e.response?.data}");
      _isLoading.value = false;
      Get.snackbar("Error", e.response?.data["message"] ?? e.message);
      print( e.message);
    } catch (e) {
      print("General Exception: $e");
      _isLoading.value = false;
      Get.snackbar("Error", "An unexpected error occurred.");
    } finally {
      _isLoading.value = false;
    }

  }




  RxList<Files>files=RxList([]);
  Future<void> getFiles() async {
    dio.Dio d = dio.Dio();


    _isLoading.value = true;
    try {
      dio.Response r = await d.get(
          "$baseURL/api/v1/group/files/${1}",
          options: dio.Options(
            headers: {
              "Authorization": "Bearer ${service.token}",
            },
          ));



      List<dynamic> temp = r.data["data"]["files"];
      if (r.statusCode == 200) {
        files.addAll(temp.map((e) => Files.fromJson(e)));
        print(files.length);
        print(files[1].versions?.length);
      }  else {
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
