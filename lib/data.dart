

class Video {
  String? author;
  String? imageUrl;
  String? title;
  String? videoUrl;
  int? percentage;

  Video({this.author, this.imageUrl, this.title, this.videoUrl,this.percentage});

  Video.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    imageUrl = json['image_url'];
    title = json['title'];
    videoUrl = json['video_url'];
    percentage = json['percentage']??0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['image_url'] = imageUrl;
    data['title'] = title;
    data['video_url'] = videoUrl;
    data['percentage']=percentage;
    return data;
  }
}