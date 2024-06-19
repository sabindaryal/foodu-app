import 'package:ecommerce/resource/components/button@widgets.dart';
import 'package:ecommerce/resource/components/textformfield@widgets.dart';
import 'package:ecommerce/view_modal/cart_view_modal.dart';
import 'package:ecommerce/views/place_order/select_delivery_address.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  TextEditingController remarksController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.shopping_cart),
        centerTitle: true,
        title: const Text("My Cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<CartViewModal>(
          builder: (BuildContext context, CartViewModal cartProvider,
              Widget? child) {
            return cartProvider.selectedProductInCart.isEmpty
                ? const Center(
                    child: Text("Empty Cart"),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: cartProvider.selectedProductInCart.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                    "${cartProvider.selectedProductInCart[index].productname}"),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        cartProvider.decreaseQuantity(int.parse(
                                            cartProvider
                                                .selectedProductInCart[index].id
                                                .toString()));
                                      },
                                    ),
                                    Text(cartProvider
                                        .selectedProductInCart[index].qty
                                        .toString()),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        cartProvider.increase(int.parse(
                                            cartProvider
                                                .selectedProductInCart[index].id
                                                .toString()));
                                      },
                                    ),
                                    Text(
                                        "Price: Rs ${cartProvider.selectedProductInCart[index].price}"),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      TextFormFieldWidgets(
                          controller: remarksController,
                          hintText: "Remarks",
                          icon: Icons.dock_rounded,
                          keyboardType: TextInputType.name,
                          obscureText: false),
                      Text("Gross Amount: Rs ${cartProvider.totalPrice}"),
                      Text("Discount: Rs ${cartProvider.discount}"),
                      Text("Net Amount: Rs ${cartProvider.netAmount}"),
                      ElevatedButtonWidget(
                        text: 'Continue',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const SelectDeliveryAddress();
                          }));
                        },
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}
























// class CartPage extends StatefulWidget {
//   const CartPage({super.key});

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// appBar: AppBar(centerTitle: true,    leading: const Icon(Icons.shopping_cart,color: Colors.green,),
//   title:
//   const Text("CartList",style: TextStyle(color: Colors.green,),)),
//   body:Consumer<CartViewModel>(builder:
//           (BuildContext context, CartViewModel cartProvider, Widget? child) {
//         return cartProvider.selectedProductInCart.isEmpty
//             ? const Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Center(
//                     child: CircleAvatar(
//                       radius: 50,
//                       child: Icon(Icons.remove_shopping_cart_outlined),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text("Empty Cart")
//                 ],
//               ):
//     Column(
//     children: [
// ListView.builder(itemCount:cartProvider.selectedProductInCart.length ,
//       shrinkWrap: true,
//       physics: const ScrollPhysics(),
//         itemBuilder: (context,index){
//         return  Card(
//           child: Row(
//            children: [
//                         Text(
//                             "${cartProvider.selectedProductInCart[index].productname}"),
//                         GestureDetector(
//                             onTap: () {
//                               cartProvider.removeItems(int.parse(cartProvider
//                                   .selectedProductInCart[index].id
//                                   .toString()));
//                             },
//                             child: const Icon(Icons.delete))
//                       ],
//         ));
//       }),
//     ],
//   );
     
//   }));
//   }
// }