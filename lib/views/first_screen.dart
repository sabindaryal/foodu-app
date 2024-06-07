import 'package:ecommerce/views/first_next.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  void route() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const Firstnext();
      }));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    route();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            fit: BoxFit.cover,
            height: MediaQuery.of(context)
                .size
                .height // to make fullfit in the screen
            ,
            image: const AssetImage("assets/firstscreen.jpg"),
          ),
          Positioned(
            top: 700,
            left: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 37,
                      fontWeight: FontWeight.w800,
                      shadows: [
                        Shadow(
                            color: Colors.green.withOpacity(0.1),
                            offset: const Offset(10, 10))
                      ]),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        "FOODU!",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 37,
                            fontWeight: FontWeight.w800,
                            shadows: [
                              Shadow(
                                  color: Colors.green.withOpacity(0.1),
                                  offset: const Offset(10, 10))
                            ]),
                      ),
                    ),
                    const FaIcon(
                      FontAwesomeIcons.handSpock,
                      color: Colors.amber,
                      size: 25,
                    )
                  ], // putting faIcons
                ),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
