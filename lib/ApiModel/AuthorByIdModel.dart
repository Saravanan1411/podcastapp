class AuthorGetById {
  SocialMedia? socialMedia;
  String? sId;
  String? authorName;
  String? authorProfilePicture;
  String? category;

  AuthorGetById(
      {this.socialMedia,
        this.sId,
        this.authorName,
        this.authorProfilePicture,
        this.category});

  AuthorGetById.fromJson(Map<String, dynamic> json) {
    socialMedia = json['social_media'] != null
        ? new SocialMedia.fromJson(json['social_media'])
        : null;
    sId = json['_id'];
    authorName = json['author_name'];
    authorProfilePicture = json['author_profile_picture'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.socialMedia != null) {
      data['social_media'] = this.socialMedia!.toJson();
    }
    data['_id'] = this.sId;
    data['author_name'] = this.authorName;
    data['author_profile_picture'] = this.authorProfilePicture;
    data['category'] = this.category;
    return data;
  }
}

class SocialMedia {
  String? linkedin;
  String? instagram;
  String? gmail;
  String? facebook;

  SocialMedia({this.linkedin, this.instagram, this.gmail, this.facebook});

  SocialMedia.fromJson(Map<String, dynamic> json) {
    linkedin = json['linkedin'];
    instagram = json['instagram'];
    gmail = json['gmail'];
    facebook = json['facebook'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['linkedin'] = this.linkedin;
    data['instagram'] = this.instagram;
    data['gmail'] = this.gmail;
    data['facebook'] = this.facebook;
    return data;
  }
}
