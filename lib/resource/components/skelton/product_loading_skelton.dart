import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class ProdcutLoading extends StatelessWidget {
  const ProdcutLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SkeletonAnimation(
                  shimmerColor: const Color.fromARGB(255, 202, 201, 201),
                  borderRadius: BorderRadius.circular(20),
                  shimmerDuration: 1000,
                  child: const SizedBox(
                      height: 250,
                      width: 200,
                      child: Card(
                        color: Color.fromARGB(255, 196, 194, 194),
                      ))),
            );
          }),
    );
  }
}
