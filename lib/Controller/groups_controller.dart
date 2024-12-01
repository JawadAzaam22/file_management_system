import 'package:file_management_system/Model/group_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../Services/service.dart';

class GroupsController extends GetxController {
  @override
  void onInit() async{
    service = Get.find<UserService>();
    await getGroups();
    super.onInit();
  }

  final RxList<GroupModel> myGroups = <GroupModel>[].obs;
  final RxList<GroupModel> otherGroups = <GroupModel>[].obs;
  late final UserService service;
  final RxBool _isLoading = RxBool(false);
  bool get isLoading => _isLoading.value;

  void navToVerifyAccount() {
    Get.offAndToNamed("/create_groub");
  }

  void goToViewGroup(int groupId) {
    Get.toNamed("/viewGroup",
        arguments: {
          "id": groupId
        },
        );
  }

  void goToCreatGroup() {
      Get.toNamed("/create_groub");
  }

  Future<void> getGroups() async {
    _isLoading.value = true;
    dio.Dio d = dio.Dio();
    dio.Response r = await d.get(
      "https://nour.techpundits.net/api/v1/user/groups",
      options: dio.Options(
        headers: {
          "Authorization": "Bearer ${service.token}",
        },
      ),
    );

    print("///////////////////////");
    if (r.statusCode == 200 && r.data["status"] == "success") {
      if (r.data['data']['groups'] != null) {
        otherGroups.value = (r.data['data']['groups'] as List)
            .map((groupJson) => GroupModel.fromJson(groupJson))
            .toList();
      }
      if (r.data['data']['owned'] != null) {
        myGroups.value = (r.data['data']['owned'] as List)
            .map((groupJson) => GroupModel.fromJson(groupJson))
            .toList();
      }
      _isLoading.value = false;
      print("Groups: ${otherGroups.length}");
      print("Owned Groups: ${myGroups.length}");
      print(r);
    } else {
      Get.snackbar("Error", r.data["message"] ?? "error");
    }
  }
}
