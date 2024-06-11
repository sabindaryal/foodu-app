import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/model/slider_model.dart';

class SliderWidget extends StatelessWidget {
  final List<SliderModel> sliderData;

  const SliderWidget({super.key, required this.sliderData});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
      height: 180,
      aspectRatio: 16/9,
      viewportFraction: 1,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.3,
      scrollDirection: Axis.horizontal,
   ),
      items: sliderData.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.all(Radius.circular(40)))
                ,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Image(fit: BoxFit.cover,image: NetworkImage("${i.image}") , errorBuilder: ((context, error, stackTrace) {
                    return const Icon( Icons.error);
                  }),   ),
                ));
          },
        );
      }).toList(),
    );
  }
}
