import 'dart:convert';

import 'package:ecommerce/model/selected_product_cart_model.dart';
import 'package:ecommerce/resource/base_url.dart';
import 'package:ecommerce/resource/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;




class CartViewModal with ChangeNotifier {
  final List<SelectedCartItemsModal> _selectedProductInCart = [];

  List<SelectedCartItemsModal> get selectedProductInCart =>
      _selectedProductInCart;

  void addItemsInCart(SelectedCartItemsModal data) {
    final indexValue =
        _selectedProductInCart.indexWhere((element) => element.id == data.id);

    if (indexValue != -1) {
      _selectedProductInCart[indexValue].qty =
          _selectedProductInCart[indexValue].qty! + 1;
      _selectedProductInCart[indexValue].price =
          _selectedProductInCart[indexValue].initalPrice!.toDouble() *
              _selectedProductInCart[indexValue].qty!.toDouble();
    } else {
      _selectedProductInCart.add(data);
    }

    notifyListeners();

    calculateNetAmountPrice();
    ToastMessage.toastMsg("Add In cart", Colors.green);
  }

  void removeItem(int id) {
    _selectedProductInCart.removeWhere((item) => item.id == id);
    calculateNetAmountPrice();
    notifyListeners();
  }

  void increase(int selectedId) {
    final indexValue = _selectedProductInCart
        .indexWhere((element) => element.id == selectedId);

    if (indexValue != -1) {
      _selectedProductInCart[indexValue].qty =
          _selectedProductInCart[indexValue].qty! + 1;

      _selectedProductInCart[indexValue].price =
          _selectedProductInCart[indexValue].initalPrice!.toDouble() *
              _selectedProductInCart[indexValue].qty!.toDouble();

      notifyListeners();
    }

    calculateNetAmountPrice();
  }

  void decreaseQuantity(int id) {
    final index = _selectedProductInCart.indexWhere((item) => item.id == id);

    if (index != -1 && _selectedProductInCart[index].qty! > 1) {
      _selectedProductInCart[index].qty =
          _selectedProductInCart[index].qty! - 1;

      _selectedProductInCart[index].price =
          _selectedProductInCart[index].price!.toDouble() -
              _selectedProductInCart[index].initalPrice!.toDouble();
    } else {
      _selectedProductInCart.removeAt(index);
    }
    calculateNetAmountPrice();
    notifyListeners();
  }

  double get totalPrice {
    return _selectedProductInCart.fold(
        0, (sum, item) => sum + (item.price ?? 0));
  }

   double _discount = 0;
  double get discount => _discount;

  Future<void> getDiscount() async {
    try {
      final response = await http.get(Uri.parse(ApiUrls.descointUrlGet));

      if (response.statusCode == 200) {
        _discount = jsonDecode(response.body)['discount'] ?? 0;
      }
    } catch (e) {
      print(e);
    }
  }

  double netAmount = 0.0;

  void calculateNetAmountPrice() {
    double discountAmount = totalPrice * (_discount / 100);

    netAmount = totalPrice - discountAmount;
  }
}





















// class CartViewModel with ChangeNotifier{  


  

// final List<SelectedProductCart> _selectedProductInCart=[];
// List<SelectedProductCart> get selectedProductInCart=>_selectedProductInCart;
// void addItemsInCart(SelectedProductCart data){
// _selectedProductInCart.add(data);

  
// }

// void removeItems(int id){
// _selectedProductInCart.removeWhere((item) => item.id==id);
// notifyListeners();
// }
// void increaseQuantity(int id) {
//     final index = _selectedProductInCart.indexWhere((item) => item.id == id);
//     if (index != -1) {
//       _selectedProductInCart[index].qty =
//           (_selectedProductInCart[index].qty ?? 0) + 1;
//       notifyListeners();
//     }
//   }
//    void decreaseQuantity(int id) {
//     final index = _selectedProductInCart.indexWhere((item) => item.id == id);
//     if (index != -1 && (_selectedProductInCart[index].qty ?? 0) > 1) {
//       _selectedProductInCart[index].qty =
//           (_selectedProductInCart[index].qty ?? 0) - 1;
//       notifyListeners();
//     }
//   }
//    int get totalPrice {
//     return _selectedProductInCart.fold(
//         0, (sum, item) => sum + (item.price ?? 0) * (item.qty ?? 1));
//   }

//   int get itemCount {
//     return _selectedProductInCart.length;
//   }





// }

