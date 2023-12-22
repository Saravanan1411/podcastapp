class AudioGetId {
  String? sId;
  String? audioTitle;
  String? audioUpload;
  String? banner;
  String? category;
  String? language;
  String? description;
  String? duration;
  String? authorName;

  AudioGetId(
      {this.sId,
        this.audioTitle,
        this.audioUpload,
        this.banner,
        this.category,
        this.language,
        this.description,
        this.duration,
        this.authorName});

  AudioGetId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    audioTitle = json['audio_title'];
    audioUpload = json['audio_upload'];
    banner = json['banner'];
    category = json['category'];
    language = json['language'];
    description = json['description'];
    duration = json['duration'];
    authorName = json['author_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['audio_title'] = this.audioTitle;
    data['audio_upload'] = this.audioUpload;
    data['banner'] = this.banner;
    data['category'] = this.category;
    data['language'] = this.language;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['author_name'] = this.authorName;
    return data;
  }
}
