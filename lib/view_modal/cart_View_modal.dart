import 'package:ecommerce/model/cart_product_modal.dart';
import 'package:flutter/cupertino.dart';

class CartViewModal with ChangeNotifier {
  final List<SelectedCartItemsModal> _selectedProductInCart = [];

  List<SelectedCartItemsModal> get selectedProductInCart =>
      _selectedProductInCart;

  void addItemsInCart(SelectedCartItemsModal data) {
    _selectedProductInCart.add(data);
    notifyListeners();
  }



  void removeItem(int id) {
    _selectedProductInCart.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void increaseQuantity(int id) {
    final index = _selectedProductInCart.indexWhere((item) => item.id == id);
    if (index != -1) {
      _selectedProductInCart[index].qty =
          (_selectedProductInCart[index].qty ?? 0) + 1;
      notifyListeners();
    }
  }

  void decreaseQuantity(int id) {
    final index = _selectedProductInCart.indexWhere((item) => item.id == id);
    if (index != -1 && (_selectedProductInCart[index].qty ?? 0) > 1) {
      _selectedProductInCart[index].qty =
          (_selectedProductInCart[index].qty ?? 0) - 1;
      notifyListeners();
    }
  }

  int get totalPrice {
    return _selectedProductInCart.fold(
        0, (sum, item) => sum + (item.price ?? 0) * (item.qty ?? 1));
  }

  int get itemCount {
    return _selectedProductInCart.length;
  }
}
