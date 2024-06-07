import 'dart:convert';

import 'package:ecommerce/model/slider_model.dart';
import 'package:ecommerce/resource/components/skelton/product_loading_skelton.dart';
import 'package:ecommerce/resource/components/skelton/slider_loading_skelton.dart';
import 'package:ecommerce/resource/components/slider_widget.dart';
import 'package:ecommerce/resource/components/textformfield@widgets.dart';
import 'package:ecommerce/resource/services/local_storage/session_manage.dart';
import 'package:ecommerce/resource/services/local_storage/user_info.dart';
import 'package:ecommerce/view_modal/category_view_modal.dart';
import 'package:ecommerce/view_modal/slider_view_modal.dart';
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

    Provider.of<CategoryViewModal>(context, listen: false).fetchCategoryList();
    Provider.of<SliderViewModal>(context, listen: false).fetchSliderApi();
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

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special Offers",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  )
                ],
              ),
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
              Consumer<CategoryViewModal>(
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
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Image(
                                height: 50,

                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset('assets/logo.png');
                                },
                                image: NetworkImage(
                                  "${categoryProvider.categoryData[index].image}",
                                )),
                            Text("${categoryProvider.categoryData[index].name}")
                          ],
                        );
                      });
                },
              ),
              // const ProdcutLoading(),
            ],
          ),
        ),
      )),
    );
  }
}
