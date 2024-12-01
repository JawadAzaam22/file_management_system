import 'package:file_management_system/Model/user_model.dart';

class GroupDrawerModel {
  int? id;
  String? name;
  String? description;
  String? createdAt;
  int? ownerId;
  String? ownerUsername;
  List<UserModel>? users;

  GroupDrawerModel(
      {this.id,
        this.name,
        this.description,
        this.createdAt,
        this.ownerId,
        this.ownerUsername,
        this.users});

  GroupDrawerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    ownerId = json['owner_id'];
    ownerUsername = json['owner_username'];
    if (json['users'] != null) {
      users = <UserModel>[];
      json['users'].forEach((v) {
        users!.add(new UserModel.fromJson(v));
      });
    }
  }


}