import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SellersNearby extends StatefulWidget {
  @override
  _SellersNearby createState() => _SellersNearby();
}

class _SellersNearby extends State<SellersNearby> {
  List<CategoryModel> model = [];
  Future<List<CategoryModel>> fetchJson() async {
    var response = await http.get(
      Uri.parse("http://sinoxtrading.in/pooja/api/category"),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      for (var jsondata in data) {
        model.add(CategoryModel.fromJson(jsondata));
      }
      return model;
    } else {
      return model;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sellers Nearby"),
      ),
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          child: FutureBuilder<List>(
              //future: fetchCategory(),

              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    // (Orientation == Orientation.portrait) ? 3 : 2,
                    mainAxisSpacing: 7,
                    crossAxisSpacing: 7,
                  ),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    var name = snapshot.data![index].name;
                    var image = snapshot.data![index].img;
                    return Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 11, 12, 15)),
                      child: Card(
                        elevation: 4,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    //"https://cdn.vox-cdn.com/thumbor/TmgXcq6_4URVd0YN0SotUf5WYeA=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/9556001/chicks.0.0.0.jpg",
                                    image,
                                  ),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.3),
                              child: Text(
                                name,
                                textAlign: TextAlign.center,
                              ),
                              //child: Image.network(snapshot.data![index].img),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
        )
      ]),
    );
  }
}

class CategoryModel {
  List<Category>? category;
  int? count;

  CategoryModel({this.category, this.count});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? img;
  String? updatedAt;
  String? createdAt;

  Category({this.id, this.name, this.img, this.updatedAt, this.createdAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
