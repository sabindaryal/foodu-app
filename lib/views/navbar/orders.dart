import 'package:ecommerce/resource/components/skelton/slider_loading_skelton.dart';
import 'package:ecommerce/resource/components/slider_widget.dart';
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
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Consumer<SliderViewModal>(builder: (BuildContext context,
            SliderViewModal sliderProvider, Widget? child) {
          return sliderProvider.isLoading
              ? const SliderLoading()
              : SliderWidget(sliderData: sliderProvider.sliderDate);
        })
      ],
    )));
  }
}
