class LanguageGet {
  String? languageName;
  String? languageImage;

  LanguageGet({this.languageName, this.languageImage});

  LanguageGet.fromJson(Map<String, dynamic> json) {
    languageName = json['language_name'];
    languageImage = json['language_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language_name'] = this.languageName;
    data['language_image'] = this.languageImage;
    return data;
  }
}
