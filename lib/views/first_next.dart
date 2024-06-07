import 'package:ecommerce/views/second_next.dart';
import 'package:ecommerce/views/splash_screen.dart';
import 'package:flutter/material.dart';

class Firstnext extends StatefulWidget {
  const Firstnext({super.key});

  @override
  State<Firstnext> createState() => _FirstnextState();
}

class _FirstnextState extends State<Firstnext> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
body: Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Image(image: AssetImage("assets/firstnext.png"),height: 500,fit: BoxFit.cover,),
    
    const Text("Order for Food",style: TextStyle(color: Colors.green,fontSize: 40,fontWeight: FontWeight.w600),),
   
    const Text("Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua.",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
    SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        child: ElevatedButton(style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))
        ),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
        return const Secondnext();
        }));
        }, child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Next",style: TextStyle(color:Colors.white),),
        )),
      ),
    )
  ],
),
    );
  }
}