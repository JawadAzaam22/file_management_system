class UserModel{
  UserModel({this.id,this.name,this.email,this.username,this.profile_image});

  int? id;
  String? name;
  String? email;
  String? username;
  String? profile_image;




  factory UserModel.fromJson(Map<String,dynamic> data){
    return UserModel(
      id: data["id"],
      name: data["name"],
      email: data["email"],
      username: data["username"],
      profile_image: data["profile_image"],


    );
  }
}