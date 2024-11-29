class GroupModel {
  String? groupName;
  String? groupDescription;
  String? role;
  String? ownerName;
  String? ownerUsername;

  GroupModel(
      {this.groupName,
        this.groupDescription,
        this.role,
        this.ownerName,
        this.ownerUsername});

  GroupModel.fromJson(Map<String, dynamic> json) {
    groupName = json['group_name'];
    groupDescription = json['group_description'];
    role = json['role'];
    ownerName = json['owner_name'];
    ownerUsername = json['owner_username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['group_name'] = this.groupName;
    data['group_description'] = this.groupDescription;
    data['role'] = this.role;
    data['owner_name'] = this.ownerName;
    data['owner_username'] = this.ownerUsername;
    return data;
  }
}
