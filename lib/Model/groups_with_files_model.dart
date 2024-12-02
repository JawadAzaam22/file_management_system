

class GroupsWithFiles {
  int? id;
  int? createdBy;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;
  Owner? owner;
  List<Files>? files;

  GroupsWithFiles(
      {this.id,
        this.createdBy,
        this.name,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.owner,
        this.files});

  GroupsWithFiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdBy = json['created_by'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files!.add(new Files.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_by'] = this.createdBy;
    data['name'] = this.name;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Owner {
  int? id;
  String? name;
  String? username;
  String? email;

  Owner({this.id, this.name, this.username, this.email});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    return data;
  }
}

class Files {
  int? id;
  String? name;
  int? status;
  bool? statusBool;
  int? groupId;
  List<Versions>? versions;

  Files({this.id, this.name, this.status, this.groupId, this.versions});

  Files.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    statusBool = json['statusBool'];
    groupId = json['group_id'];
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
    data['name'] = this.name;
    data['status'] = this.status;
    data['statusBool'] = this.status;
    data['group_id'] = this.groupId;
    if (this.versions != null) {
      data['versions'] = this.versions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Versions {
  int? id;
  int? fileId;
  String? createdAt;
  Map<String,dynamic>? user;

  Versions({this.id, this.fileId, this.createdAt, this.user});

  Versions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileId = json['file_id'];
    createdAt = json['created_at'];
    user = json['user'] ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['file_id'] = this.fileId;
    data['created_at'] = this.createdAt;
    if (this.user != null) {
      data['user'] = this.user;
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? username;

  User({this.id, this.name, this.email, this.username});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    return data;
  }
}
