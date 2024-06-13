import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 4,
    shrinkWrap: true,
    physics: const ScrollPhysics(),
      itemBuilder: (context,index){

      return null;
    
      
    });
  }
}