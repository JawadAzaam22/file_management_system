import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as dio;

import '../Services/service.dart';
import '../UI/constants.dart';
class CheckOutListController extends GetxController {
  @override
  void onInit() {
    service=Get.find();
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

  Future<void> uploadFile() async {
    dio.Dio d = dio.Dio();

      try {



        String fileName = _file!.name;
        dio.FormData formData = dio.FormData.fromMap({
          "group_id":"1",
          "file": dio.MultipartFile.fromBytes(_file!.bytes!, filename: fileName),
        });



        _isLoading.value = true;

        dio.Response r = await d.post("$baseURL/api/v1/auth/register", data: formData

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


}
