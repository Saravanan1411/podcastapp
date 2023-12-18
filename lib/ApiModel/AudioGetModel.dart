class AudioGet {
  String? audioTitle;
  String? audioUpload;
  String? category;
  String? language;
  String? description;
  String? duration;
  String? authorName;

  AudioGet({
    this.audioTitle,
    this.audioUpload,
    this.category,
    this.language,
    this.description,
    this.duration,
    this.authorName
  });

  AudioGet.fromJson(Map<String, dynamic> json) {
    audioTitle = json['audio_title']?? '';
    audioUpload = json['audio_upload']?? '';
    category = json['category']?? '';
    language = json['language']?? '';
    description = json['description']?? '';
    duration = json['duration']?? '';
    authorName = json['author_name']?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['audio_title'] = audioTitle;
    data['audio_upload'] = audioUpload;
    data['category'] = category;
    data['language'] = language;
    data['description'] = description;
    data['duration'] = duration;
    data['author_name'] = authorName;
    return data;
  }
}
