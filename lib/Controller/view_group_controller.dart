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
  late final UserService service;

  @override
  Future<void> onInit() async {
    groupID =Get.arguments["id"];
    service=Get.find();
    await getFiles();

      service=Get.find();
       super.onInit();
  }
  RxBool  val = RxBool(false);
  bool  val1=false;
  List checkInListIds=[];
  List values=[

  ];
 checkInListIdsFunc(bool val,int fileId){
   print(checkInListIds);
    if (val){
      checkInListIds.add(fileId);
      update();
      print(checkInListIds);

    }
    else {
      checkInListIds.remove(fileId);
      update();

      print(checkInListIds);
    }

  }
  RxBool  isTapped = RxBool(false);

  late int groupID;
  void navToLogIn()async{

    Get.offAndToNamed("/splash");

  }
  RxBool isDrawerOpen = RxBool(false);


  RxInt currentIndex=RxInt(0);

  void toggleDrawer() {

      isDrawerOpen.value = !isDrawerOpen.value;

  }

  void selectPage(int index) {

      currentIndex.value = index;
      isDrawerOpen.value = false;
      update();

  }
  Future<void>downloadFile(String fileName)async{
    dio.Dio d = dio.Dio();
    try {
      final response = await d.get(
        "$baseURL/api/v1/file/version/download/5",
        options: dio.Options( headers: {
          "Authorization": "Bearer ${service.token}",
        },
            responseType: ResponseType.bytes),
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
    }catch (e) {
      print('Error downloading file: $e');
    }
  }



  RxBool fileIsTaped=RxBool(false);
  void navToPrevious(int fileID){
    Get.toNamed("/preVersion",
    arguments: {
      "fileID":fileID,
    }
    );
  }
  void navToReport(){
    Get.toNamed("/report");
  }
  void deleteFile(){

  }

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
  Owner owner=Owner();
  Future<void> getFiles() async {
    dio.Dio d = dio.Dio();


    _isLoading.value = true;
    update();
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
        owner = Owner.fromJson(r.data["data"]["owner"]);
        print(owner.id);
        print(files.length);
        print(files[1].versions?.length);
        print(files[0].versions);
      }  else {
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

  Future<void> checkIn() async {
    dio.Dio d = dio.Dio();
    _isLoading.value = true;
    update();
    try {
      dio.Response r =
      await d.patch("$baseURL/api/v1/file/lock",
        options: dio.Options(
          headers: {
            "Authorization": "Bearer ${service.token}",
          },
        ),
        data: {
          "file_ids" :checkInListIds,
        }
      );

      if (r.statusCode == 200) {
        Get.snackbar("Error", r.data["message"] ?? "Success");

      } else {
        Get.snackbar("Error", r.data["message"] ?? "An error occurred");
      }
      _isLoading.value = true;
      update();
    } on dio.DioException catch (e) {
      _isLoading.value = true;
      update();
      print("eeeeeeeeeeeeeeeee");
      Get.snackbar("Error", e.response?.data["message"] ?? e.message);
    }
  }



}
