
class SelectedCartItemsModal {
  int? id;
  String? productname;
  int? price;
  int? qty;
  String? imgUrl;
  int? storeId;
  bool? variant;
 
  SelectedCartItemsModal(
      {this.id,
      this.productname,
      this.price,
      this.qty,
      this.imgUrl,
      this.storeId,
      this.variant,
     });

  SelectedCartItemsModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productname = json['productname'];
    price = json['price'];
    qty = json['qty'];
    imgUrl = json['imgUrl'];
    storeId = json['storeId'];
    variant = json['variant'];
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productname'] = productname;
    data['price'] = price;
    data['qty'] = qty;
    data['imgUrl'] = imgUrl;
    data['storeId'] = storeId;
    data['variant'] = variant;
  
    return data;
  }
}
