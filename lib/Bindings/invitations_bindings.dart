import 'package:file_management_system/Controller/invitations_controller.dart';
import 'package:get/get.dart';

class InvitationsBindings implements Bindings{
  @override
  void dependencies() {
    Get.put<InvitationsController>(InvitationsController());
  }
}