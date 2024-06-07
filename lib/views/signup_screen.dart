import 'package:ecommerce/resource/components/button@widgets.dart';
import 'package:ecommerce/resource/components/textformfield@widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

bool checkBox = false;

class _SignupState extends State<Signup> {

TextEditingController firstNameController =TextEditingController();
TextEditingController lastNameController =TextEditingController();
TextEditingController numberController =TextEditingController();
TextEditingController passwordController =TextEditingController();


@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    numberController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    "assets/logo.png",
                  ),
                  height: 90,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Create New Account",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
                ),
              ),
              // Form(
          
              //   child: Column(
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.all(10.0),
              //         child: TextFormField(
              //             keyboardType: TextInputType.phone,
              //             decoration: const InputDecoration(
              //               focusedBorder: OutlineInputBorder(
              //                   borderSide: BorderSide(
              //                     color: Colors.green,
              //                     width: 2,
              //                   ),
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(15))),
              //               enabledBorder: OutlineInputBorder(
              //                   borderSide: BorderSide(
              //                       color: Color.fromARGB(255, 92, 87, 87),
              //                       width: 2),
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(15))),
              //               prefixIcon: Icon(Icons.phone),
              //               border: OutlineInputBorder(
              //                 borderRadius: BorderRadius.all(Radius.circular(12)),
              //               ),
              //               hintText: "+97798********",
              //             )),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(10.0),
              //         child: TextFormField(
              //             keyboardType: TextInputType.emailAddress,
              //             decoration: const InputDecoration(
              //               focusedBorder: OutlineInputBorder(
              //                   borderSide: BorderSide(
              //                     color: Colors.green,
              //                     width: 2,
              //                   ),
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(15))),
              //               enabledBorder: OutlineInputBorder(
              //                   borderSide: BorderSide(
              //                       color: Color.fromARGB(255, 92, 87, 87),
              //                       width: 2),
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(15))),
              //               prefixIcon: Icon(Icons.email),
              //               border: OutlineInputBorder(
              //                 borderRadius: BorderRadius.all(Radius.circular(12)),
              //               ),
              //               hintText: "Email",
              //             )),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(10.0),
              //         child: TextFormField(
              //             keyboardType: TextInputType.visiblePassword,
              //             decoration: const InputDecoration(
              //               focusedBorder: OutlineInputBorder(
              //                   borderSide: BorderSide(
              //                     color: Colors.green,
              //                     width: 2,
              //                   ),
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(15))),
              //               enabledBorder: OutlineInputBorder(
              //                   borderSide: BorderSide(
              //                       color: Color.fromARGB(255, 92, 87, 87),
              //                       width: 2),
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(15))),
              //               prefixIcon: Icon(Icons.security),
              //               border: OutlineInputBorder(
              //                 borderRadius: BorderRadius.all(Radius.circular(12)),
              //               ),
              //               hintText: "Password",
              //             )),
              //       ),
              //     ],
              //   ),
              // ),
          
                Form(
                  child: Column(
                children: [
              TextFormFieldWidgets(
                controller: firstNameController,
                hintText: "First Name",
                icon: Icons.person,
                keyboardType: TextInputType.name,
                obscureText: false,
              ),
              const SizedBox(height: 10,),
               TextFormFieldWidgets(
                controller: lastNameController,
                hintText: "Last Name",
                icon: Icons.person,
                keyboardType: TextInputType.name,
                obscureText: false,
              ),
              const SizedBox(height: 10,),
               TextFormFieldWidgets(
                controller: numberController,
                hintText: "Phone Number",
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                obscureText: false,
              ),
              const SizedBox(height: 10,),
          
           TextFormFieldWidgets(
                controller: passwordController,
                hintText: "Password",
                icon: Icons.lock,
                keyboardType: TextInputType.name,
                obscureText: true,
              ),
          
                
                ],
              )),
          
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
          
          
          
          ElevatedButtonWidget(text: "Sign up", onPressed: (){
            
          },),
          
          const SizedBox(
            height: 10,
          ),

          //  ElevatedButtonWidget(text: "Login",   textColor: Colors.black, onPressed: (){
            
          // },),
              // const SizedBox(
              //   height: 50,
              //   width: 350,
              //   // child: ElevatedButton(
              //   //   style:
              //   //       ElevatedButton.styleFrom(backgroundColor: Colors.green),
              //   //   onPressed: () {
              //   //     Navigator.push(context,
              //   //         MaterialPageRoute(builder: (context) {
              //   //       return const Scaffold();
              //   //     }));
              //   //   },
              //   //   child: const Text(
              //   //     "Sign up",
              //   //     style: TextStyle(color: Colors.white, fontSize: 16),
              //   //   ),
              //   // ),
              // ),
              const SizedBox(
                height: 50,
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
                height: 30,
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
              const SizedBox(
                height: 30,
              ),
          
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Signup();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                      text: const TextSpan(
                          style:
                              TextStyle(color: Color.fromARGB(255, 91, 89, 89)),
                          children: [
                        TextSpan(
                            text: "Already have a account?",
                            style: TextStyle(
                              fontSize: 15,
                              decoration: TextDecoration.none,
                            )),
                        TextSpan(
                            text: " Sign in",
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
    );
  }
}
