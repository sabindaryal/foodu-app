import 'package:ecommerce/view_modal/cart_View_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.shopping_cart),
        centerTitle: true,
        title: const Text("My Cart"),
      ),
      body: Consumer<CartViewModal>(builder:
          (BuildContext context, CartViewModal cartProvider, Widget? child) {
        return cartProvider.selectedProductInCart.isEmpty
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      child: Icon(Icons.remove_shopping_cart_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Empty Cart")
                ],
              )
            : ListView.builder(
                itemCount: cartProvider.selectedProductInCart.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      children: [
                        Text(
                            "${cartProvider.selectedProductInCart[index].productname}"),
                        GestureDetector(
                            onTap: () {
                              cartProvider.removeItem(int.parse(cartProvider
                                  .selectedProductInCart[index].id
                                  .toString()));
                            },
                            child: const Icon(Icons.delete))
                      ],
                    ),
                  );
                });
      }),
    );
  }
}
