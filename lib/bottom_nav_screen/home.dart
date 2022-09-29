import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<HomePage> {
  // Deal of the api call
  // List<DealOfTheDay> model = [];
  // Future<List<DealOfTheDay>> fetchJson() async {
  //   model = [];

  //   var client = http.Client();
  //   Response response = await http.get(
  //     Uri.parse("http://sinoxtrading.in/pooja/api/category"),
  //   );

  //   if (response.statusCode == 200) {
  //     var urJson = jsonDecode(response.body);
  //     final data = urJson['category'];
  //     if (data != null) {
  //       model =
  //           List<DealOfTheDay>.from(data.map((e) => DealOfTheDay.fromJson(e)));
  //     }
  //   } else {
  //     print("Failed to load");
  //   }
  //   return model;
  // }
  // Currently Viewed

  List<CurrentlyViewed> model2 = [];
  Future<List<CurrentlyViewed>> viewedJson() async {
    model2 = [];

    var client = http.Client();
    Response response = await http.get(
      Uri.parse("http://sinoxtrading.in/pooja/api/category"),
    );

    if (response.statusCode == 200) {
      var urJson = jsonDecode(response.body);
      final data = urJson['category'];
      if (data != null) {
        model2 = List<CurrentlyViewed>.from(
            data.map((e) => CurrentlyViewed.fromJson(e)));
      }
    } else {
      print("Failed to load");
    }
    return model2;
  }

  // List<CurrentlyViewed> CurentlyViewdProducts(String responseBody) {
  //   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  //   return parsed.map<CurrentlyViewed>((json) => CurrentlyViewed.fromJson(json));
  //   //return parsed.map<Category>((json) =>
  //   //Category.fromMap(json)).toList();
  // }

  // Future<List<CurrentlyViewed>> fetchCurrentlyViewd() async {
  //   var http;
  //   final response =
  //       await http.get('http://sinoxtrading.in/pooja/api/category');
  //   if (response.statusCode == 200) {
  //     return CurentlyViewdProducts(response.body);
  //   } else {
  //     throw Exception('Unable to fetch products from the REST API');
  //   }
  // }

  // late Future<DealOfTheDay> futureAlbum;

  // late Future<CurrentlyViewed> Recent;

  // @override
  // void initState() {
  //   super.initState();
  //   //Recent = fetchCurrentlyViewd() as Future<CurrentlyViewed>;
  //   futureAlbum = fetchJson() as Future<DealOfTheDay>;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              height: 420,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        //Deal of the day
                        Container(
                          padding: EdgeInsets.zero,
                          child: const Text(
                            "Deal of the day",
                            style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "View All",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: FutureBuilder(
                        future: viewedJson(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10),
                                itemBuilder: ((context, index) {
                                  return Container(
                                    padding: EdgeInsets.zero,
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(snapshot
                                                      .data![index].img))),
                                        ),
                                      ],
                                    ),
                                    // child: GestureDetector(
                                    //   child: Card(
                                    //     elevation: 4,
                                    //     shape: RoundedRectangleBorder(
                                    //         borderRadius:
                                    //             BorderRadius.circular(4)),
                                    //     child: Column(children: [
                                    //       Container(
                                    //         decoration: const BoxDecoration(
                                    //           image: DecorationImage(
                                    //             image: NetworkImage(snapshot.data!.))
                                    //         ),
                                    //       ),
                                    //       Container(
                                    //         padding:
                                    //             const EdgeInsets.only(top: 2),
                                    //         child: const Text('1'),
                                    //       ),
                                    //       Container(
                                    //         padding:
                                    //             const EdgeInsets.only(top: 2),
                                    //         child: Text('Cement'),
                                    //       )
                                    //     ]),
                                    //   ),
                                    // ),
                                  );
                                }),
                                itemCount: snapshot.data.hashCode);
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //Recently Viewed
            Container(
              padding: const EdgeInsets.only(top: 10),
              height: 420,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.zero,
                          child: const Text(
                            "Recently Viewed",
                            style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "View All",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: FutureBuilder(
                        future: viewedJson(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10),
                                itemBuilder: ((context, index) {
                                  return Container(
                                    padding: EdgeInsets.zero,
                                    child: GestureDetector(
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Column(children: [
                                          Image.network(
                                            snapshot.data![index].img,
                                          ),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(top: 2),
                                            child: Text(
                                                snapshot.data![index].name),
                                          ),
                                          // Container(
                                          //   padding:
                                          //       const EdgeInsets.only(top: 2),
                                          //   child: Text(
                                          //       snapshot.data![index].name),
                                          // )
                                        ]),
                                      ),
                                    ),
                                  );
                                }),
                                itemCount: snapshot.data?.length);
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }),
                  )
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: const Text(
                      "Premium brands",
                      style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              height: 500,
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  GestureDetector(
                    child: Card(
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.blueAccent, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          padding: const EdgeInsets.only(top: 0),
                          alignment: Alignment.center,
                          child: Image.network(
                            "https://www.birlaa1.com/images/Birla-A1-cement-logo.png",
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        // const Text(
                        //   "Birla A1",
                        //   style: TextStyle(
                        //     fontSize: 12,
                        //     fontWeight: FontWeight.w200,
                        //     fontStyle: FontStyle.italic,
                        //     decorationStyle: TextDecorationStyle.double,
                        //   ),
                        // ),
                      ]),
                    ),
                  ),
                  GestureDetector(
                    child: Card(
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.blueAccent, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(mainAxisSize: MainAxisSize.max, children: [
                        Container(
                          padding: const EdgeInsets.only(top: 30),
                          alignment: Alignment.center,
                          child: Image.network(
                            "https://www.aquafresh.company/image/cache/Logo/logo-600x315.png",
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // const SizedBox(
                        //   height: 50,
                        // ),
                        // const Text(
                        //   "Insta Blocks",
                        //   textAlign: TextAlign.justify,
                        //   style: TextStyle(
                        //       fontSize: 12,
                        //       fontStyle: FontStyle.italic,
                        //       fontWeight: FontWeight.w400),
                        // ),
                      ]),
                    ),
                  ),
                  GestureDetector(
                    child: Card(
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.blueAccent, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          padding: const EdgeInsets.all(0),
                          alignment: Alignment.center,
                          child: Image.network(
                            "https://cdn-media.buildersmart.in/media/mobile/bmobilebrands/instablock2.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        // const SizedBox(
                        //   height: 0,
                        // ),
                        // const Text(
                        //   "Aqua Fresh",
                        //   style: TextStyle(
                        //       fontSize: 12,
                        //       fontStyle: FontStyle.italic,
                        //       fontWeight: FontWeight.w400),
                        // ),
                      ]),
                    ),
                  ),
                  GestureDetector(
                    child: Card(
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.blueAccent, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          padding: const EdgeInsets.all(0),
                          alignment: Alignment.center,
                          child: Image.network(
                            "https://bowlsdorset.org.uk/public/images/bowls-dorset-logo.png",
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // const SizedBox(
                        //   height: 0,
                        // ),
                        // const Text(
                        //   "Bowls dorset",
                        //   style: TextStyle(
                        //       fontSize: 12,
                        //       fontStyle: FontStyle.italic,
                        //       fontWeight: FontWeight.w400),
                        // ),
                      ]),
                    ),
                  ),
                  GestureDetector(
                    child: Card(
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.blueAccent, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          padding: const EdgeInsets.all(0),
                          alignment: Alignment.center,
                          child: Image.network(
                            "https://equitybulls.com/equitybullsadmin/uploads/Greenpanel%20Industries%20Limited%203.jpg",
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        // const Align(
                        //   alignment: Alignment.bottomCenter,
                        // ),
                        // const Text(
                        //   "Green Panel",
                        //   style: TextStyle(
                        //       fontSize: 12,
                        //       fontStyle: FontStyle.italic,
                        //       fontWeight: FontWeight.w400),
                        // ),
                      ]),
                    ),
                  ),
                  GestureDetector(
                    child: Card(
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.blueAccent, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          padding: const EdgeInsets.all(0),
                          alignment: Alignment.center,
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGY7nz2VHaYZyaf3XPAREsSANvVbOOMok4u7xbZ4N5fMCV8WWgAxPTt7CRs_urWqwScOs&usqp=CAU",
                            fit: BoxFit.fitHeight,
                            alignment: Alignment.center,
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        // const Align(
                        //   alignment: Alignment.bottomCenter,
                        // ),
                        // const Text(
                        //   "Green Panel",
                        //   style: TextStyle(
                        //       fontSize: 12,
                        //       fontStyle: FontStyle.italic,
                        //       fontWeight: FontWeight.w400),
                        // ),
                      ]),
                    ),
                  ),
                  GestureDetector(
                    child: Card(
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.blueAccent, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          padding: const EdgeInsets.all(0),
                          alignment: Alignment.center,
                          child: Image.network(
                            "https://cdn-media.buildersmart.in/media/bmpromo/bmhomepromo/imperial_stonex.jpg",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        const Align(
                          alignment: Alignment.bottomCenter,
                        ),
                      ]),
                    ),
                  ),
                  GestureDetector(
                    child: Card(
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.blueAccent, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          padding: const EdgeInsets.all(0),
                          alignment: Alignment.center,
                          child: Image.network(
                            "https://www.greenstoneaac.com/wp-content/uploads/2021/03/1920-3.jpg",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        const Align(
                          alignment: Alignment.bottomCenter,
                        ),
                        const Text(
                          "Green Panel",
                          style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400),
                        ),
                      ]),
                    ),
                  ),
                  GestureDetector(
                    child: Card(
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.blueAccent, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          padding: const EdgeInsets.all(0),
                          alignment: Alignment.center,
                          child: Image.network(
                            "https://asia.jaquar.com/images/uploaded/jaquarbrandlogo.jpg",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                      ]),
                    ),
                  ),
                  GestureDetector(
                    child: Card(
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.blueAccent, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          padding: const EdgeInsets.all(0),
                          alignment: Alignment.center,
                          child: Image.network(
                            "https://cdn-media.buildersmart.in/media/mobile/bmobilebrands/kshema2.jpg",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        // const SizedBox(
                        //   height: 0,
                        // ),
                        // const Align(
                        //   alignment: Alignment.bottomCenter,
                        // ),
                        // const Padding(
                        //   padding: EdgeInsets.only(bottom: 50.0),
                        //   child: Text(
                        //     "Kshema Technos",
                        //     style: TextStyle(
                        //         fontSize: 12,
                        //         fontStyle: FontStyle.italic,
                        //         fontWeight: FontWeight.w400),
                        //   ),
                        //),
                      ]),
                    ),
                  ),
                  GestureDetector(
                    child: Card(
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.blueAccent, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          padding: const EdgeInsets.all(
                            0,
                          ),
                          alignment: Alignment.center,
                          child: Image.network(
                            "https://imgnew.outlookindia.com/public/uploads/articles/2021/10/21/asian_new.png",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        const SizedBox(),
                        // const Align(
                        //   alignment: Alignment.bottomCenter,
                        // ),
                        // const Padding(
                        //   padding: EdgeInsets.only(top: 50),
                        //   child: Text(
                        //     "Asian paints",
                        //     style: TextStyle(
                        //         fontSize: 12,
                        //         fontStyle: FontStyle.italic,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        //),
                      ]),
                    ),
                  ),
                  GestureDetector(
                    child: Card(
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.blueAccent, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          padding: const EdgeInsets.all(
                            0,
                          ),
                          alignment: Alignment.center,
                          child: Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/3/31/Berger.png",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Deal of the Day API Model
class DealOfTheDay {
  int id;
  String name;
  String img;
  DealOfTheDay({required this.id, required this.name, required this.img});

  factory DealOfTheDay.fromJson(Map<String, dynamic> json) => DealOfTheDay(
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

//Curretly Viewed API model
class CurrentlyViewed {
  int id;
  String name;
  String img;
  CurrentlyViewed({required this.id, required this.name, required this.img});

  factory CurrentlyViewed.fromJson(Map<String, dynamic> json) =>
      CurrentlyViewed(
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
