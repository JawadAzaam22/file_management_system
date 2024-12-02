class VersionsData {
  int? id;
  int? fileId;
  String? createdAt;
  int? userId;
  int? size;
  Map<String,dynamic>? user;

  VersionsData(
      {this.id,
        this.fileId,
        this.createdAt,
        this.userId,
        this.size,
        this.user});

  VersionsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileId = json['file_id'];
    createdAt = json['created_at'];
    userId = json['user_id'];
    size = json['size'];
    user = json['user'] ;
  }


}

class User {
  int? id;
  String? name;
  String? email;
  String? username;
  String? emailVerifiedAt;

  User({this.id, this.name, this.email, this.username, this.emailVerifiedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    emailVerifiedAt = json['email_verified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['email_verified_at'] = this.emailVerifiedAt;
    return data;
  }
}