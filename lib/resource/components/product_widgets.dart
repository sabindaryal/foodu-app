import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductWidgets extends StatelessWidget {
  final String productPrice;
  final String productName;
  final String productImage;
  final VoidCallback addToCart;
  const ProductWidgets(
      {super.key,
      required this.productPrice,
      required this.productName,
      required this.productImage,
      required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return  Card(
child: Column(children: [

Image(image: NetworkImage(productImage),
fit: BoxFit.cover,
height: 150,),
const Text(""),



],),


    );
  }
}
