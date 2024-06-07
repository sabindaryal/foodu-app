import 'dart:convert';

import 'package:ecommerce/resource/components/button@widgets.dart';
import 'package:ecommerce/resource/components/textformfield@widgets.dart';
import 'package:ecommerce/resource/services/local_storage/auth_storage.dart';
import 'package:ecommerce/resource/utils.dart';
import 'package:ecommerce/views/navbar/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  bool checkBox = false;
  bool isLoading = false;
  TextEditingController usrNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> userLogin() async {
    try {
    

      setState(() {
        isLoading = true;
      });
      Map<String, String> requestHeaders = {
        'Accept': 'application/json',
      };
      var body = {
        "username": usrNameController.text,
        "password": passwordController.text,
        "device_token": "kadhsjfkajshdf"
      };
      final response = await http.post(
          Uri.parse(
              "https://saara24shopping.com/api/v2/ecommerce/customer/login"),
          body: body,
          headers: requestHeaders);

      if (response.statusCode == 200) {
        var token = jsonDecode(response.body)['api_token'];
        var data = jsonDecode(response.body)['data'];

   await  AuthStorage.saveLoginValue(token, data);


        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const MyNavigationBar();
        }));

        setState(() {
          isLoading = false;
        });
      } else {
        ToastMessage.toastMsg("Something went worng", Colors.green);
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Center(
                    child: Image(
                  image: AssetImage("assets/logo.png"),
                  height: 150,
                )),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Login to Your Account",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                // const SizedBox(height: 10,),
                Form(
                    child: Column(children: [
                  TextFormFieldWidgets(
                    controller: usrNameController,
                    hintText: "Phone Number",
                    icon: Icons.phone,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormFieldWidgets(
                    controller: passwordController,
                    hintText: "Password ",
                    icon: Icons.security,
                    keyboardType: TextInputType.name,
                    obscureText: true,
                  ),
                ])),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      activeColor: Colors.green,
                      value: checkBox,
                      onChanged: (value) {
                        setState(() {
                          checkBox =
                              value ?? false; //if value khali xa vane false
                        });
                      },
                    ),
                    const Text(
                      "Remember me",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButtonWidget(
                      isLoading: isLoading,
                      text: "Sign in",
                      onPressed: () {
                        if (!isLoading) {
                          userLogin();
                        }
                      }),
                ),

                const SizedBox(
                  height: 90,
                ),

                const Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Divider(
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Text(
                        "or Continue with",
                        style: TextStyle(
                            color: Color.fromARGB(255, 101, 97, 97),
                            fontSize: 15),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Divider(
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(),
                    SizedBox(
                      // height: 80,
                      // width: 100,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Scaffold();
                          }));
                        },
                        child: const Card(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.facebook,
                              color: Colors.blue,
                              size: 60,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(),
                    const SizedBox(
                      // height: 80,
                      // width: 100,
                      child: Card(
                        // elevation: 0.1 ,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage(
                              "assets/google.png",
                            ),
                            height: 60,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      // height: 80,
                      // width: 100,
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.apple,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
                // const SizedBox(
                //   height: 30,
                // ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Scaffold();
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                        text: const TextSpan(
                            style: TextStyle(
                                color: Color.fromARGB(255, 91, 89, 89)),
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
