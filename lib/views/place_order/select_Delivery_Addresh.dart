import 'package:ecommerce/views/place_order/set_addres.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectDeliveryAddress extends StatefulWidget {
  const SelectDeliveryAddress({super.key});

  @override
  State<SelectDeliveryAddress> createState() => _SelectDeliveryAddressState();
}

class _SelectDeliveryAddressState extends State<SelectDeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Checkout"),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SelectAddreshOnMap();
              }));
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.location_on),
            ),
          )
        ],
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
