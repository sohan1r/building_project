import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';
import 'package:snapshot/snapshot.dart';

class MaterialCategory extends StatefulWidget {
  const MaterialCategory({Key? key}) : super(key: key);
  @override
  _MaterialCategoryState createState() => _MaterialCategoryState();
}

class _MaterialCategoryState extends State<MaterialCategory> {
  List<CategoryModel> model = [];
  Future<List<CategoryModel>> fetchJson() async {
    model = [];

    var client = http.Client();
    Response response = await http.get(
      Uri.parse("http://sinoxtrading.in/pooja/api/category"),
    );

    if (response.statusCode == 200) {
      var urJson = jsonDecode(response.body);
      final data = urJson['category'];
      if (data != null) {
        model = List<CategoryModel>.from(
            data.map((e) => CategoryModel.fromJson(e)));
      }
    } else {
      print("Failed to load");
    }
    return model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder<List<CategoryModel>>(
            future: fetchJson(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data == null) {
                  return const Text("No data");
                }
                // else if (snapshot.hasError) {
                //   return Text('${snapshot.error}');
                // }
                else {
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 3),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          width: 150,
                          height: 150,
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
                                        image: NetworkImage(snapshot
                                            .data![index].img
                                            .toString())),
                                  ),
                                  child: Image.network(""),
                                ),
                                Container(
                                  padding: EdgeInsets.zero,
                                  child: Text(
                                      snapshot.data![index].name.toString()),
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
                      });
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.img,
    required this.updatedAt,
    required this.createdAt,
  });

  int id;
  String name;
  String img;
  DateTime updatedAt;
  DateTime createdAt;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        img: json["img"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
      };
}
