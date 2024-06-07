import 'dart:convert';

import 'package:ecommerce/model/comment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

bool isLoading = false;

class _MyWidgetState extends State<MyWidget> {
  List<Commentmodel> commentData = [];

  Future<List<Commentmodel>> fetchApi() async {
    try {
      setState(() {
        isLoading = true;
      });

      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        commentData.clear();
        for (var a in data) {
          commentData.add(Commentmodel.fromJson(a));
        }
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      if (kDebugMode) {
        print(error);
      }
    }
    return commentData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      fetchApi();
                    },
                    child: const Text("fetch AIP")),
                isLoading
                    ? const CircularProgressIndicator()
                    : commentData.isEmpty
                        ? const Text("No data")
                        : ListView.builder(
                          physics: const BouncingScrollPhysics() ,
                            shrinkWrap: true,
                            itemCount: commentData.length,
                            itemBuilder: ((context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("${commentData[index].name}"),
                                      Text("${commentData[index].email}"),
                                    ],
                                  ),
                                ),
                              );
                            }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
