import 'package:ecommerce/model/cart_product_modal.dart';
import 'package:ecommerce/resource/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          _selectedProductInCart[indexValue].initalPrice!.toInt() *
              _selectedProductInCart[indexValue].qty!.toInt();
    } else {
      _selectedProductInCart.add(data);
    }

    notifyListeners();

    ToastMessage.toastMsg("Add In cart", Colors.green);
  }

  void removeItem(int id) {
    _selectedProductInCart.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void increase(int selectedId) {
    final indexValue = _selectedProductInCart
        .indexWhere((element) => element.id == selectedId);

    if (indexValue != -1) {
      _selectedProductInCart[indexValue].qty =
          _selectedProductInCart[indexValue].qty! + 1;

      _selectedProductInCart[indexValue].price =
          _selectedProductInCart[indexValue].initalPrice!.toInt() *
              _selectedProductInCart[indexValue].qty!.toInt();

      notifyListeners();
    }
  }

  void decreaseQuantity(int id) {
    final index = _selectedProductInCart.indexWhere((item) => item.id == id);

    if (index != -1 && _selectedProductInCart[index].qty! > 1) {
      _selectedProductInCart[index].qty =
          _selectedProductInCart[index].qty! - 1;

      _selectedProductInCart[index].price =
          _selectedProductInCart[index].price!.toInt() -
              _selectedProductInCart[index].initalPrice!.toInt();
    } else {
      _selectedProductInCart.removeAt(index);
    }

    notifyListeners();
  }

  int get totalPrice {
    return _selectedProductInCart.fold(
        0, (sum, item) => sum + (item.price ?? 0) * (item.qty ?? 1));
  }

  int get itemCount {
    return _selectedProductInCart.length;
  }
}
