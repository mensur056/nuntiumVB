class NewsModel {
  String? image;
  String? description;
  String? title;

  NewsModel({this.image, this.description, this.title});

  NewsModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    description = json['description'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['description'] = description;
    data['title'] = title;
    return data;
  }
}
