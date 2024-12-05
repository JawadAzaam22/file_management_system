class FileModel {
  String? status;
  String? message;
  List<Data>? data;
  int? code;

  FileModel({this.status, this.message, this.data, this.code});

  FileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Data {
  int? id;
  int? groupId;
  int? createdBy;
  String? name;
  int? status;
  String? adminGroupApprove;
  Null? approvedAt;
  int? size;
  String? createdAt;
  String? updatedAt;
  List<Versions>? versions;

  Data(
      {this.id,
        this.groupId,
        this.createdBy,
        this.name,
        this.status,
        this.adminGroupApprove,
        this.approvedAt,
        this.size,
        this.createdAt,
        this.updatedAt,
        this.versions});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
    createdBy = json['created_by'];
    name = json['name'];
    status = json['status'];
    adminGroupApprove = json['admin_group_approve'];
    approvedAt = json['approved_at'];
    size = json['size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['versions'] != null) {
      versions = <Versions>[];
      json['versions'].forEach((v) {
        versions!.add(new Versions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['group_id'] = this.groupId;
    data['created_by'] = this.createdBy;
    data['name'] = this.name;
    data['status'] = this.status;
    data['admin_group_approve'] = this.adminGroupApprove;
    data['approved_at'] = this.approvedAt;
    data['size'] = this.size;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.versions != null) {
      data['versions'] = this.versions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Versions {
  int? id;
  int? userId;
  int? fileId;
  String? path;
  Null? diffPath;
  int? size;
  String? createdAt;
  String? updatedAt;
  User? user;

  Versions(
      {this.id,
        this.userId,
        this.fileId,
        this.path,
        this.diffPath,
        this.size,
        this.createdAt,
        this.updatedAt,
        this.user});

  Versions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fileId = json['file_id'];
    path = json['path'];
    diffPath = json['diff_path'];
    size = json['size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['file_id'] = this.fileId;
    data['path'] = this.path;
    data['diff_path'] = this.diffPath;
    data['size'] = this.size;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}