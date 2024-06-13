import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    return  SizedBox(
      width: 190,
      child: Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Image(image: NetworkImage(productImage),
        fit: BoxFit.cover,
        height: 150,),
        const SizedBox(height: 10,),
        Text(productName,maxLines: 1,   style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
        const SizedBox(height: 10,),
        Card(
shape: const StadiumBorder(
                
                side: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 4),
            child: Text("rs$productPrice",style: const TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.w500),),
          ),
          ),
        const SizedBox(height: 10,),
        InkWell(onTap: addToCart,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
        Icon(Icons.shopping_cart,color: Colors.green,),
        Text("Add To Cart",style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w500),)
          ],),
        )
       
        ],),
      ),
      
      
      ),
    );
  }
}
