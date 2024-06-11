
class DiscountOfferModal {
  int? id;
  String? name;
  int? discount;
  String? discountType;
  String? image;

  DiscountOfferModal({this.id, this.name, this.discount, this.discountType, this.image});

  DiscountOfferModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    discount = json['discount'];
    discountType = json['discount_type'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['discount'] = discount;
    data['discount_type'] = discountType;
    data['image'] = image;
    return data;
  }
}
