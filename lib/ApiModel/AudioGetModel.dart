class AudioGet {
  String? id;
  String? audioTitle;
  String? banner;
  String? audio_upload;
  String? category;
  String? language;
  String? description;
  String? duration;
  String? authorName;

  AudioGet({
    this.id,
    this.banner,
    this.audioTitle,
    this.audio_upload,
    this.category,
    this.language,
    this.description,
    this.duration,
    this.authorName
  });

  AudioGet.fromJson(Map<String, dynamic> json) {
    print(json);
    audioTitle = json['audio_title']?? '';
    id = json['id']?? '';
    banner = json['banner']?? '';
    audio_upload = json['audio_upload']?? '';
    category = json['category']?? '';
    language = json['language']?? '';
    description = json['description']?? '';
    duration = json['duration']?? '';
    authorName = json['author_name']?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['audio_title'] = audioTitle;
    data['id'] = id;
    data['banner'] = banner;
    data['audio_upload'] = audio_upload;
    data['category'] = category;
    data['language'] = language;
    data['description'] = description;
    data['duration'] = duration;
    data['author_name'] = authorName;
    return data;
  }
}
