import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';

class favoritePage extends StatefulWidget {
  const favoritePage({Key? key}) : super(key: key);
  @override
  _favoritePageState createState() => _favoritePageState();
}

class _favoritePageState extends State<favoritePage> {
  // final List<Category> model = [];
  // Future<List<Category>> fetchJson() async {
  //   var client = http.Client();
  //   Response response = await http.get(
  //     Uri.parse("http://sinoxtrading.in/pooja/api/category"),
  //   );
  //   List<Category> uList = [];

  //   if (response.statusCode == 200) {
  //     var urJson = jsonDecode(response.body);

  //     for (var jsondata in urJson) {
  //       uList.add(Category.fromJson(jsondata));
  //     }
  //   } else {
  //     print("Failed to load");
  //   }
  //   return uList;
  // }

  Future<Category> fetchJson() async {
    final response =
        await http.get(Uri.parse('http://sinoxtrading.in/pooja/api/category'));
    List<Category> uList = [];
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return Category.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite items"),
      ),
      body: Center(
        child: FutureBuilder<Category>(
            future: fetchJson(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 3),
                    itemCount: snapshot.hasData.toString().length,
                    itemBuilder: ((context, index) {
                      return Container(
                        padding: EdgeInsets.zero,
                        decoration:
                            const BoxDecoration(color: Colors.blueAccent),
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '${snapshot.data?.img}')),
                                ),
                                // child: Image(
                                //     image:
                                //         NetworkImage('${snapshot.data?.img}')),
                              ),
                              Container(
                                padding: EdgeInsets.zero,
                                child: Text(snapshot.data!.name),
                              ),
                              // Container(
                              //   padding: EdgeInsets.zero,

                              // ),
                              const FittedBox(
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                      );
                    }));
                // return GridView.builder(
                //     itemCount: snapshot.data!.length,
                //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 2),
                //     itemBuilder: (context, index) {
                //       return Padding(
                //         padding: EdgeInsets.all(5),
                // child: Container(
                //     decoration: BoxDecoration(
                //         image:  DecorationImage(
                //             image:  NetworkImage(
                //               snapshot.data![index].img),

                //             fit: BoxFit.cover),
                //             ))
                // child: Column(
                //   children: [
                //     // Container(
                //     //     decoration: BoxDecoration(
                //     //   image: DecorationImage(
                //     //       image: NetworkImage(snapshot.data![index].img),
                //     //       fit: BoxFit.cover),
                //     // )),
                //     Container(
                //       padding: EdgeInsets.zero,
                //       child: Text(snapshot.data![index].name),
                //     ),
                //   ],
                // ),
                //);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
              //);
            }
            // return Center(child: CircularProgressIndicator());
            //},
            ),
      ),
    );
  }
}

class Category {
  int id;
  String name;
  String img;
  Category({required this.id, required this.name, required this.img});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'],
        name: json['name'],
        img: json['img'],
      );
  Map<String, dynamic> tojson() => {
        'id': id,
        'name': name,
        'img': img,
      };
}
