import 'package:ecommerce/resource/services/local_storage/session_manage.dart';
import 'package:ecommerce/views/first_screen.dart';
import 'package:ecommerce/views/login_choose.dart';
import 'package:ecommerce/views/navbar/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void route() async {
    bool loginStatus = await SessonManage.loginCheck();



    



    Future.delayed(const Duration(seconds: 2), () {
      if (loginStatus) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const MyNavigationBar();
        }));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Loginscreen();
        }));
      }
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
    return const Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            image: AssetImage("assets/logo.png"),
            height: 80,
          ),
          SizedBox(
            width: 15,
          ),
          SizedBox(
            height: 40,
            child: Text(
              "FOODU",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
          )
        ]),
        Padding(
          padding: EdgeInsets.all(14.0),
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        ),
      ],
    ));
  }
}
