import 'dart:async';
import 'dart:async';

import 'package:file_management_system/Model/checkin_file_model.dart';
import 'package:file_management_system/Model/group_drawer_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:dio/dio.dart' as dio;
import '../Model/groups_with_files_model.dart';
import '../Model/versionData_model.dart';
import '../Services/service.dart';
import '../UI/constants.dart';
import 'package:dio/dio.dart';
import 'dart:html' as html;
class ViewGroupController extends GetxController {


  @override
  Future<void> onInit() async {

    groupID =Get.arguments["id"];
    groupData =Get.arguments["groupData"];
    service=Get.find();
    await getFiles(groupID);

       super.onInit();
  }
  late final UserService service;
  RxBool  val = RxBool(false);
  bool  val1=false;
  List checkInListIds=[];
 checkInListIdsFunc(bool val,int fileId){
   print(checkInListIds);
    if (val){
      int g=0;
      for(int i =0;i<checkInListIds.length;i++)
      {

        if(fileId==checkInListIds[i]){
          g=g+1;

        }
      }
      if(g==0){
        checkInListIds.add(fileId);
        update();
      }

      update();
      print(checkInListIds);
    } else {
      for(int i =0;i<checkInListIds.length;i++)
        {
          if(fileId==checkInListIds[i]){
            checkInListIds.remove(fileId);
            update();
          }
        }



      print(checkInListIds);
    }
  }

  RxBool isTapped = RxBool(false);

  late int groupID;

  late GroupDrawerModel groupData;

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



  RxBool fileIsTaped=RxBool(false);

  void navToReport(){

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
        files.value=[];
        files1.value=[];
        await getFiles(groupID);
        update();
      } else if (r.statusCode == 400) {
        Get.snackbar("Error","You cannot upload afile with this extension");
      }
    }on dio.DioException catch (e) {
      Get.snackbar("Error","You cannot upload afile with this extension");
    }
  }


  RxList<Files>files=RxList([]);
  RxList<Files>files1=RxList([]);
  Owner owner=Owner();

  Future<void> getFiles(int groupID) async {
    dio.Dio d = dio.Dio();

    _isLoading.value = true;
    update();
    try {

      dio.Response r = await d.get(
          "$baseURL/api/v1/group/files/$groupID",

          options: dio.Options(
            headers: {
              "Authorization": "Bearer ${service.token}",
            },
          ));

      List<dynamic> temp = r.data["data"]["files"];
      if (r.statusCode == 200) {
        files.addAll(temp.map((e) => Files.fromJson(e)));

        files1.addAll(temp.map((e) => Files.fromJson(e)));
        owner = Owner.fromJson(r.data["data"]["owner"]);

      }  else {

        Get.snackbar("Error", r.data["message"] ?? "An error occurred");
      }
      _isLoading.value = false;
      update();
    } on dio.DioException catch (e) {
      _isLoading.value = false;
      update();
      print("eeeeeeeeeeeeeeeeekkkkk");
      Get.snackbar("Error", e.response?.data["message"] ?? e.message);
    }
  }




  final RxBool _isLoadingCheck = RxBool(false);

  bool get isLoadingCheck => _isLoadingCheck.value;
  Future<void> checkIn() async {
    dio.Dio d = dio.Dio();
    _isLoadingCheck.value = true;
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
        fileIsTaped.value = false;
        checkInListIds=[];
        files.value=[];
        files1.value=[];
        await getFiles(groupID);
       update();

        Get.snackbar("Error", r.data["message"] ?? "Success");

      } else {
        Get.snackbar("Error", r.data["message"] ?? "An error occurred");
      }
      _isLoadingCheck.value = true;
      update();
    } on dio.DioException catch (e) {
      _isLoadingCheck.value = true;
      update();
      print("eeeeeeeeeeeeeeeee");
      Get.snackbar("Error", e.response?.data["message"] ?? e.message);
    }
  }


  final RxBool _isLoad = RxBool(false);
  bool get isLoad => _isLoad.value;
  RxList<VersionsData> versions=RxList([]);
  Future<void> navToPrevious(int fileId,String fileName) async {
    dio.Dio d = dio.Dio();


    _isLoad.value = true;
    update();
    try {

      dio.Response r = await d.get(
          "$baseURL/api/v1/group/files/admin/$fileId",
          options: dio.Options(
            headers: {
              "Authorization": "Bearer ${service.token}",
            },
          ));



      if (r.statusCode == 200) {


        List<dynamic>versionsData = r.data["data"]["versions"];
        versions.addAll(versionsData.map((e) => VersionsData.fromJson(e)));
        update();
        print(versions.length);

        Get.toNamed("/preVersion",
            arguments: {

              "fileName":fileName,
              "versions":versions,
            }
        );

        //print(versions.length);


      }  else {
        Get.snackbar("Error", r.data["message"] ?? "An error occurred");
      }
      _isLoad.value = false;
      update();
    } on dio.DioException catch (e) {
      _isLoad.value = false;
      update();
      print("eeeeeeeeeeeeeeeee");
      Get.snackbar("Error", e.response?.data["message"] ?? e.message);
    }
  }

}
