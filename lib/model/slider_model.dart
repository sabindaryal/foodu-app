

class SliderModel {
  int? id;
  String? title;
  String? image;
  String? type;
  String? name;
  String? slug;

  SliderModel({this.id, this.title, this.image, this.type, this.name, this.slug});

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    type = json['type'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['type'] = type;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}
