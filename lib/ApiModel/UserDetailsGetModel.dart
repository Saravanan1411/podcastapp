class UserDetailsGet {
  String? userName;
  int? mobile;
  String? email;
  String? gender;

  UserDetailsGet({this.userName, this.mobile, this.email, this.gender});

  UserDetailsGet.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    mobile = json['mobile'];
    email = json['email'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['gender'] = this.gender;
    return data;
  }
}
