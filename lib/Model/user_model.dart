class UserModel{
  UserModel({this.id,this.name,this.email,this.username,this.image_path});

  int? id;
  String? name;
  String? email;
  String? username;
  String? image_path;




  factory UserModel.fromJson(Map<String,dynamic> data){
    return UserModel(
      id: data["id"],
      name: data["name"],
      email: data["email"],
      username: data["username"],
      image_path: data["image_path"],


    );
  }
}