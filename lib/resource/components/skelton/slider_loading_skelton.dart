import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SliderLoading extends StatelessWidget {
  const SliderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SkeletonAnimation(
                    shimmerColor: const Color.fromARGB(255, 190, 188, 188),
                    borderRadius: BorderRadius.circular(20),
                    shimmerDuration: 1000,
                    child: Container(
                      height: 150,
                      width: 30,
                      color: const Color.fromARGB(255, 196, 194, 194),
                    ),
                  ),
                )),
            Expanded(
                flex: 8,
                child: SkeletonAnimation(
                  shimmerColor: const Color.fromARGB(255, 202, 201, 201),
                  borderRadius: BorderRadius.circular(20),
                  shimmerDuration: 1000,
                  child: Container(
                    height: 200,
                    color: const Color.fromARGB(255, 204, 202, 202),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SkeletonAnimation(
                    shimmerColor: const Color.fromARGB(255, 204, 202, 202),
                    borderRadius: BorderRadius.circular(20),
                    shimmerDuration: 1000,
                    child: Container(
                      height: 150,
                      width: 30,
                      color: const Color.fromARGB(255, 220, 217, 217),
                    ),
                  ),
                )),
          ],
        ));
  }
}
