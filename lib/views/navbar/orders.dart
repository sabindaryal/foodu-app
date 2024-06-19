import 'package:ecommerce/resource/components/product_widgets.dart';
import 'package:ecommerce/resource/components/skelton/product_loading_skelton.dart';
import 'package:ecommerce/resource/components/skelton/slider_loading_skelton.dart';
import 'package:ecommerce/resource/components/slider_widget.dart';
import 'package:ecommerce/resource/components/title_widgets.dart';
import 'package:ecommerce/view_modal/popular_view_modal.dart';
import 'package:ecommerce/view_modal/popular_view_modal.dart';
import 'package:ecommerce/view_modal/slider_view_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Orderpage extends StatefulWidget {
  const Orderpage({super.key});

  @override
  State<Orderpage> createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                    children: [
                      // Consumer<PopularProductViewModal>(builder: (BuildContext context,
                      //     PopularProductViewModal popularprovider, Widget? child) {
                      //   return popularprovider.isLoading
                      //       ? const SliderLoading()
                      //       : SliderWidget(sliderData: sliderProvider.sliderDate);
                      // })
              
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
              
              TitleWidgets(title: "Popular Product", onpress: (){}),
              
                              const ProdcutLoading(),
                            ],
                          )
                          :  popularProductProvider.popularData.isEmpty?const SizedBox(): Column(
                            children: [
                               const SizedBox(
                    height: 10,
                  ),
              
              TitleWidgets(title: "Popular Product", onpress: (){}),
              
                              SizedBox(
                                height:double.maxFinite,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                    itemCount: popularProductProvider.popularData.length,
                                    itemBuilder: (context, index) {
                                      // return Text("${popularProductProvider.popularData[index].productName}");
                                      return ProductWidgets(productPrice:"${popularProductProvider.popularData[index].price}" , productName: "${popularProductProvider.popularData[index].productName}", productImage:"${popularProductProvider.popularData[index].image}", addToCart: (){
              
              
              
              
              
              
              
              
              
              
              
              
                                        
                                      });
                                    }),
                              ),
                            ],
                          );
                    },
                  ),
              
              
              
                    ],
                  ),
            )));
  }
}
