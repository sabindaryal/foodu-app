import 'package:ecommerce/views/continuewithapple.dart';
import 'package:ecommerce/views/login_screen.dart';
import 'package:ecommerce/views/loginwithphone.dart';
import 'package:ecommerce/views/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(
              image: AssetImage("assets/login.png"),
            ),
            const Text(
              "Let's you in",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 380,
              height: 60,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Scaffold();
                  }));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.white,
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.facebook,
                          color: Colors.blue,
                        ),
                        Text(
                          "Continue with Facebook",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 380,
              height: 60,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Scaffold();
                  }));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.white,
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // FaIcon(FontAwesomeIcons.google),
                        Image(
                          image: AssetImage("assets/google.png"),
                          height: 22,
                        ),

                        Text(
                          "Continue with Google",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 380,
              height: 60,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (contex) {
                    return const ProductScreenApi();
                  }));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.white,
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.apple,
                          color: Colors.black,
                        ),
                        Text(
                          "Continue with Apple",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Divider(
                    indent: 15,
                    endIndent: 15,
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Text(
                    "or",
                    style: TextStyle(
                        color: Color.fromARGB(255, 101, 97, 97), fontSize: 15),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Divider(
                    indent: 15,
                    endIndent: 15,
                  ),
                ),
              ],
            ),
            // Row(children: [
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Container(height: 1,color: Colors.amber,width: MediaQuery.of(context).size.width/2-30, ),
            //   ),
            //   // const SizedBox(width: 10,),
            //   const Padding(
            //     padding: EdgeInsets.all(8.0),
            //     child: Text("or"),
            //   ),
            //   // const SizedBox(width: 10,),
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Container(height: 1,color: Colors.amber,width: MediaQuery.of(context).size.width/2-30),
            //   ),

            // ],)
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const PhoneLogin();
                    }));
                  },
                  child: const Text(
                    "Sign in with Phone Number",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Signup();
                }));
              },
              child: RichText(
                  text: const TextSpan(
                      style: TextStyle(color: Color.fromARGB(255, 91, 89, 89)),
                      children: [
                    TextSpan(
                        text: "Don't have a account?",
                        style: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                        )),
                    TextSpan(
                        text: " Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.green,
                          // decoration: TextDecoration.none,
                        ))
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
