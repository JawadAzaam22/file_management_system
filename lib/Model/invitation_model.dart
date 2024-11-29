class InvitationModel {
  String? status;
  String? message;
  List<Data>? data;
  int? code;

  InvitationModel({this.status, this.message, this.data, this.code});

  InvitationModel.fromJson(Map<String, dynamic> json) {
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
  GroupInfoDTO? groupInfoDTO;
  String? status;

  Data({this.id, this.groupInfoDTO, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupInfoDTO = json['groupInfoDTO'] != null
        ? new GroupInfoDTO.fromJson(json['groupInfoDTO'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.groupInfoDTO != null) {
      data['groupInfoDTO'] = this.groupInfoDTO!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class GroupInfoDTO {
  String? name;
  String? description;
  Owner? owner;

  GroupInfoDTO({this.name, this.description, this.owner});

  GroupInfoDTO.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    return data;
  }
}

class Owner {
  int? id;
  String? name;
  String? email;
  String? username;
  String? emailVerifiedAt;
  Null? imagePath;

  Owner(
      {this.id,
        this.name,
        this.email,
        this.username,
        this.emailVerifiedAt,
        this.imagePath});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    emailVerifiedAt = json['email_verified_at'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['image_path'] = this.imagePath;
    return data;
  }
}

