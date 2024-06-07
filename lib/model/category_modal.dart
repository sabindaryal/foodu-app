

class CategoryModal {
  String? name;
  String? categorySlug;
  String? image;

  CategoryModal({this.name, this.categorySlug, this.image});

  CategoryModal.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    categorySlug = json['category_slug'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['category_slug'] = categorySlug;
    data['image'] = image;
    return data;
  }
}
