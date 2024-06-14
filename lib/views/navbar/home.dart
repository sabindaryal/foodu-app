import 'dart:convert';

import 'package:ecommerce/model/cart_product_modal.dart';
import 'package:ecommerce/model/discount_offer_modal.dart';
import 'package:ecommerce/model/popular_product_modal.dart';
import 'package:ecommerce/model/slider_model.dart';
import 'package:ecommerce/resource/components/product_widgets.dart';
import 'package:ecommerce/resource/components/skelton/product_loading_skelton.dart';
import 'package:ecommerce/resource/components/skelton/slider_loading_skelton.dart';
import 'package:ecommerce/resource/components/slider_widget.dart';
import 'package:ecommerce/resource/components/textformfield@widgets.dart';
import 'package:ecommerce/resource/components/title_widgets.dart';
import 'package:ecommerce/resource/services/local_storage/session_manage.dart';
import 'package:ecommerce/resource/services/local_storage/user_info.dart';
import 'package:ecommerce/view_modal/cart_View_modal.dart';
import 'package:ecommerce/view_modal/category_view_modal.dart';
import 'package:ecommerce/view_modal/discount_offer_view_modal.dart';
import 'package:ecommerce/view_modal/popular_view_modal.dart';
import 'package:ecommerce/view_modal/slider_view_modal.dart';
import 'package:ecommerce/view_modal/top_rated_product_view_modal.dart';
import 'package:ecommerce/views/navbar/orders.dart';
import 'package:ecommerce/views/navbar/profile.dart';
import 'package:ecommerce/views/navbar/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

   
  }

  String profileImge = '';
  Future<void> getImge() async {
    profileImge = await UserLocalInfo.getUserImge();
    setState(() {});
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                'https://example.com/profile-pic.jpg',
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/logo.png');
                },
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deliver To',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Text(
              'Times Square',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.notifications, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.shopping_cart, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    height: 45,
                    child: TextFormFieldWidgets(
                        controller: searchController,
                        hintText: "Search",
                        icon: Icons.search,
                        keyboardType: TextInputType.name,
                        obscureText: false)),

                const SizedBox(
                  height: 15,
                ),

                TitleWidgets(title: "Catogeries", onpress: () {}),

                const SizedBox(
                  height: 15,
                ),
                Consumer<SliderViewModal>(builder: (BuildContext context,
                    SliderViewModal sliderProvider, Widget? child) {
                  return sliderProvider.isLoading
                      ? const SliderLoading()
                      : SliderWidget(
                          sliderData: sliderProvider.sliderDate,
                        );
                }),
                const SizedBox(
                  height: 10,
                ),
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "Special Offers",
                //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                //     ),
                //     Text(
                //       "See All",
                //       style: TextStyle(
                //           fontSize: 16,
                //           fontWeight: FontWeight.w500,
                //           color: Colors.green),
                //     )
                //   ],
                // ),

                TitleWidgets(title: "Special Offers", onpress: () {}),

                const SizedBox(
                  height: 10,
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<CategoryViewModal>(
                      builder: (BuildContext context,
                          CategoryViewModal categoryProvider, Widget? child) {
                        return GridView.builder(
                            itemCount: categoryProvider.categoryData.length,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Image(
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset('assets/logo.png');
                                        },
                                        image: NetworkImage(
                                          "${categoryProvider.categoryData[index].image}",
                                        )),
                                  ),
                                  Text(
                                    "${categoryProvider.categoryData[index].name}",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              );
                            });
                      },
                    ),
                  ),
                ),

                // const Row(
                //   children: [
                //     Text(
                //       "Discount Guaranteed!",
                //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                //     ),
                //     // Icon(
                //     //   Icons.offline_bolt_rounded,
                //     //   color: Colors.green,
                //     // ),
                //     Spacer(),
                //     Text(
                //       "See All",
                //       style: TextStyle(
                //           color: Colors.green,
                //           fontSize: 16,
                //           fontWeight: FontWeight.w500),
                //     ),
                //   ],
                // ),

                //  const ProdcutLoading(),

                Consumer<DiscountOfferViewModal>(
                  builder: (BuildContext context,
                      DiscountOfferViewModal discountOfferProvider,
                      Widget? child) {
                    return discountOfferProvider.isLoading
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              TitleWidgets(
                                  title: "Discount Guaranteed!",
                                  onpress: () {}),
                              const ProdcutLoading(),
                            ],
                          )
                        : discountOfferProvider.discountData.isEmpty
                            ? const SizedBox()
                            : Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TitleWidgets(
                                      title: "Discount Guaranteed!",
                                      onpress: () {}),
                                  SizedBox(
                                    height: 200,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: discountOfferProvider
                                            .discountData.length,
                                        itemBuilder: (context, index) {
                                          return Text(
                                              "${discountOfferProvider.discountData[index].name}");
                                        }),
                                  ),
                                ],
                              );
                  },
                ),
                Consumer<PopularProductViewModal>(
                  builder: (BuildContext context,
                      PopularProductViewModal popularProductProvider,
                      Widget? child) {
                    return popularProductProvider.isLoading
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              TitleWidgets(
                                  title: "Popular Product", onpress: () {}),
                              const ProdcutLoading(),
                            ],
                          )
                        : popularProductProvider.popularData.isEmpty
                            ? const SizedBox()
                            : Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TitleWidgets(
                                      title: "Popular Product", onpress: () {}),
                                  SizedBox(
                                    height: 300,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        physics: const ScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: popularProductProvider
                                            .popularData.length,
                                        itemBuilder: (context, index) {
                                          PopularProductModal value =
                                              popularProductProvider
                                                  .popularData[index];
                                          // return Text("${popularProductProvider.popularData[index].productName}");
                                          return ProductWidgets(
                                              productPrice: "${value.price}",
                                              productName:
                                                  "${value.productName}",
                                              productImage: "${value.image}",
                                              addToCart: () {
                                                SelectedCartItemsModal items =
                                                    SelectedCartItemsModal(
                                                        id: value.productId,
                                                        productname:
                                                            value.productName,
                                                        price: int.parse(value
                                                            .price
                                                            .toString()),
                                                        qty: 1,
                                                        initalPrice:int.tryParse( value.price.toString()),
                                                        imgUrl: value.image,
                                                        storeId: value.storeId,
                                                        variant:
                                                            value.totalVariants ==
                                                                    0
                                                                ? false
                                                                : true);

                                                Provider.of<CartViewModal>(
                                                        context,
                                                        listen: false)
                                                    .addItemsInCart(items);
                                              });
                                        }),
                                  ),
                                ],
                              );
                  },
                ),
                Consumer<TopRatedProductViewModel>(
                  builder: (BuildContext context,
                      TopRatedProductViewModel topRatedProductProvider,
                      Widget? child) {
                    return topRatedProductProvider.isLoading
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              TitleWidgets(
                                  title: "Top Rated Product", onpress: () {}),
                              const ProdcutLoading(),
                            ],
                          )
                        : topRatedProductProvider.topRatedData.isEmpty
                            ? const SizedBox()
                            : Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TitleWidgets(
                                      title: "Top Rated Product",
                                      onpress: () {}),
                                  SizedBox(
                                    height: 300,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        physics: const ScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: topRatedProductProvider
                                            .topRatedData.length,
                                        itemBuilder: (context, index) {
                                          // return Text("${value.productName}");
                                          return ProductWidgets(
                                              productPrice:
                                                  "${topRatedProductProvider.topRatedData[index].price}",
                                              productName:
                                                  "${topRatedProductProvider.topRatedData[index].productName}",
                                              productImage:
                                                  "${topRatedProductProvider.topRatedData[index].image}",
                                              addToCart: () {});
                                        }),
                                  ),
                                ],
                              );
                  },
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
