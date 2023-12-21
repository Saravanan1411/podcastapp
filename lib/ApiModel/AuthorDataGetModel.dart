class CategoryGet {
  String? author_name;
  String? author_profile_picture;
  String? category;
  String? linkedin;
  String? instagram;
  String? gmail;
  String? facebook;

  CategoryGet({this.author_name, this.author_profile_picture,this.category,this.facebook,this.gmail,this.instagram,this.linkedin});

  CategoryGet.fromJson(Map<String, dynamic> json) {
    author_name = json['author_name'];
    category = json['category'];
    facebook = json['facebook'];
    gmail = json['gmail'];
    author_profile_picture = json['author_profile_picture'];
    instagram = json['instagram'];
    linkedin = json['linkedin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facebook'] = this.facebook;
    data['author_profile_picture'] = this.author_profile_picture;
    data['category'] = this.category;
    data['author_name'] = this.author_name;
    data['gmail'] = this.gmail;
    data['instagram'] = this.instagram;
    data['linkedin'] = this.linkedin;
    return data;
  }
}
