import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileController extends GetxController {

  late TextEditingController nameController = TextEditingController(text: "deemh Alaisame");
  late TextEditingController userNameController = TextEditingController(text:"deemh");
  late TextEditingController emailController = TextEditingController(text: "deemh@gmail.com");
  var formKey=GlobalKey<FormState>();


  PlatformFile? image;
  Future<void>pickImage()async{

    try{
      FilePickerResult?result=await FilePicker.platform.pickFiles(
        type:FileType.image,
      );
      if(result==null) return;
      else{
        image=result.files.first;
        update();
      }


    }catch(e){

    }
  }
}

