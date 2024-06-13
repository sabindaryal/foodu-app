import 'package:ecommerce/model/discount_offer_modal.dart';
import 'package:ecommerce/view_modal/cart_View_modal.dart';
import 'package:ecommerce/view_modal/category_view_modal.dart';
import 'package:ecommerce/view_modal/discount_offer_view_modal.dart';
import 'package:ecommerce/view_modal/popular_view_modal.dart';
import 'package:ecommerce/view_modal/slider_view_modal.dart';
import 'package:ecommerce/view_modal/top_rated_product_view_modal.dart';
import 'package:ecommerce/views/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SliderViewModal()),
        ChangeNotifierProvider(create: (_) => CategoryViewModal()),
         ChangeNotifierProvider(create: (_) => DiscountOfferViewModal()),
         ChangeNotifierProvider(create: (_) => PopularProductViewModal()),
         ChangeNotifierProvider(create: (_) => TopRatedProductViewModel()),

         ChangeNotifierProvider(create: (_)=>CartViewModal())

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        builder: FToastBuilder(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Splashscreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
