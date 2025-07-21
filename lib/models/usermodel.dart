class UserModel {


  final String userName;
  final String emailId;
  final String password;


  UserModel({
    required this.userName,
    required this.emailId,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {

    return UserModel(
      userName: json['username'],
      emailId: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
     final Map<String,dynamic> data=new Map<String,dynamic>();

    data['username']=this.userName;
    data['email']=this.emailId;
    data['password']=this.password;
    

    
    return data;
  }


}
