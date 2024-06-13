
class TopRatedProductmodal {
  int? storeId;
  String? productName;
  String? price;
  String? image;
  String? description;
  int? isAvailable;
  String? rating;
  int? productId;
  String? categoryName;
  int? totalVariants;
  String? minimumPrice;
  String? maximumPrice;
  List<ProductVariants>? productVariants;

  TopRatedProductmodal(
      {this.storeId,
      this.productName,
      this.price,
      this.image,
      this.description,
      this.isAvailable,
      this.rating,
      this.productId,
      this.categoryName,
      this.totalVariants,
      this.minimumPrice,
      this.maximumPrice,
      this.productVariants});

  TopRatedProductmodal.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    productName = json['product_name'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
    isAvailable = json['is_available'];
    rating = json['rating'];
    productId = json['product_id'];
    categoryName = json['category_name'];
    totalVariants = json['total_variants'];
    minimumPrice = json['minimum_price'];
    maximumPrice = json['maximum_price'];
    if (json['product_variants'] != null) {
      productVariants = <ProductVariants>[];
      json['product_variants'].forEach((v) {
        productVariants!.add(ProductVariants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['store_id'] = storeId;
    data['product_name'] = productName;
    data['price'] = price;
    data['image'] = image;
    data['description'] = description;
    data['is_available'] = isAvailable;
    data['rating'] = rating;
    data['product_id'] = productId;
    data['category_name'] = categoryName;
    data['total_variants'] = totalVariants;
    data['minimum_price'] = minimumPrice;
    data['maximum_price'] = maximumPrice;
    if (productVariants != null) {
      data['product_variants'] =
          productVariants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductVariants {
  int? id;
  String? name;
  String? price;
  String? image;
  String? slug;
  int? available;
  String? createdAt;
  String? updatedAt;

  ProductVariants(
      {this.id,
      this.name,
      this.price,
      this.image,
      this.slug,
      this.available,
      this.createdAt,
      this.updatedAt});

  ProductVariants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    slug = json['slug'];
    available = json['available'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    data['slug'] = slug;
    data['available'] = available;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
