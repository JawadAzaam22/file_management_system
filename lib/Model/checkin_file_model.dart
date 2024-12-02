class CheckinFileModel {
  String? fileName;
  int? fileId;
  String? lockedAt;

  CheckinFileModel({this.fileName, this.fileId, this.lockedAt});

  CheckinFileModel.fromJson(Map<String, dynamic> json) {
    fileName = json['file_name'];
    fileId = json['file_id'];
    lockedAt = json['locked_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file_name'] = this.fileName;
    data['file_id'] = this.fileId;
    data['locked_at'] = this.lockedAt;
    return data;
  }
}