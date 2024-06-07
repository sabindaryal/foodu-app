import 'dart:convert';

import 'package:ecommerce/model/productmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductScreenApi extends StatefulWidget {
  const ProductScreenApi({super.key});

  @override
  State<ProductScreenApi> createState() => _ProductScreenApiState();
}





class _ProductScreenApiState extends State<ProductScreenApi> {@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchproduct();
  }

bool isLoading=false;
List<ProductModel> product = [];

Future<List<ProductModel>>fetchproduct()async{
try{
  setState(() {
    isLoading =true;
  });
final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

if(response.statusCode==200){
  
product.clear();

var data = jsonDecode(response.body);
for(var a in data){
  product.add(ProductModel.fromJson(a));
}
 setState(() {
    isLoading =false;
  });



}else{
setState(() {
  isLoading=false;
});

}

}

catch(error){
  setState(() {
    isLoading = false;
  });
  print(error);
}
return product;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
           isLoading?const CircularProgressIndicator(): ListView.builder(itemCount: product.length,
            shrinkWrap: true,
            
              itemBuilder: (context,index){
        
        
        ProductModel data=product[index];
        
              return Card(
                child: Column(children: [
                  Image(image: NetworkImage("${data.thumbnailUrl}")),
                ],),
              );
            })
          ],
        ),
      )),
    );
  }
}