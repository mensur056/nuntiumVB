class NewsModel {
  String? description;
  String? image;
  String? title;

  NewsModel({this.description, this.image, this.title});

  NewsModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    image = json['image'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['image'] = image;
    data['title'] = title;
    return data;
  }
}
