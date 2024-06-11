import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TitleWidgets extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  const TitleWidgets({super.key, required this.title, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return  
         Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                   title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(onTap: onpress,
                    child: const Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                    ),
                  )
                ],
              );
  }
}